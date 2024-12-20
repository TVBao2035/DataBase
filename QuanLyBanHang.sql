create database BanDoThoiTrang
go
USE [BanDoThoiTrang]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 19/10/2024 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaChiTietDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaDonHang] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NOT NULL,
	[Gia] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 19/10/2024 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NOT NULL,
	[MoTaDanhMuc] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 19/10/2024 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[Ngaydat] [datetime] NULL DEFAULT (getdate()),
	[TrangThai] [nvarchar](50) NOT NULL,
	[TongTien] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 19/10/2024 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTenKH] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[SoDienThoaiKH] [nvarchar](15) NULL,
	[DiaChiKH] [nvarchar](max) NULL,
	[Ngaytao] [datetime] NULL DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 19/10/2024 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[MoTaSP] [nvarchar](max) NULL,
	[Gia] [decimal](10, 2) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[MaDanhMuc] [int] NULL,
	[Ngaytao] [datetime] NULL DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSP], [SoLuong], [Gia]) VALUES (1, 1, 1, 2, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSP], [SoLuong], [Gia]) VALUES (2, 1, 2, 1, CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSP], [SoLuong], [Gia]) VALUES (3, 2, 3, 1, CAST(900000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MoTaDanhMuc]) VALUES (1, N'Áo', N'Các loại áo thời trang')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MoTaDanhMuc]) VALUES (2, N'Quần', N'Các loại quần thời trang')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MoTaDanhMuc]) VALUES (3, N'Giày', N'Giày dép các loại')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [MoTaDanhMuc]) VALUES (4, N'Phụ kiện', N'Phụ kiện thời trang')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [Ngaydat], [TrangThai], [TongTien]) VALUES (1, NULL, CAST(N'2024-10-10 14:25:03.433' AS DateTime), N'Đang xử lý', CAST(450000.00 AS Decimal(10, 2)))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [Ngaydat], [TrangThai], [TongTien]) VALUES (2, NULL, CAST(N'2024-10-10 14:25:03.433' AS DateTime), N'Đã giao', CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [Ngaydat], [TrangThai], [TongTien]) VALUES (3, NULL, CAST(N'2024-10-10 14:33:30.843' AS DateTime), N'Đã giao', CAST(300000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [email], [SoDienThoaiKH], [DiaChiKH], [Ngaytao], [NgayCapNhat]) VALUES (1, N'Nguyễn Văn C', N'vanc@gmail.com', N'0901112233', N'Hà Nội', CAST(N'2024-10-10 14:25:03.430' AS DateTime), CAST(N'2024-10-10 14:25:03.430' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [email], [SoDienThoaiKH], [DiaChiKH], [Ngaytao], [NgayCapNhat]) VALUES (2, N'Lê Thị D', N'led@gmail.com', N'0904445566', N'H? Chí Minh', CAST(N'2024-10-10 14:25:03.430' AS DateTime), CAST(N'2024-10-10 14:25:03.430' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [email], [SoDienThoaiKH], [DiaChiKH], [Ngaytao], [NgayCapNhat]) VALUES (3, N'Phạm Văn E', N'vane@gmail.com', N'0907778899', N'Ðà N?ng', CAST(N'2024-10-10 14:25:03.430' AS DateTime), CAST(N'2024-10-10 14:25:03.430' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [email], [SoDienThoaiKH], [DiaChiKH], [Ngaytao], [NgayCapNhat]) VALUES (4, N'Trần Thị F', N'ftran@gmail.com', N'0908889900', N'Nha Trang', CAST(N'2024-10-10 14:25:03.430' AS DateTime), CAST(N'2024-10-10 14:25:03.430' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [email], [SoDienThoaiKH], [DiaChiKH], [Ngaytao], [NgayCapNhat]) VALUES (5, N'Nguyễn Thị G', N'gnguyen@gmail.com', N'0902222333', N'H?i Phòng', CAST(N'2024-10-10 14:25:03.430' AS DateTime), CAST(N'2024-10-10 14:25:03.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [Gia], [SoLuong], [MaDanhMuc], [Ngaytao], [NgayCapNhat]) VALUES (1, N'Áo sơ mi trắng', N'Áo sơ mi trắng phong cách', CAST(250000.00 AS Decimal(10, 2)), 40, 1, CAST(N'2024-10-10 14:25:03.427' AS DateTime), CAST(N'2024-10-10 14:25:03.427' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [Gia], [SoLuong], [MaDanhMuc], [Ngaytao], [NgayCapNhat]) VALUES (2, N'Quần kaki', N'Quần kaki thoải mái', CAST(300000.00 AS Decimal(10, 2)), 25, 2, CAST(N'2024-10-10 14:25:03.427' AS DateTime), CAST(N'2024-10-10 14:25:03.427' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [Gia], [SoLuong], [MaDanhMuc], [Ngaytao], [NgayCapNhat]) VALUES (3, N'Giày da', N'Giày da nam lịch lãm', CAST(900000.00 AS Decimal(10, 2)), 15, 3, CAST(N'2024-10-10 14:25:03.427' AS DateTime), CAST(N'2024-10-10 14:25:03.427' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [Gia], [SoLuong], [MaDanhMuc], [Ngaytao], [NgayCapNhat]) VALUES (4, N'Balo thời trang', N'Balo thiết kế trẻ trung', CAST(500000.00 AS Decimal(10, 2)), 10, 4, CAST(N'2024-10-10 14:25:03.427' AS DateTime), CAST(N'2024-10-10 14:25:03.427' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [Gia], [SoLuong], [MaDanhMuc], [Ngaytao], [NgayCapNhat]) VALUES (5, N'Áo khoác mùa đông', N'Áo khoác dày giữ ấm', CAST(600000.00 AS Decimal(10, 2)), 20, 1, CAST(N'2024-10-10 14:25:03.427' AS DateTime), CAST(N'2024-10-10 14:25:03.427' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [Gia], [SoLuong], [MaDanhMuc], [Ngaytao], [NgayCapNhat]) VALUES (6, N'Quần lửng nữ', N'Quần lửng nữ thoải mái', CAST(200000.00 AS Decimal(10, 2)), 30, 2, CAST(N'2024-10-10 14:25:03.430' AS DateTime), CAST(N'2024-10-10 14:25:03.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__KhachHan__AB6E61645A2E4749]    Script Date: 19/10/2024 10:19:26 AM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
