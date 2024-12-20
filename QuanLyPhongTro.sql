create database [QLPHONGTRO]
go
USE [QLPHONGTRO]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 14/12/2023 9:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON 
GO
CREATE TABLE [dbo].[KHACHHANG](
	[IdMaKH] [varchar](6) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[CCCD] [varchar](12) NULL,
	[Sodt] [varchar](12) NULL,
 CONSTRAINT [pk_KH] PRIMARY KEY CLUSTERED 
(
	[IdMaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHUVUC]    Script Date: 14/12/2023 9:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHUVUC](
	[IdMaKV] [varchar](5) NOT NULL,
	[TenKV] [nvarchar](30) NULL,
	[Ghichu] [nvarchar](50) NULL,
 CONSTRAINT [pk_KV] PRIMARY KEY CLUSTERED 
(
	[IdMaKV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEUTHUE]    Script Date: 14/12/2023 9:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHIEUTHUE](
	[IDPhieuthue] [int] IDENTITY(1,1) NOT NULL,
	[ngaylap] [smalldatetime] NULL,
	[lydo] [nvarchar](50) NULL,
	[Sotien] [float] NULL,
	[IdMaPT] [varchar](7) NULL,
	[IdMaKH] [varchar](6) NULL,
	[NgayThanhtoan] [smalldatetime] NULL,
 CONSTRAINT [pk_PTh] PRIMARY KEY CLUSTERED 
(
	[IDPhieuthue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHONGTRO]    Script Date: 14/12/2023 9:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHONGTRO](
	[IdMaPT] [varchar](7) NOT NULL,
	[Diachi] [nvarchar](50) NULL,
	[Ghichu] [nvarchar](50) NULL,
	[IDMaKV] [varchar](5) NULL,
 CONSTRAINT [pk_PT] PRIMARY KEY CLUSTERED 
(
	[IdMaPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THIETBI]    Script Date: 14/12/2023 9:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THIETBI](
	[IdMaTB] [varchar](5) NOT NULL,
	[TenTB] [nvarchar](50) NULL,
	[Trigia] [float] NULL,
 CONSTRAINT [pk_TB] PRIMARY KEY CLUSTERED 
(
	[IdMaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRANGBI]    Script Date: 14/12/2023 9:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRANGBI](
	[IdMaPT] [varchar](7) NOT NULL,
	[IdMaTB] [varchar](5) NOT NULL,
	[Soluong] [int] NULL,
 CONSTRAINT [pk_TRB] PRIMARY KEY CLUSTERED 
(
	[IdMaPT] ASC,
	[IdMaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[KHACHHANG] ([IdMaKH], [Hoten], [CCCD], [Sodt]) VALUES (N'KH01', N'Trần Thiên Phú', N'032564656', N'032256475')
INSERT [dbo].[KHACHHANG] ([IdMaKH], [Hoten], [CCCD], [Sodt]) VALUES (N'KH02', N'Tạ Thanh Tùng', N'0941313219', N'0344752341')
INSERT [dbo].[KHACHHANG] ([IdMaKH], [Hoten], [CCCD], [Sodt]) VALUES (N'KH03', N'Võ Phước Trí', N'0358898088', N'359750608')
INSERT [dbo].[KHACHHANG] ([IdMaKH], [Hoten], [CCCD], [Sodt]) VALUES (N'KH04', N'Đoàn Ngọc Hân', N'0917950004', N'333019732')
INSERT [dbo].[KHACHHANG] ([IdMaKH], [Hoten], [CCCD], [Sodt]) VALUES (N'KH05', N'Phạm Văn Hiệp', N'0981747738', N'395516872')
INSERT [dbo].[KHACHHANG] ([IdMaKH], [Hoten], [CCCD], [Sodt]) VALUES (N'KH06', N'Phạm Minh Dũng', N'0354957349', N'032256475')
INSERT [dbo].[KHUVUC] ([IdMaKV], [TenKV], [Ghichu]) VALUES (N'KV001', N'Trung An', N'Gần chợ, gần trường THPT Chuyên Tiền Giang')
INSERT [dbo].[KHUVUC] ([IdMaKV], [TenKV], [Ghichu]) VALUES (N'KV002', N'Mỹ Tho', N'Gần Vincom')
INSERT [dbo].[KHUVUC] ([IdMaKV], [TenKV], [Ghichu]) VALUES (N'KV003', N'Cái Bè', N'Khu chợ, thị trấn')
INSERT [dbo].[KHUVUC] ([IdMaKV], [TenKV], [Ghichu]) VALUES (N'KV004', N'Cai Lậy', N'Gần trường THPT Võ Việt Tân')
INSERT [dbo].[KHUVUC] ([IdMaKV], [TenKV], [Ghichu]) VALUES (N'KV005', N'Chợ gạo', N'Gần trường Trần Văn Hoài')
SET IDENTITY_INSERT [dbo].[PHIEUTHUE] ON 

INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (1, CAST(N'2023-01-12 00:00:00' AS SmallDateTime), N'Đặt cọc 3 tháng ', 300000, N'PT001', N'KH03', CAST(N'2023-01-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (2, CAST(N'2022-01-12 00:00:00' AS SmallDateTime), N'Đặt cọc 3 tháng ', 300000, N'PT001', N'KH06', CAST(N'2022-01-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (3, CAST(N'2023-03-12 00:00:00' AS SmallDateTime), N'Đặt cọc 3 tháng ', 600000, N'PT003', N'KH02', CAST(N'2023-03-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (4, CAST(N'2023-05-12 00:00:00' AS SmallDateTime), N'Đặt cọc 3 tháng ', 500000, N'PT004', N'KH01', CAST(N'2023-05-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (5, CAST(N'2023-07-12 00:00:00' AS SmallDateTime), N'Đặt cọc 3 tháng ', 500000, N'PT005', N'KH04', CAST(N'2023-07-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (6, CAST(N'2023-09-12 00:00:00' AS SmallDateTime), N'Đặt cọc 3 tháng ', 500000, N'PT002', N'KH05', CAST(N'2023-09-12 00:00:00' AS SmallDateTime))
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (7, CAST(N'2023-01-12 00:00:00' AS SmallDateTime), N'Thu tiền thuê theo tháng 1  ', 300000, N'PT001', N'KH03', NULL)
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (8, CAST(N'2023-03-12 00:00:00' AS SmallDateTime), N'Thu tiền thuê theo tháng 3 ', 600000, N'PT003', N'KH02', NULL)
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (9, CAST(N'2023-05-12 00:00:00' AS SmallDateTime), N'Thu tiền thuê theo tháng 5  ', 500000, N'PT004', N'KH01', NULL)
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (10, CAST(N'2023-07-12 00:00:00' AS SmallDateTime), N'Thu tiền thuê theo tháng 7  ', 500000, N'PT005', N'KH04', NULL)
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (11, CAST(N'2023-09-12 00:00:00' AS SmallDateTime), N'Thu tiền thuê theo tháng 9 ', 500000, N'PT002', N'KH05', NULL)
INSERT [dbo].[PHIEUTHUE] ([IDPhieuthue], [ngaylap], [lydo], [Sotien], [IdMaPT], [IdMaKH], [NgayThanhtoan]) VALUES (12, CAST(N'2022-03-12 00:00:00' AS SmallDateTime), N'Đặt cọc 3 tháng ', 600000, N'PT003', N'KH03', CAST(N'2022-03-12 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[PHIEUTHUE] OFF
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT001', N'38 Đỗ Văn Thống P.10', NULL, N'KV002')
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT002', N'10 Ấp Bắc P.5', NULL, N'KV001')
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT003', N'102 Quốc lộ 1A', NULL, N'KV002')
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT004', N'325 Đoàn Thị Nghiệp P.10', NULL, N'KV002')
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT005', N'745/48 Lý Thường Kiệt', NULL, N'KV002')
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT006', N'219/34 Ấp Bắc P.5', NULL, N'KV001')
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT007', N'20 Đông Hòa Hiệp', NULL, N'KV003')
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT008', N'512 Trần Hưng Đạo', NULL, N'KV001')
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT009', N'232 Mỹ Trang P.4', NULL, N'KV004')
INSERT [dbo].[PHONGTRO] ([IdMaPT], [Diachi], [Ghichu], [IDMaKV]) VALUES (N'PT010', N'256 Nguyễn Thị Út', NULL, N'KV004')
INSERT [dbo].[THIETBI] ([IdMaTB], [TenTB], [Trigia]) VALUES (N'Ban', N'Bàn ăn 4 chỗ', 2500000)
INSERT [dbo].[THIETBI] ([IdMaTB], [TenTB], [Trigia]) VALUES (N'Bep', N'Bếp gas', 500000)
INSERT [dbo].[THIETBI] ([IdMaTB], [TenTB], [Trigia]) VALUES (N'Quat', N'Quạt trần', 500000)
INSERT [dbo].[THIETBI] ([IdMaTB], [TenTB], [Trigia]) VALUES (N'TL', N'Tủ lạnh', 6500000)
INSERT [dbo].[THIETBI] ([IdMaTB], [TenTB], [Trigia]) VALUES (N'TVLed', N'Ti vi smart Led 32 inch', 6500000)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT001', N'Ban', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT001', N'Bep', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT001', N'TVLed', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT002', N'Bep', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT002', N'TVLed', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT003', N'Bep', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT003', N'Quat', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT003', N'TVLed', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT004', N'Quat', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT004', N'TVLed', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT005', N'Ban', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT005', N'TVLed', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT006', N'Bep', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT006', N'TL', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT006', N'TVLed', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT007', N'TL', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT007', N'TVLed', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT008', N'Ban', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT008', N'TL', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT008', N'TVLed', 2)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT009', N'Quat', 1)
INSERT [dbo].[TRANGBI] ([IdMaPT], [IdMaTB], [Soluong]) VALUES (N'PT010', N'Bep', 1)
ALTER TABLE [dbo].[PHIEUTHUE]  WITH CHECK ADD FOREIGN KEY([IdMaKH])
REFERENCES [dbo].[KHACHHANG] ([IdMaKH])
GO
ALTER TABLE [dbo].[PHIEUTHUE]  WITH CHECK ADD FOREIGN KEY([IdMaPT])
REFERENCES [dbo].[PHONGTRO] ([IdMaPT])
GO
ALTER TABLE [dbo].[PHONGTRO]  WITH CHECK ADD FOREIGN KEY([IDMaKV])
REFERENCES [dbo].[KHUVUC] ([IdMaKV])
GO
ALTER TABLE [dbo].[TRANGBI]  WITH CHECK ADD FOREIGN KEY([IdMaPT])
REFERENCES [dbo].[PHONGTRO] ([IdMaPT])
GO
ALTER TABLE [dbo].[TRANGBI]  WITH CHECK ADD FOREIGN KEY([IdMaTB])
REFERENCES [dbo].[THIETBI] ([IdMaTB])
GO



select Diachi from PHONGTRO 

select * from KHUVUC
select * from PHONGTRO, KHUVUC where DiaChi=N'Go Cong Tay' and PHONGTRO.IDMaKV = KHUVUC.IdMaKV;
select * from PHONGTRO pt, PHIEUTHUE th, KHACHHANG kh where pt.IdMaPT=th.IdMaPT and th.IdMaKH=kh.IdMaKH and pt.IdMaPT =N'PT001'
select top 1 IdMaPT from PHONGTRO order by IdMaPT desc
delete PHONGTRO where IdMaPT = 'PT013'
insert PHONGTRO values(N'PT012', N'256 Nguyễn Thị Út', NULL, N'KV004')

update PHONGTRO set Diachi='go cong dong', IDMaKV='KV002' where IdMaPT='PT012'



--update PHONGTRO set Diachi='GCD', IDMaKV='KV004' where IdMaPT='PT001'
--select * from PHONGTRO where IdMaPT = 'PT001'
--delete PHONGTRO where IdMaPT = 'PT011';
--select * from KHUVUC
--select top 1 idMaPT from PHONGTRO order by IdMaPT desc
--select * from PHONGTRO pt, PHIEUTHUE pthue, KHACHHANG kh where pt.IdMaPT = pthue.IdMaPT and pthue.IdMaKH = kh.IdMaKH and pt.IdMaPT='PT001';
--select * from PHONGTRO pt, KHUVUC kv where pt.IDMaKV =kv.IdMaKV and IdMaPT='PT001'