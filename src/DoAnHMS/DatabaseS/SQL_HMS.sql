USE [master]
GO
/****** Object:  Database [doanKS]    Script Date: 21/04/2026 11:04:09 PM ******/
CREATE DATABASE [doanKS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'doanKS', FILENAME = N'D:\SQL\MSSQL17.SQLEXPRESS\MSSQL\DATA\doanKS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'doanKS_log', FILENAME = N'D:\SQL\MSSQL17.SQLEXPRESS\MSSQL\DATA\doanKS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [doanKS] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [doanKS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [doanKS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [doanKS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [doanKS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [doanKS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [doanKS] SET ARITHABORT OFF 
GO
ALTER DATABASE [doanKS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [doanKS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [doanKS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [doanKS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [doanKS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [doanKS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [doanKS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [doanKS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [doanKS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [doanKS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [doanKS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [doanKS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [doanKS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [doanKS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [doanKS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [doanKS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [doanKS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [doanKS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [doanKS] SET  MULTI_USER 
GO
ALTER DATABASE [doanKS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [doanKS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [doanKS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [doanKS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [doanKS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [doanKS] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [doanKS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [doanKS] SET QUERY_STORE = ON
GO
ALTER DATABASE [doanKS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [doanKS]
GO
/****** Object:  Table [dbo].[CTPhieuDatPhong]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuDatPhong](
	[maPDP] [varchar](10) NOT NULL,
	[maP] [varchar](10) NOT NULL,
	[tienCoc] [decimal](18, 0) NOT NULL,
 CONSTRAINT [ctpdp_pk] PRIMARY KEY CLUSTERED 
(
	[maPDP] ASC,
	[maP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPhieuThuePhong]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuThuePhong](
	[maPTP] [varchar](10) NOT NULL,
	[maP] [varchar](10) NOT NULL,
	[ngaySD] [datetime] NOT NULL,
	[maDV] [varchar](10) NOT NULL,
	[soLuong] [int] NOT NULL,
 CONSTRAINT [ctptp_pk] PRIMARY KEY CLUSTERED 
(
	[maPTP] ASC,
	[maP] ASC,
	[ngaySD] ASC,
	[maDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachQuyen]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachQuyen](
	[IDNhom] [varchar](20) NOT NULL,
	[IDQuyen] [varchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhSachQuyen] PRIMARY KEY CLUSTERED 
(
	[IDNhom] ASC,
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[maDV] [varchar](10) NOT NULL,
	[tenDV] [nvarchar](50) NOT NULL,
	[gia] [decimal](18, 0) NOT NULL,
 CONSTRAINT [dv_pk] PRIMARY KEY CLUSTERED 
(
	[maDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHD] [varchar](10) NOT NULL,
	[ngayTT] [datetime] NOT NULL,
	[maPTP] [varchar](10) NOT NULL,
	[maNV] [varchar](10) NOT NULL,
	[tongTien] [decimal](18, 0) NOT NULL,
 CONSTRAINT [hd_pk] PRIMARY KEY CLUSTERED 
(
	[maPTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [varchar](10) NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[gioiTinh] [bit] NOT NULL,
	[cmnd_passport] [varchar](15) NOT NULL,
	[diaChi] [nvarchar](50) NOT NULL,
	[quocTich] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
 CONSTRAINT [kh_pk] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hoTen] [nvarchar](50) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[ngayGui] [date] NOT NULL,
	[tinhTrang] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[maLP] [varchar](10) NOT NULL,
	[tenLP] [nvarchar](50) NOT NULL,
	[hinhAnh] [varchar](250) NOT NULL,
	[sucChua] [int] NOT NULL,
	[donGia] [decimal](18, 0) NOT NULL,
	[moTa] [nvarchar](500) NULL,
 CONSTRAINT [lp_pk] PRIMARY KEY CLUSTERED 
(
	[maLP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNV] [varchar](10) NOT NULL,
	[tenNV] [nvarchar](50) NOT NULL,
	[gioiTinh] [bit] NOT NULL,
	[ngaySinh] [date] NOT NULL,
	[diaChi] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[hinhAnh] [varchar](250) NOT NULL,
 CONSTRAINT [nv_pk] PRIMARY KEY CLUSTERED 
(
	[maNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomNhanVien]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomNhanVien](
	[IDNhom] [varchar](20) NOT NULL,
	[TenNhom] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhomNhanVien] PRIMARY KEY CLUSTERED 
(
	[IDNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hoTen] [nvarchar](50) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[noiDung] [varchar](500) NOT NULL,
	[ngayGui] [date] NOT NULL,
	[tinhTrang] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatPhong]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatPhong](
	[maPDP] [varchar](10) NOT NULL,
	[maKH] [varchar](10) NOT NULL,
	[ngayDen] [date] NOT NULL,
	[ngayDi] [date] NOT NULL,
	[tongTienCoc] [decimal](18, 0) NOT NULL,
	[soNguoi] [int] NOT NULL,
	[tinhTrang] [bit] NOT NULL,
	[maNV] [varchar](10) NOT NULL,
 CONSTRAINT [pdp_pk] PRIMARY KEY CLUSTERED 
(
	[maPDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuThuePhong]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThuePhong](
	[maPTP] [varchar](10) NOT NULL,
	[maPDP] [varchar](10) NOT NULL,
	[maKH] [varchar](10) NOT NULL,
	[maNV] [varchar](10) NOT NULL,
	[ngayThue] [date] NOT NULL,
	[ngayTra] [date] NOT NULL,
 CONSTRAINT [ptp_pk] PRIMARY KEY CLUSTERED 
(
	[maPTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[maP] [varchar](10) NOT NULL,
	[maLP] [varchar](10) NOT NULL,
	[tinhTrang] [nvarchar](20) NOT NULL,
 CONSTRAINT [p_pk] PRIMARY KEY CLUSTERED 
(
	[maP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTri]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTri](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[tinhTrang] [bit] NOT NULL,
	[maNV] [varchar](10) NOT NULL,
	[IDNhom] [varchar](20) NOT NULL,
 CONSTRAINT [qt_pk] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[IDQuyen] [varchar](50) NOT NULL,
	[TenQuyen] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0001', N'P102', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0002', N'P201', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0002', N'P202', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0003', N'P101', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0004', N'P104', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0004', N'P203', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0005', N'P302', CAST(300000 AS Decimal(18, 0)))
GO
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'ADD_CUSTOMER', NULL)
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'DELETE_CUSTOMER', NULL)
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'DETAILS_CUSTOMER', NULL)
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'EDIT_CUSTOMER', NULL)
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'VIEW_CUSTOMER', NULL)
GO
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0001', N'Điểm Tâm', CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0002', N'Cơm trưa', CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0003', N'Cocacola lon', CAST(25000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0004', N'Pessi chai', CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0005', N'Giặt Ủi', CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0006', N'Lavie', CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0007', N'Bia ', CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0008', N'Buffet', CAST(450000 AS Decimal(18, 0)))
GO
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0001', N'Võ Minh Quân', 1, N'079223456715', N'Nha Trang', N'Việt Nam', N'vominhquan@gmail.com', N'03338888999')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0002', N'Nguyễn Thảo Vy', 1, N'079223456716', N'Cần Thơ', N'Việt Nam', N'nguyenthaovy@gmail.com', N'123456780')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0003', N'Trần Gia Bảo', 1, N'079223456717', N'Hải Phòng', N'Việt Nam', N'trangiabao@gmail.com', N'123456787')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0004', N'Trần Đức Tín', 1, N'225923604', N'Nam Định', N'Việt Nam', N'tranductin@gmail.com', N'123456786')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0005', N'Cao Chí HÙng', 1, N'225923605', N'Ninh Hòa', N'Việt Nam', N'caochihung@gmail.com', N'123456785')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0006', N'Đặng Mỹ Linh', 0, N'079223456720', N'Cam Ranh', N'Việt Nam', N'dangmylinh@gmail.com', N'123456784')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0007', N'Lý Thanh Toàn', 1, N'225923607', N'Hà Nội', N'Việt Nam', N'lythanhtoan@gmail.com', N'123456783')
GO
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([id], [hoTen], [sdt], [email], [ngayGui], [tinhTrang]) VALUES (1004, N'le', N'03588', N'nhutleminh4@gmail.com', CAST(N'2026-04-16' AS Date), 0)
INSERT [dbo].[LienHe] ([id], [hoTen], [sdt], [email], [ngayGui], [tinhTrang]) VALUES (1005, N'le', N'03588', N'nhutleminh4@gmail.com', CAST(N'2026-04-16' AS Date), 0)
SET IDENTITY_INSERT [dbo].[LienHe] OFF
GO
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'DBL', N'Phòng đôi', N'double.jpg', 2, CAST(800000 AS Decimal(18, 0)), N'Đây là phòng 1 giường đôi')
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'SGL', N'phòng đơn', N'single.jpg', 1, CAST(400000 AS Decimal(18, 0)), N'Đây là phòng 1 giường đơn')
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'TRPL1', N'phòng 3', N'single.jpg', 3, CAST(1000000 AS Decimal(18, 0)), N'Đây là phòng 3 giường đơn')
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'TWN', N'TWIN', N'twin.jpg', 2, CAST(700000 AS Decimal(18, 0)), N'')
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'VIP', N'VIP1', N'VIP1.jpg', 2, CAST(2000000 AS Decimal(18, 0)), N'Đây là phòng ViP')
GO
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [gioiTinh], [ngaySinh], [diaChi], [email], [sdt], [hinhAnh]) VALUES (N'NV0001', N'lÊ MINH NHƯT', 1, CAST(N'1992-10-07' AS Date), N'TÂY MINH', N'NHUTLEMINH1504@gmail.com', N'0353303411', N'avatar.jpg')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [gioiTinh], [ngaySinh], [diaChi], [email], [sdt], [hinhAnh]) VALUES (N'NV0002', N'NHUT LE MINH', 1, CAST(N'1992-10-07' AS Date), N'TÂY NINH', N'NHUTLEMINH1504@gmail.com', N'01234571819', N'avatar.jpg')
GO
INSERT [dbo].[NhomNhanVien] ([IDNhom], [TenNhom]) VALUES (N'ADMIN', N'Quản trị hệ thống')
INSERT [dbo].[NhomNhanVien] ([IDNhom], [TenNhom]) VALUES (N'NHANVIEN', N'Nhân viên')
GO
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([id], [hoTen], [sdt], [email], [noiDung], [ngayGui], [tinhTrang]) VALUES (1, N'Đặng Mỹ Linh', N'123456800', N'dangmylinh@gmail.com', N'Best service', CAST(N'2026-04-05' AS Date), 0)
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
GO
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0001', N'KH0001', CAST(N'2026-03-17' AS Date), CAST(N'2026-03-25' AS Date), CAST(300000 AS Decimal(18, 0)), 1, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0002', N'KH0002', CAST(N'2026-04-22' AS Date), CAST(N'2026-04-25' AS Date), CAST(600000 AS Decimal(18, 0)), 3, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0003', N'KH0003', CAST(N'2026-04-17' AS Date), CAST(N'2026-04-30' AS Date), CAST(300000 AS Decimal(18, 0)), 3, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0004', N'KH0004', CAST(N'2026-04-01' AS Date), CAST(N'2026-04-25' AS Date), CAST(600000 AS Decimal(18, 0)), 4, 1, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0005', N'KH0007', CAST(N'2026-04-11' AS Date), CAST(N'2022-11-29' AS Date), CAST(300000 AS Decimal(18, 0)), 2, 0, N'NV0002')
GO
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0001', N'PDP0001', N'KH0001', N'NV0001', CAST(N'2026-03-19' AS Date), CAST(N'2026-03-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0002', N'PDP0002', N'KH0002', N'NV0002', CAST(N'2026-04-22' AS Date), CAST(N'2026-05-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0003', N'PDP0003', N'KH0003', N'NV0001', CAST(N'2026-05-17' AS Date), CAST(N'2026-05-27' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0004', N'PDP0004', N'KH0004', N'NV0001', CAST(N'2026-11-10' AS Date), CAST(N'2026-12-21' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0005', N'PDP0005', N'KH0005', N'NV0002', CAST(N'2026-11-11' AS Date), CAST(N'2022-11-29' AS Date))
GO
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P101', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P102', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P103', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P104', N'TWN', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P105', N'TRPL1', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P201', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P202', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P203', N'TWN', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P204', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P205', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P301', N'VIP', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P302', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P303', N'VIP', N'Trống')
GO
INSERT [dbo].[QuanTri] ([username], [password], [tinhTrang], [maNV], [IDNhom]) VALUES (N'admin', N'e10adc3949ba59abbe56e057f20f883e', 1, N'NV0001', N'ADMIN')
INSERT [dbo].[QuanTri] ([username], [password], [tinhTrang], [maNV], [IDNhom]) VALUES (N'nv', N'e10adc3949ba59abbe56e057f20f883e', 1, N'NV0001', N'NHANVIEN')
GO
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'ADD_CUSTOMER', N'Thêm khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'ADD_USER', N'Thêm người dùng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'DELETE_CUSTOMER', N'Xóa khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'DELETE_USER', N'Xóa người dùng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'DETAILS_CUSTOMER', N'Xem thông tin chi tiết khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'EDIT_CUSTOMER', N'Sửa khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'EDIT_USER', N'Sửa người dùng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'VIEW_CUSTOMER', N'Xem danh sách khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'VIEW_USER', N'Xem danh sách người dùng')
GO
ALTER TABLE [dbo].[QuanTri] ADD  CONSTRAINT [DF_QuanTri_IDNhom]  DEFAULT ('NHANVIEN') FOR [IDNhom]
GO
ALTER TABLE [dbo].[CTPhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [ctpdp_p_fk] FOREIGN KEY([maP])
REFERENCES [dbo].[Phong] ([maP])
GO
ALTER TABLE [dbo].[CTPhieuDatPhong] CHECK CONSTRAINT [ctpdp_p_fk]
GO
ALTER TABLE [dbo].[CTPhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [ctpdp_pdp_fk] FOREIGN KEY([maPDP])
REFERENCES [dbo].[PhieuDatPhong] ([maPDP])
GO
ALTER TABLE [dbo].[CTPhieuDatPhong] CHECK CONSTRAINT [ctpdp_pdp_fk]
GO
ALTER TABLE [dbo].[CTPhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ctptp_dv_fk] FOREIGN KEY([maDV])
REFERENCES [dbo].[DichVu] ([maDV])
GO
ALTER TABLE [dbo].[CTPhieuThuePhong] CHECK CONSTRAINT [ctptp_dv_fk]
GO
ALTER TABLE [dbo].[CTPhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ctptp_p_fk] FOREIGN KEY([maP])
REFERENCES [dbo].[Phong] ([maP])
GO
ALTER TABLE [dbo].[CTPhieuThuePhong] CHECK CONSTRAINT [ctptp_p_fk]
GO
ALTER TABLE [dbo].[CTPhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ctptp_ptp_fk] FOREIGN KEY([maPTP])
REFERENCES [dbo].[PhieuThuePhong] ([maPTP])
GO
ALTER TABLE [dbo].[CTPhieuThuePhong] CHECK CONSTRAINT [ctptp_ptp_fk]
GO
ALTER TABLE [dbo].[DanhSachQuyen]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachQuyen_NhomNhanVien] FOREIGN KEY([IDNhom])
REFERENCES [dbo].[NhomNhanVien] ([IDNhom])
GO
ALTER TABLE [dbo].[DanhSachQuyen] CHECK CONSTRAINT [FK_DanhSachQuyen_NhomNhanVien]
GO
ALTER TABLE [dbo].[DanhSachQuyen]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachQuyen_Quyen] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[Quyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[DanhSachQuyen] CHECK CONSTRAINT [FK_DanhSachQuyen_Quyen]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [hd_nv_fk] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [hd_nv_fk]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [hd_ptp_fk] FOREIGN KEY([maPTP])
REFERENCES [dbo].[PhieuThuePhong] ([maPTP])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [hd_ptp_fk]
GO
ALTER TABLE [dbo].[PhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [pdp_kh_fk] FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[PhieuDatPhong] CHECK CONSTRAINT [pdp_kh_fk]
GO
ALTER TABLE [dbo].[PhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [pdp_nv_fk] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[PhieuDatPhong] CHECK CONSTRAINT [pdp_nv_fk]
GO
ALTER TABLE [dbo].[PhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ptp_kh_fk] FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[PhieuThuePhong] CHECK CONSTRAINT [ptp_kh_fk]
GO
ALTER TABLE [dbo].[PhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ptp_nv_fk] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[PhieuThuePhong] CHECK CONSTRAINT [ptp_nv_fk]
GO
ALTER TABLE [dbo].[PhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ptp_pdp_fk] FOREIGN KEY([maPDP])
REFERENCES [dbo].[PhieuDatPhong] ([maPDP])
GO
ALTER TABLE [dbo].[PhieuThuePhong] CHECK CONSTRAINT [ptp_pdp_fk]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [p_lp_fk] FOREIGN KEY([maLP])
REFERENCES [dbo].[LoaiPhong] ([maLP])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [p_lp_fk]
GO
ALTER TABLE [dbo].[QuanTri]  WITH CHECK ADD  CONSTRAINT [qt_nnv_fk] FOREIGN KEY([IDNhom])
REFERENCES [dbo].[NhomNhanVien] ([IDNhom])
GO
ALTER TABLE [dbo].[QuanTri] CHECK CONSTRAINT [qt_nnv_fk]
GO
ALTER TABLE [dbo].[QuanTri]  WITH CHECK ADD  CONSTRAINT [qt_nv_fk] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[QuanTri] CHECK CONSTRAINT [qt_nv_fk]
GO
/****** Object:  StoredProcedure [dbo].[KhachHang_TimKiem]    Script Date: 21/04/2026 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[KhachHang_TimKiem]
	@maKH varchar(10) =null,
	@tenKH nvarchar(50) =null,
	@gioiTinh nvarchar(3) =null,
	@cmnd_passport varchar(15) =null,
	@diaChi nvarchar(50) =null,
	@quocTich nvarchar(50) =null,
	@email varchar(50) =null,
	@sdt varchar(20) =null
as
begin
declare @SqlStr nvarchar(4000),
		@ParamList nvarchar(2000)
select @SqlStr ='select * from KhachHang where (1=1)'
if @maKH is not null 
	select @SqlStr = @SqlStr + ' and ( maKH like ''%'+@maKH+'%'') '
if @tenKH is not null
	select @SqlStr = @SqlStr + 'and (tenKH like N''%'+@tenKH+'%'')'
if @gioiTinh is not null
	select @SqlStr = @SqlStr + 'and (gioiTinh like ''%'+ @gioiTinh+'%'')'
if @cmnd_passport is not null
	select @SqlStr = @SqlStr + 'and (cmnd_passport like ''%'+@cmnd_passport+'%'')'
if @diaChi is not null
	select @SqlStr = @SqlStr + 'and (diaChi like N''%'+@diaChi+'%'')'
if @quocTich is not null
	select @SqlStr = @SqlStr + 'and (quocTich like N''%'+@quocTich+'%'')'
if @email is not null
	select @SqlStr = @SqlStr + 'and (email like ''%'+@email+'%'')'
if @sdt is not null
	select @SqlStr = @SqlStr + 'and (sdt like ''%'+@sdt+'%'')'

exec sp_executesql @SqlStr
end
GO
USE [master]
GO
ALTER DATABASE [doanKS] SET  READ_WRITE 
GO
