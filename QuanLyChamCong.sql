CREATE Database chamcong;
go
use chamcong
go
CREATE TABLE CONGVIEC (MaCV nvarchar(5), TenCV nVarchar(50),  DonGia int, 
constraint PK_CV primary key (MaCV)
);
go
CREATE TABLE NHANVIEN (MaNV nvarchar(5), HoTen nVarchar(50),  Phai bit, HSLuong numeric(7,3), NgaySinh datetime, NoiSinh nvarchar(50),
constraint PK_NV primary key (MaNV)
);

go
CREATE TABLE CHAMCONG (MaNV nvarchar(5), MaCV nvarchar(5), KLCV int,
constraint PK_SV primary key (MaNV, MaCV)
);
-------------------Tao Khoa ngoai---------------------
ALTER TABLE CHAMCONG ADD CONSTRAINT FK_cccv FOREIGN KEY (MaCV) REFERENCES CONGVIEC(MaCV)
go
ALTER TABLE CHAMCONG ADD CONSTRAINT FK_ccnv FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
go

INSERT INTO CONGVIEC (MaCV, TenCV, DonGia)VALUES('BV',N'Bảo vệ', '5000')
INSERT INTO CONGVIEC (MaCV, TenCV, DonGia)VALUES('CM',N'Cạo mủ', '3000')
INSERT INTO CONGVIEC (MaCV, TenCV, DonGia)VALUES('HC',N'Hành chính', '7000')
INSERT INTO CONGVIEC (MaCV, TenCV, DonGia)VALUES('QL',N'Quản lý', '10000')
INSERT INTO CONGVIEC (MaCV, TenCV, DonGia)VALUES('TC',N'Chăm sóc cây', '3000')

go

INSERT INTO NHANVIEN (MaNV, HoTen, Phai, HSLuong, NgaySinh, NoiSinh)VALUES('A001',N'Trần Thị Nhung', '0', '2', '12/12/1982', N'Tiền Giang')
INSERT INTO NHANVIEN (MaNV, HoTen, Phai, HSLuong, NgaySinh, NoiSinh)VALUES('A002',N'Hồ Thị Lan', '0', '1', '1/12/1980', N'Bến Tre')	
INSERT INTO NHANVIEN (MaNV, HoTen, Phai, HSLuong, NgaySinh, NoiSinh)VALUES('A003',N'Nguyễn Lan Chi', '0', '1.3', '12/2/1981', N'Vĩnh Long')
INSERT INTO NHANVIEN (MaNV, HoTen, Phai, HSLuong, NgaySinh, NoiSinh)VALUES('A004',N'Trần Thanh Sang', '1', '1.5', '5/6/1982', N'Tiền Giang')
INSERT INTO NHANVIEN (MaNV, HoTen, Phai, HSLuong, NgaySinh, NoiSinh)VALUES('A005',N'Lê Xuân Thu', '1', '1.2', '12/12/1982', N'Trà Vinh')
go

INSERT INTO CHAMCONG (MaNV, MaCV, KLCV)VALUES('A001','BV', '10')
INSERT INTO CHAMCONG (MaNV, MaCV, KLCV)VALUES('A001','CM', '20')
INSERT INTO CHAMCONG (MaNV, MaCV, KLCV)VALUES('A002','CM', '15')
INSERT INTO CHAMCONG (MaNV, MaCV, KLCV)VALUES('A002','QL', '2')
INSERT INTO CHAMCONG (MaNV, MaCV, KLCV)VALUES('A004','BV', '10')
INSERT INTO CHAMCONG (MaNV, MaCV, KLCV)VALUES('A004','QL', '3')
INSERT INTO CHAMCONG (MaNV, MaCV, KLCV)VALUES('A003','HC', '10')
