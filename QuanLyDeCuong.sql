Create DATABASE QuanLyDeCuong
go

use QuanLyDeCuong
go

Create table Khoa(
MaKhoa VarCHAR(7) NOT NULL,
TenKhoa NVARCHAR(50),
TruongKhoa NVARCHAR(50),
CONSTRAINT pk_Khoa Primary key(MaKhoa)
)
go

Create table Lop(
MaLop VarCHAR(7) NOT NULL,
TenLop NVARCHAR(50),
MaKhoa VarCHAR(7) NOT NULL,
TenKhoa NVARCHAR(50),
TruongKhoa NVARCHAR(50),
CONSTRAINT pk_Lop Primary key(MaLop),
CONSTRAINT FK_Lop_Khoa FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
)
go

Create table Nganh(
MaNganh VarCHAR(7) NOT NULL,
TenNganh NVARCHAR(50),
TruongNganh NVARCHAR(50),
MaKhoa VarCHAR(7) NOT NULL,
CONSTRAINT pk_Nganh Primary key(MaNganh),
CONSTRAINT FK_Nganh_Khoa FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
)
Go

Create table BoMon(
MaBoMon VarCHAR(7) NOT NULL,
TenBoMon NVARCHAR(50),
MaNganh VarCHAR(7) NOT NULL,
CONSTRAINT pk_BoMon Primary key(MaBoMon),
CONSTRAINT FK_BoMon_Nganh FOREIGN KEY (MaNganh) REFERENCES Nganh(MaNganh)
)
Go
Create table Mon(
MaMon VarCHAR(7) NOT NULL,
TenMon NVARCHAR(50),
MaBoMon VarCHAR(7) NOT NULL,
CONSTRAINT pk_Mon Primary key(MaMon),
CONSTRAINT FK_Mon_BoMon FOREIGN KEY (MaBoMon) REFERENCES BoMon(MaBoMon)
)
Go

Create table Quyen(
MaQuyen VarCHAR(7) NOT NULL,
TenQuyen NVARCHAR(50),
CONSTRAINT pk_Quyen Primary key(MaQuyen)
)
Go

Create table NguoiDung(
MaND VarCHAR NOT NULL,
Ten NVARCHAR(50),
Email VarChar(50) NOT NUll,
MatKhau VarChar(50) NOT NUll,
MaQuyen VarCHAR(7) NOT NULL,
MaNganh VarCHAR(7) NOT NULL,
DiaChi VARCHAR,
GioiTinh VARCHAR,
NgaySinh DATETIME,
SoDT VARCHAR(50),
SoCCCD VARCHAR(50),
CONSTRAINT pk_NguoiDung Primary key(MaND),
CONSTRAINT FK_NguoiDung_Quyen FOREIGN KEY (MaQuyen) REFERENCES Quyen(MaQuyen),
CONSTRAINT FK_NguoiDung_Nganh FOREIGN KEY (MaNganh) REFERENCES Nganh(MaNganh),
)
Go

Create table SinhVien(
MaND VarCHAR NOT NULL,
MaSV VarCHAR(12) NOT NULL,
MaLop VarCHAR(7) NOT NULL,
CONSTRAINT pk_SinhVien Primary key(MaSV),
CONSTRAINT FK_SinhVien_NguoiDung FOREIGN KEY (MaND) REFERENCES NguoiDung(MaND),
CONSTRAINT FK_SinhVien_Lop FOREIGN KEY (MaLop) REFERENCES Lop(MaLop),
)
Go

Create table GiangVien(
MaND VarCHAR NOT NULL,
MaGV VarCHAR(12) NOT NULL,
MaKhoa VarCHAR(7) NOT NULL,
HocHam VARCHAR,
HocVi VARCHAR,
CONSTRAINT pk_GiangVien Primary key(MaGV),
CONSTRAINT FK_GiangVien_NguoiDung FOREIGN KEY (MaND) REFERENCES NguoiDung(MaND),
CONSTRAINT FK_GiangVien_Khoa FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa),
)
Go

Create table LichSu(
MaLS VarCHAR(7) NOT NULL,
MaND VarCHAR NOT NULL,
TenHD NVARCHAR(50),
CONSTRAINT pk_LichSu Primary key(MaLS),
CONSTRAINT FK_LichSu_NguoiDung FOREIGN KEY (MaND) REFERENCES NguoiDung(MaND)
)
Go

Create table DeCuong(
MaDeCuong VarCHAR(7) NOT NULL,
TenDeCuong NVARCHAR(50),
MaMon VarCHAR(7) NOT NULL,
MaNguoiTao VarCHAR NOT NULL,
isAccept bit ,
CONSTRAINT pk_DeCuong Primary key(MaDeCuong),
CONSTRAINT FK_DeCuong_Mon FOREIGN KEY (MaMon) REFERENCES Mon(MaMon)
)
Go

Create table NguoiDung_DeCuong(
MaDeCuong VarCHAR(7) NOT NULL,
MaND VarCHAR NOT NULL,
CONSTRAINT pk_ND_DC Primary key(MaDeCuong,MaND),
CONSTRAINT FK_ND_DC_DeCuong FOREIGN KEY (MaDeCuong) REFERENCES DeCuong(MaDeCuong),
CONSTRAINT FK_ND_DC_NguoiDung FOREIGN KEY (MaND) REFERENCES NguoiDung(MaND)
)
Go

Create table Permission(
MaPermission VarCHAR(30) NOT NULL,
Actions NVARCHAR(500),
CONSTRAINT pk_Permission Primary key(MaPermission)
)
Go

Create table Quyen_Permission(
MaQuyen VarCHAR(7) NOT NULL,
MaPermission VarCHAR(30),
CONSTRAINT pk_Quyen_Permission Primary key(MaQuyen,MaPermission),
CONSTRAINT FK_Quyen_Permission_Q FOREIGN KEY (MaQuyen) REFERENCES Quyen(MaQuyen),
CONSTRAINT FK_Quyen_Permission_P FOREIGN KEY (MaPermission) REFERENCES Permission(MaPermission)
)

select * from DeCuong