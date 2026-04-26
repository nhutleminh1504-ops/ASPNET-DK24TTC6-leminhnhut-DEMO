using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DoAnHMS.Common;
using DoAnHMS.Models;

namespace DoAnHMS.Controllers
{
    public class HoaDonsController : BaseController
    {
        private doanKSEntities db = new doanKSEntities();

        string LayMaHD()
        {
           
            var maMax = db.HoaDons.OrderByDescending(n => n.maHD).Select(n => n.maHD).FirstOrDefault();
            int index = 1;

            if (maMax != null)
            {
              
                int.TryParse(maMax.Substring(2), out index);
                index++;
            }

            return "HD" + index.ToString("D4");
        }

        [HasCredential(IDQuyen = "LAPHOADON")]
        public ActionResult Index()
        {
            var hoaDons = db.HoaDons.Include(h => h.NhanVien).Include(h => h.PhieuThuePhong).OrderByDescending(x => x.ngayTT);
            return View(hoaDons.ToList());
        }

        [HasCredential(IDQuyen = "LAPHOADON")]
        public ActionResult Details(string id)
        {
            if (id == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            HoaDon hoaDon = db.HoaDons.Include(h => h.PhieuThuePhong.KhachHang).FirstOrDefault(x => x.maHD == id);
            if (hoaDon == null) return HttpNotFound();
            return View(hoaDon);
        }

        [HasCredential(IDQuyen = "LAPHOADON")]
        public ActionResult Create()
        {
            ViewBag.maHD = LayMaHD();
            var session = (UserLogin)HttpContext.Session[CommonConstants.USER_SESSION];
            var maNV = db.QuanTris.Where(x => x.username == session.UserName).Select(x => x.maNV).SingleOrDefault();

            ViewBag.maNV = new SelectList(db.NhanViens, "maNV", "tenNV", maNV);

       
            var listPhieuDaThanhToan = db.HoaDons.Select(x => x.maPTP).ToList();
            var phieuThuePhongs = db.PhieuThuePhongs
                                    .Where(x => !listPhieuDaThanhToan.Contains(x.maPTP))
                                    .ToList();

            ViewBag.maPTP = new SelectList(phieuThuePhongs, "maPTP", "maPTP");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredential(IDQuyen = "LAPHOADON")]
        public ActionResult Create([Bind(Include = "maHD,ngayTT,maPTP")] HoaDon hoaDon)
        {
            var session = (UserLogin)HttpContext.Session[CommonConstants.USER_SESSION];
            var maNV = db.QuanTris.Where(x => x.username == session.UserName).Select(x => x.maNV).SingleOrDefault();

            if (ModelState.IsValid)
            {
                hoaDon.maNV = maNV;
                decimal tongTien = 0, tienDV = 0, tienPhong = 0, tienCoc = 0;

                PhieuThuePhong phieuThuePhong = db.PhieuThuePhongs
                                                  .Include(x => x.CTPhieuThuePhongs.Select(d => d.DichVu))
                                                  .FirstOrDefault(x => x.maPTP == hoaDon.maPTP);

                if (phieuThuePhong != null)
                {
                   
                    var listMaP = new HashSet<string>();
                    foreach (var item in phieuThuePhong.CTPhieuThuePhongs)
                    {
                        tienDV += (item.DichVu != null ? item.DichVu.gia : 0) * item.soLuong;
                        listMaP.Add(item.maP);
                    }

                   
                    var phongs = db.Phongs.Include(p => p.LoaiPhong).Where(p => listMaP.Contains(p.maP)).ToList();
                    foreach (var p in phongs)
                    {
                        tienPhong += p.LoaiPhong.donGia;
                    }

                  
                    TimeSpan difference = (hoaDon.ngayTT > phieuThuePhong.ngayThue) ? (hoaDon.ngayTT - phieuThuePhong.ngayThue) : TimeSpan.FromDays(0);
                    decimal days = (decimal)Math.Ceiling(difference.TotalDays);
                    if (days <= 0) days = 1;

                    tienPhong *= days;

                  
                    if (!string.IsNullOrEmpty(phieuThuePhong.maPDP))
                    {
                        tienCoc = db.CTPhieuDatPhongs
                                    .Where(x => x.maPDP == phieuThuePhong.maPDP && listMaP.Contains(x.maP))
                                    .Sum(x => (decimal?)x.tienCoc) ?? 0;
                    }

                    tongTien = tienDV + tienPhong - tienCoc;
                    hoaDon.tongTien = tongTien;
                    db.HoaDons.Add(hoaDon);

                    foreach (var p in phongs)
                    {
                        p.tinhTrang = "Trống";
                        db.Entry(p).State = EntityState.Modified;
                    }

                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }

            ViewBag.maHD = LayMaHD();
            ViewBag.maNV = new SelectList(db.NhanViens, "maNV", "tenNV", maNV);
            ViewBag.maPTP = new SelectList(db.PhieuThuePhongs, "maPTP", "maPTP", hoaDon.maPTP);
            return View(hoaDon);
        }

      
    }
}