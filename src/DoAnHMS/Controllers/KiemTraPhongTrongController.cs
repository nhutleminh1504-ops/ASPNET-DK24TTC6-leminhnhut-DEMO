using DoAnHMS.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace DoAnHMS.Controllers
{
    public class KiemTraPhongTrongController : BaseController
    {
        doanKSEntities db = new doanKSEntities();

        [HttpGet]
        public ActionResult Index()
        {
            return View(db.Phongs.ToList());
        }

        [HttpPost]
        public ActionResult Index(string ngayDen, string ngayDi)
        {
            ViewBag.ngayDen = ngayDen;
            ViewBag.ngayDi = ngayDi;

            if (string.IsNullOrWhiteSpace(ngayDen) || string.IsNullOrWhiteSpace(ngayDi))
            {
                ViewBag.Error = "Vui lòng nhập đầy đủ ngày đến và ngày đi!";
                return View(db.Phongs.ToList());
            }

            DateTime dt1 = Convert.ToDateTime(ngayDen);
            DateTime dt2 = Convert.ToDateTime(ngayDi);

            var dsPhongDaThue = db.CTPhieuThuePhongs
                .Where(x => x.PhieuThuePhong.ngayThue <= dt2
                         && x.PhieuThuePhong.ngayTra >= dt1)
                .Select(x => x.maP)
                .ToList();

            var phongTrong = db.Phongs
                .Where(p => !dsPhongDaThue.Contains(p.maP))
                .ToList();

            return View(phongTrong);
        }
    }
}