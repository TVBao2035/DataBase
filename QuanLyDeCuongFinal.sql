create database QuanLyDeCuong
go
use QuanLyDeCuong
go
create table DONVI
(
	MaDV varchar(10) not null primary key(MaDV),
	TenDV nvarchar (30),
	SoDT varchar(10),
)
Create table Quyen(
MaQuyen VarCHAR(7) NOT NULL,
TenQuyen NVARCHAR(50),
CONSTRAINT pk_Quyen Primary key(MaQuyen)
)
Go
Create table Permission(
MaPermission VarCHAR(30) NOT NULL,
Actions NVARCHAR(500),
CONSTRAINT pk_Permission Primary key(MaPermission)
)

Create table Quyen_Permission(
MaQuyen VarCHAR(7) NOT NULL,
MaPermission VarCHAR(30),
CONSTRAINT pk_Quyen_Permission Primary key(MaQuyen,MaPermission),
CONSTRAINT FK_Quyen_Permission_Q FOREIGN KEY (MaQuyen) REFERENCES Quyen(MaQuyen),
CONSTRAINT FK_Quyen_Permission_P FOREIGN KEY (MaPermission) REFERENCES Permission(MaPermission)
)

create table NguoiDung
(
	MaNguoiDung varchar(10) not null primary key (MaNguoiDung),
	HoTen nvarchar(30),
	NgaySinh date,
	GioiTinh nvarchar(3),
	SoDT nvarchar(10),
	Email varchar(30),
	DiaChi nvarchar(50),
	MaQuyen varchar(7) references Quyen(MaQuyen)
)
go

Create table LichSu(
MaLS VarCHAR(7) NOT NULL,
MaND VarCHAR(10) NOT NULL,
TenHD NVARCHAR(50),
CONSTRAINT pk_LichSu Primary key(MaLS),
CONSTRAINT FK_LichSu_NguoiDung FOREIGN KEY (MaND) REFERENCES NguoiDung(MaNguoiDung)
)
Go


create table GIANGVIEN
(
	MaGV varchar(10) not null primary key(MaGV),
	MaDV varchar(10) references DONVI(MaDV),
	HocHam nvarchar(30),
	HocVi nvarchar(30),
	MaND varchar(10) references NguoiDung(MaNguoiDung),
)

create table KHOA
(
	MaKhoa varchar(10) not null primary key,
	TenKhoa nvarchar(50),
	TruongKhoa varchar(10)  references GIANGVIEN(MaGV),
)
go
create table NGANH
(
	MaNganh varchar(10) not null primary key (MaNganh),
	TenNganh nvarchar(30),
	MaDV varchar(10) references DONVI(MaDV),
	TruongNganh varchar(10) references GIANGVIEN(MaGV) ,
	MaKhoa varchar(10) references KHOA(MaKhoa),
)
go
create table HINHTHUCDAOTAO
(
	Ma varchar(10) primary key (Ma),
	Ten nvarchar(30)
)
go
create table BACDAOTAO
(
	Ma varchar(10) primary key (Ma),
	Ten nvarchar(30)
)
create table SINHVIEN
(
	MaSV varchar(10) not null primary key(MaSV),
	MaND varchar(10) references NguoiDung(MaNguoiDung),
	
	MaNganh varchar(10) references NGANH(MaNganh),
	HinhThucDaoTao varchar(10) references HINHTHUCDAOTAO(Ma),
)
go
go
create table LOP
(
	MaLop varchar(10) not null primary key,
	TenLop nvarchar(50),
	TruongLop varchar(10) references SINHVIEN(MaSV),
	MaKhoa varchar(10) references KHOA(Makhoa),
	MaNganh varchar(10) references NGANH(MaNganh) ,
	BacDaoTao varchar(10) references BACDAOTAO(Ma),
	HinhThucDaoTao varchar(10) references HINHTHUCDAOTAO(Ma),
	GVCN varchar(10) references GIANGVIEN(MaGV)
)
go


create table MONHOC
(
	MaMH varchar(10) not null primary key,
	TenMH nvarchar(50),
	SoTC int,
	SoTietLT int,
	SoTietTH int,
	MaMHTienQuyet varchar(10) references MONHOC(MaMH),
	MaNganh varchar(10) references Nganh(MaNganh),
)

go
Create table DeCuong(
MaDeCuong VarCHAR(7) NOT NULL,
TenDeCuong NVARCHAR(50),
MaMon VarCHAR(10) NOT NULL,
MaGV VarCHAR(10) references GIANGVIEN(MaGV) ,
isAccept bit ,
CONSTRAINT pk_DeCuong Primary key(MaDeCuong),
CONSTRAINT FK_DeCuong_Mon FOREIGN KEY (MaMon) REFERENCES MONHOC(MaMH)
)


Create table NguoiDung_DeCuong(
MaDeCuong VarCHAR(7) NOT NULL,
MaND VarCHAR(10) NOT NULL,
CONSTRAINT pk_ND_DC Primary key(MaDeCuong,MaND),
CONSTRAINT FK_ND_DC_DeCuong FOREIGN KEY (MaDeCuong) REFERENCES DeCuong(MaDeCuong),
CONSTRAINT FK_ND_DC_NguoiDung FOREIGN KEY (MaND) REFERENCES NguoiDung(MaNguoiDung)
)
Go
go
create table CHUYENMON
(
	MaGV varchar(10) references GIANGVIEN(MaGV),
	MaMH varchar(10) references MONHOC(MaMH),
	constraint pk_CHUYENMON primary key (MaGV, MaMH)
)
go
create table NAMHOC
(
	NamHoc varchar(10) primary key(NamHoc)
)
go


ALTER TABLE SINHVIEN
ADD  MaLop varchar(10) references LOP (MaLop);

---[Dữ liệu cho bảng NAMHOC]---
insert into NAMHOC(NamHoc) values('2019-2020')
go
insert into NAMHOC(NamHoc) values('2020-2021')
go
insert into NAMHOC(NamHoc) values('2021-2022')
go


---[Dữ liệu cho bảng DONVI]---

insert into DONVI(MaDV, TenDV, SoDT) values('KTCN', N'Khoa kỹ thuật công nghệ', '0256457868')
go

---[Dữ liệu cho bảng NGANH]---

-- Khoa kỹ thuật công nghệ
insert into NGANH(MaNganh,TenNganh,MaDV) values('CNKTCK', N'Công nghệ kỹ thuật cơ khí','KTCN')
go
insert into NGANH(MaNganh,TenNganh,MaDV) values('CNTT', N'Công nghệ thông tin','KTCN')
go
---[Dữ liệu cho bảng HINHTHUCDAOTAO]---
insert into HINHTHUCDAOTAO(Ma,Ten) values('CQ',N'Chính quy')
go
insert into HINHTHUCDAOTAO(Ma,Ten) values('VHVL',N'VHVL')
go
insert into HINHTHUCDAOTAO(Ma,Ten) values('DTTX',N'Đào tạo từ xa')
go

---[Dữ liệu cho bảng BACDAOTAO]---
insert into BACDAOTAO(Ma,Ten) values('CD', N'Cao đẳng')
go
insert into BACDAOTAO(Ma,Ten) values('DH', N'Đại học')
go





---[Dữ liệu cho bảng GIANGVIEN]---
-- Khoa Kỹ thuật công nghệ

insert into NguoiDung(MaNguoiDung, HoTen, NgaySinh, GioiTinh, SoDT, Email, DiaChi) 
values 
('ND0001', N'Nguyễn Văn Nối', '1970/1/23', N'Nam', '0357235869', 'nguyenvannoi@tgu.edu.vn', N'Tiền Giang'),
('ND0002', N'Trần Thị Ngà', '1984/1/23', N'Nữ', '0354235261', 'tranthinga@tgu.edu.vn', N'Tiền Giang'),
('ND0003', N'Nguyễn Minh Khánh ', '1977/4/15', N'Nam', '0368789452', 'nguyenminhkhanh@tgu.edu.vn', N'Tiền Giang'),
('ND0004',  N'Dương Văn Hiếu', '1975/6/10', N'Nam', '0375524189', 'duongvanhieu@tgu.edu.vn', N'Hồ Chí Minh'),
('ND0005', N'Nguyễn Minh Khánh ', '1977/4/15', N'Nam', '0368789452', 'nguyenminhkhanh@tgu.edu.vn', N'Tiền Giang'),
('ND0006',  N'Nguyễn Minh Khoa', '1977/9/2', N'Nam', '0369871236', 'nguyenminhkhoa@tgu.edu.vn', N'Tiền Giang'),
('ND0007',  N'Huỳnh Thị Nhật Hằng', '1990/1/23', N'Nữ', '0357232349', 'huynhthinhathang@tgu.edu.vn', N'Tiền Giang')

insert into GIANGVIEN(MaGV, MaND, MaDV, HocHam, HocVi) values ('GV0101', 'ND0001', 'KTCN', N'Tiến sĩ', N'Không')
go
insert into GIANGVIEN(MaGV, MaND, MaDV, HocHam, HocVi) values ('GV0102', 'ND0002', 'KTCN', N'Thạc sĩ', N'Không')
go
insert into GIANGVIEN(MaGV, MaND, MaDV, HocHam, HocVi) values ('GV0103','ND0003', 'KTCN', N'Thạc sĩ', N'Không')
go
insert into GIANGVIEN(MaGV,MaND, MaDV, HocHam, HocVi) values ('GV0104','ND0004', 'KTCN', N'Thạc sĩ', N'Không')
go
insert into GIANGVIEN(MaGV, MaND, MaDV, HocHam, HocVi) values ('GV0105','ND0005', 'KTCN', N'Thạc sĩ', N'Không')
go
insert into GIANGVIEN(MaGV, MaND, MaDV, HocHam, HocVi) values ('GV0106','ND0006', 'KTCN', N'Tiến sĩ', N'Không')
go
go
insert into GIANGVIEN(MaGV, MaND, MaDV, HocHam, HocVi) values ('GV0107','ND0007', 'KTCN', N'Thạc sĩ', N'Không')

---[Dữ liệu cho bảng LOP]---
insert into LOP(MaLop, TenLop, MaNganh, BacDaoTao, HinhThucDaoTao, GVCN) values('DHCNTT21A', N'Đại học công nghệ thông tin 21A', 'CNTT', 'DH', 'CQ', 'GV0101')
go
insert into LOP(MaLop, TenLop, MaNganh, BacDaoTao, HinhThucDaoTao, GVCN) values('DHCNTT21B', N'Đại học công nghệ thông tin 21B', 'CNTT', 'DH', 'CQ', 'GV0103')
go
insert into LOP(MaLop, TenLop, MaNganh, BacDaoTao, HinhThucDaoTao, GVCN) values('DHCNTT22A', N'Đại học công nghệ thông tin 22A', 'CNTT', 'DH', 'CQ', 'GV0104')
go
insert into LOP(MaLop, TenLop, MaNganh, BacDaoTao, HinhThucDaoTao, GVCN) values('DHCNTT22B', N'Đại học công nghệ thông tin 22B', 'CNTT', 'DH', 'CQ', 'GV0102')
go
insert into LOP(MaLop, TenLop, MaNganh, BacDaoTao, HinhThucDaoTao, GVCN) values('DHCNTT20A', N'Đại học công nghệ thông tin 20A', 'CNTT', 'DH', 'CQ', 'GV0105')
go
insert into LOP(MaLop, TenLop, MaNganh, BacDaoTao, HinhThucDaoTao, GVCN) values('DHCNTT20B', N'Đại học công nghệ thông tin 20B', 'CNTT', 'DH', 'CQ', 'GV0106')
go




-- Dữ liệu cho lớp DHCNTT21A
insert into NguoiDung(MaNguoiDung, HoTen, NgaySinh, GioiTinh, SoDT, Email, DiaChi) values
('ND0031', N'Nguyễn Minh Kha', '2003/09/08', N'Nam', '008543654', 'kha021101001@tgu.edu.vn', N'Tiền Giang'),
('ND0032', N'Nguyễn Thiện Duy', '2002/11/22', N'Nam', '008543655', 'duy021101002@tgu.edu.vn', N'Hà Nội'),
('ND0033', N'Lê Hoàng Nam', '2002/01/15', N'Nam', '008543656', 'nam021101003@tgu.edu.vn', N'Bắc Ninh'),
('ND0034', N'Phạm Bảo Trân', '2001/04/11', N'Nữ', '008543657', 'tran021101004@tgu.edu.vn', N'Thái Bình'),
('ND0035', N'Nguyễn Thi Thanh Mai', '2002/05/12', N'Nữ', '008543658', 'mai021101005@tgu.edu.vn', N'Hoà Bình'),
('ND0036', N'Phan Tấn Duy', '2001/08/21', N'Nam', '008543659', 'duy021101006@tgu.edu.vn', N'Quảng Ngãi'),
('ND0037', N'Trần Quốc Duy', '2003/02/10', N'Nam', '008543660', 'quocduy021101007@tgu.edu.vn', N'Bình Định'),
('ND0008', N'Trương Minh Kha', '2002/03/28', N'Nam', '008543661', 'kha021101008@tgu.edu.vn', N'Bến Tre'),
('ND0009', N'Nguyễn Thị Thanh Mai', '2002/05/12', N'Nữ', '008543662', 'mai021101009@tgu.edu.vn', N'Hòa Hội'),
('ND0010', N'Võ Lâm Trí', '2003/01/02', N'Nam', '008543663', 'trilam021101010@tgu.edu.vn', N'Sóc Trăng');

insert into SINHVIEN(MaSV, MaND, MaLop, MaNganh, HinhThucDaoTao) values
('021101001', 'ND0001', 'DHCNTT21A', 'CNTT', 'CQ'),
('021101002', 'ND0002', 'DHCNTT21A', 'CNTT', 'CQ'),
('021101003', 'ND0003', 'DHCNTT21A', 'CNTT', 'CQ'),
('021101004', 'ND0004', 'DHCNTT21A', 'CNTT', 'CQ'),
('021101005', 'ND0005', 'DHCNTT21A', 'CNTT', 'CQ'),
('021101006', 'ND0006', 'DHCNTT21A', 'CNTT', 'CQ'),
('021101007', 'ND0007', 'DHCNTT21A', 'CNTT', 'CQ'),
('021101008', 'ND0008', 'DHCNTT21A', 'CNTT', 'CQ'),
('021101009', 'ND0009', 'DHCNTT21A', 'CNTT', 'CQ'),
('021101010', 'ND0010', 'DHCNTT21A', 'CNTT', 'CQ');

-- Dữ liệu cho lớp DHCNTT22A
insert into NguoiDung(MaNguoiDung, HoTen, NgaySinh, GioiTinh, SoDT, Email, DiaChi) values
('ND0011', N'Nguyễn Quốc Tiến', '2001/11/15', N'Nam', '008543664', 'tien021102001@tgu.edu.vn', N'Thịnh Dịch'),
('ND0012', N'Lê Minh Hoàng', '2001/02/24', N'Nam', '008543665', 'hoang021102002@tgu.edu.vn', N'Hưng Yên'),
('ND0013', N'Phan Thị Thanh Tuyền', '2002/12/01', N'Nữ', '008543666', 'tuyen021102003@tgu.edu.vn', N'Vĩnh Long'),
('ND0014', N'Trần Đức Toàn', '2002/06/05', N'Nam', '008543667', 'toan021102004@tgu.edu.vn', N'Vĩnh Phúc'),
('ND0015', N'Nguyễn Thanh Hằng', '2001/09/21', N'Nữ', '008543668', 'hang021102005@tgu.edu.vn', N'Gia Lai'),
('ND0016', N'Đỗ Quốc Khánh', '2002/03/13', N'Nam', '008543669', 'khanh021102006@tgu.edu.vn', N'Tây Ninh'),
('ND0017', N'Nguyễn Thi Kim Liên', '2003/08/17', N'Nữ', '008543670', 'lien021102007@tgu.edu.vn', N'Bạc Liêu'),
('ND0018', N'Phan Minh Tuấn', '2002/05/04', N'Nam', '008543671', 'tuan021102008@tgu.edu.vn', N'Cà Mau'),
('ND0019', N'Nguyễn Trung Kiên', '2002/07/19', N'Nam', '008543672', 'kien021102009@tgu.edu.vn', N'Thái Nguyên'),
('ND0020', N'Võ Thanh Tâm', '2003/03/10', N'Nữ', '008543673', 'tam021102010@tgu.edu.vn', N'Bình Dương');

insert into SINHVIEN(MaSV, MaND, MaLop, MaNganh, HinhThucDaoTao) values
('021102001', 'ND0011', 'DHCNTT22A', 'CNTT', 'CQ'),
('021102002', 'ND0012', 'DHCNTT22A', 'CNTT', 'CQ'),
('021102003', 'ND0013', 'DHCNTT22A', 'CNTT', 'CQ'),
('021102004', 'ND0014', 'DHCNTT22A', 'CNTT', 'CQ'),
('021102005', 'ND0015', 'DHCNTT22A', 'CNTT', 'CQ'),
('021102006', 'ND0016', 'DHCNTT22A', 'CNTT', 'CQ'),
('021102007', 'ND0017', 'DHCNTT22A', 'CNTT', 'CQ'),
('021102008', 'ND0018', 'DHCNTT22A', 'CNTT', 'CQ'),
('021102009', 'ND0019', 'DHCNTT22A', 'CNTT', 'CQ'),
('021102010', 'ND0020', 'DHCNTT22A', 'CNTT', 'CQ');

-- Dữ liệu cho lớp DHCNTT22B
insert into NguoiDung(MaNguoiDung, HoTen, NgaySinh, GioiTinh, SoDT, Email, DiaChi) values
('ND0021', N'Ngô Minh Tuân', '2002/02/20', N'Nam', '008543674', 'tuan021102001@tgu.edu.vn', N'An Nhơn'),
('ND0022', N'Võ Minh Tiến', '2002/09/18', N'Nam', '008543675', 'tien021102002@tgu.edu.vn', N'Thành phố Hồ Chí Minh'),
('ND0023', N'Nguyễn Thị Lý', '2003/01/09', N'Nữ', '008543676', 'ly021102003@tgu.edu.vn', N'Thừa Thiên Huế'),
('ND0024', N'Hoàng Thanh Lâm', '2002/04/12', N'Nam', '008543677', 'lam021102004@tgu.edu.vn', N'Bình Thuận'),
('ND0025', N'Phan Đức Huy', '2002/11/03', N'Nam', '008543678', 'huy021102005@tgu.edu.vn', N'Quảng Nam'),
('ND0026', N'Nguyễn Thị Kim Oanh', '2001/12/17', N'Nữ', '008543679', 'oanh021102006@tgu.edu.vn', N'Lâm Đồng'),
('ND0027', N'Đỗ Minh Tâm', '2002/10/06', N'Nam', '008543680', 'tam021102007@tgu.edu.vn', N'Khánh Hòa'),
('ND0028', N'Trương Thanh Bình', '2002/03/25', N'Nam', '008543681', 'binh021102008@tgu.edu.vn', N'Hà Tĩnh'),
('ND0029', N'Võ Minh Phúc', '2002/06/07', N'Nam', '008543682', 'phuc021102009@tgu.edu.vn', N'Quảng Bình'),
('ND0030', N'Nguyễn Hoàng Sơn', '2003/11/28', N'Nam', '008543683', 'son021102010@tgu.edu.vn', N'An Giang');

insert into SINHVIEN(MaSV, MaND, MaLop, MaNganh, HinhThucDaoTao) values
('021103001', 'ND0021', 'DHCNTT22B', 'CNTT', 'CQ'),
('021103002', 'ND0022', 'DHCNTT22B', 'CNTT', 'CQ'),
('021103003', 'ND0023', 'DHCNTT22B', 'CNTT', 'CQ'),
('021103004', 'ND0024', 'DHCNTT22B', 'CNTT', 'CQ'),
('021103005', 'ND0025', 'DHCNTT22B', 'CNTT', 'CQ'),
('021103006', 'ND0026', 'DHCNTT22B', 'CNTT', 'CQ'),
('021103007', 'ND0027', 'DHCNTT22B', 'CNTT', 'CQ'),
('021103008', 'ND0028', 'DHCNTT22B', 'CNTT', 'CQ'),
('021103009', 'ND0029', 'DHCNTT22B', 'CNTT', 'CQ'),
('021103010', 'ND0030', 'DHCNTT22B', 'CNTT', 'CQ');




---[Dữ liệu cho bảng MONHOC]---

--Ngành Công nghệ thông tin
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10101', N'Nhập môn lập trình', 3, 30, 15, null, 'CNTT')
go
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10102', N'Lập trình hướng đối tượng', 3, 30, 15, 'MH10101',  'CNTT')
go
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10103', N'Cơ sở dữ liệu', 3, 30, 15, 'MH10101', N'CNTT')
go
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10104', N'Lập trình cơ sở dữ liệu', 3, 30, 15, 'MH10103',  'CNTT')
go
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10105', N'Nhập môn công nghệ phần mềm', 4, 30, 30, 'MH10101', 'CNTT')
go
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10106', N'Lập trình ứng dụng Java', 3, 30, 15, 'MH10101',  'CNTT')
go
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10107', N'Kỹ thuật lập trình', 3, 30, 15, 'MH10101', 'CNTT')
go
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10108', N'Lập trình di dộng', 4, 30, 30, 'MH10101',  'CNTT')
go
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10109', N'Quản trị mạng', 3, 30, 15, null, 'CNTT')
go
insert into MONHOC(MaMH, TenMH, SoTC, SoTietLT, SoTietTH, MaMHTienQuyet, MaNganh) 
values('MH10110', N'An ninh mạng', 3, 30, 15, 'MH10109', 'CNTT')
go




---[Dữ liệu cho bảng CHUYENMON]---

--Ngành Công nghệ thông tin
insert CHUYENMON(MaGV,MaMH) values('GV0102', 'MH10101')
go
insert CHUYENMON(MaGV,MaMH) values('GV0102', 'MH10102')
go
insert CHUYENMON(MaGV,MaMH) values('GV0103', 'MH10101')
go
insert CHUYENMON(MaGV,MaMH) values('GV0103', 'MH10102')
go
insert CHUYENMON(MaGV,MaMH) values('GV0103', 'MH10103')
go
insert CHUYENMON(MaGV,MaMH) values('GV0103', 'MH10104')
go
insert CHUYENMON(MaGV,MaMH) values('GV0104', 'MH10105')
go
insert CHUYENMON(MaGV,MaMH) values('GV0104', 'MH10102')
go
insert CHUYENMON(MaGV,MaMH) values('GV0104', 'MH10107')
go
insert into KHOA(MaKhoa, TenKhoa, TruongKhoa) values ('KTCN', N'Khoa kỹ thuật công nghệ', 'GV0104')
update LOP set TruongLop='021101001', MaKhoa='KTCN' where MaLop='DHCNTT20A'
update LOP set TruongLop='021101002', MaKhoa='KTCN' where MaLop='DHCNTT20B'
update LOP set TruongLop='021101003', MaKhoa='KTCN' where MaLop='DHCNTT21A'
update LOP set TruongLop='021101004', MaKhoa='KTCN' where MaLop='DHCNTT21B'
update LOP set TruongLop='021101005', MaKhoa='KTCN' where MaLop='DHCNTT22A'
update LOP set TruongLop='021101002', MaKhoa='KTCN' where MaLop='DHCNTT22B'

update NGANH set TruongNganh='GV0107', MaKhoa='KTCN' where MaNganh='CNKTCK'
update NGANH set TruongNganh='GV0104', MaKhoa='KTCN' where MaNganh='CNTT'

insert into DeCuong (MaDeCuong, TenDeCuong, MaMon, MaGV, isAccept)
values
('DC001', N'Nhập Môn Lập trình', 'MH10101', 'GV0101', 1),
('DC002', N'Lập trình hướng đối tượng', 'MH10102', 'GV0102', 1),
('DC003', N'Cơ sở dữ liệu', 'MH10103', 'GV0103', 0),
('DC004', N'Lập trình cơ sở dữ liệu', 'MH10104', 'GV0104', 1),
('DC005', N'An ninh mạng', 'MH10110', 'GV0105', 0);

insert into LichSu (MaLS, MaND, TenHD)
values
('LS0001', 'ND0001', N'Đăng ký môn học'),
('LS0002', 'ND0002', N'Cập nhật thông tin cá nhân'),
('LS0003', 'ND0003', N'Đổi mật khẩu'),
('LS0004', 'ND0004', N'Đăng ký học phần mới'),
('LS0005', 'ND0005', N'Đăng ký môn học');

insert into Quyen (MaQuyen, TenQuyen) values (1, 'Admin'), (2, 'GiangVien'), (3, 'TruongKhoa'), (4, 'SinhVien');
-- insert more Permissons
insert into Permission (MaPermission, Actions) values 
(1, 'read/giangvien'),(2, 'create/giangvien'), (3, 'update/giangvien'), (4, 'delete/giangvien'),
(5, 'read/sinhvien'),(6, 'create/sinhvien'), (7, 'delete/sinhvien'), (8, 'update/sinhvien'),
(9, 'read/khoa'), (10, 'create/khoa'), (11, 'delete/khoa'), (12, 'update/khoa'),
(13, 'read/nganh'), (14, 'create/nganh'), (15, 'delete/nganh'), (16, 'udpate/nganh')
--insert more Permissions


insert into Quyen_Permission (MaQuyen, MaPermission) values (1,1), (1,2), (1,3), (1,4)

update NguoiDung set MaQuyen = 2 where MaNguoiDung = ''
insert into NguoiDung_DeCuong (MaDeCuong, MaND) values('DC001', 'ND0001');
select * from NguoiDung_DeCuong
select * from Permission
select * from Quyen
select * from LichSu
select * from DeCuong

select * from NguoiDung
select * from NGANH
select * from NAMHOC
select * from MONHOC
select * from LOP
select * from KHOA 
select * from HINHTHUCDAOTAO

select * from DONVI
select * from GIANGVIEN, NguoiDung where NguoiDung.MaNguoiDung = GIANGVIEN.MaND
select * from BACDAOTAO
select * from CHUYENMON
 select *from SINHVIEN

--select MONHOC.MaMH, MONHOC.TenMH, GIANGVIEN.MaGV, GIANGVIEN.HoTen from CHUYENMON, MONHOC, GIANGVIEN 
--where CHUYENMON.MaMH = MONHOC.MaMH and CHUYENMON.MaGV = GIANGVIEN.MaGV and GIANGVIEN.MaDV = 'KTL' and MONHOC.TenNganh = N'Công Nghệ ThôngTin'
--order by GIANGVIEN.MaGV asc
select * from SINHVIEN where MaLop= 'DHCNTT22B'

--
--select CHUYENMON.MaMH, NhomHP, HocKy, NamHoc, Thu, TietGiangDay from THOIKHOABIEU, GIANGVIEN, CHUYENMON, MONHOC
--where GIANGVIEN.MaGV = THOIKHOABIEU.MaGV and GIANGVIEN.MaDV = 'KTCN' and MONHOC.MaMH = THOIKHOABIEU.MaMH and CHUYENMON.MaGV = GIANGVIEN.MaGV 
--and MONHOC.TenNganh = N'Công nghệ thông tin' and CHUYENMON.MaMH = THOIKHOABIEU.MaMH
--go





