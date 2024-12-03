CREATE Database QLGV1
go
use QLGV1
go
CREATE TABLE LOP (MaLop Varchar(10), TenLop nVarchar(50),  SiSo int, 
constraint PK_Lop primary key (MaLop)
);
go
CREATE TABLE GIANGVIEN (MaGV varchar(10), TenGV nvarchar(50), GioiTinh bit, NgaySinh date, DiaChi nvarchar(50), SDT nvarchar(10),
constraint PK_GV primary key (MaGV)
);
go
CREATE TABLE HOCPHAN (MaHP varchar(10), TenHP nvarchar(50), SoTiet nvarchar(50),
constraint PK_HP primary key (MaHP)
);
go
CREATE TABLE PHANCONG (MaLop varchar(10), MaHP varchar(10), MaGV varchar(10), TrinhTrang int,
constraint PK_PC primary key (MaLop, MaHP, MaGV)
);
go
-------------------Tao Khoa ngoai---------------------
ALTER TABLE PHANCONG ADD CONSTRAINT FK_PCLop FOREIGN KEY (MaLop) REFERENCES LOP(MaLop)
ALTER TABLE PHANCONG ADD CONSTRAINT FK_PCHP FOREIGN KEY (MaHP) REFERENCES HOCPHAN(MaHP)
ALTER TABLE PHANCONG ADD CONSTRAINT FK_PCGV FOREIGN KEY (MaGV) REFERENCES GIANGVIEN(MaGV)
go
INSERT INTO LOP(MaLop, TenLop, SiSo) VALUES('DHCNTT15',N'Đại học công nghệ thông tin 15', '50')
INSERT INTO LOP(MaLop, TenLop, SiSo) VALUES('DHCNTT16',N'Đại học công nghệ thông tin 16', '50')
INSERT INTO LOP(MaLop, TenLop, SiSo) VALUES('CDCNTT17',N'Cao đẳng công nghệ thông tin 17', '30')
INSERT INTO LOP(MaLop, TenLop, SiSo) VALUES('CDCNTT18',N'Cao đẳng công nghệ thông tin 18', '25')
go
INSERT INTO GIANGVIEN(MaGV, TenGV, GioiTinh, NgaySinh, DiaChi, SDT) VALUES('GV001',N'Lý Thiên Trang','0','7/15/2000', N'Mỹ Tho', '0912345678')
INSERT INTO GIANGVIEN(MaGV, TenGV, GioiTinh, NgaySinh,DiaChi, SDT) VALUES('GV002',N'Nguyễn Thị Thu Nguyệt','0','7/15/2000', N'Gò Công', '098900000')
INSERT INTO GIANGVIEN(MaGV, TenGV,GioiTinh, NgaySinh, DiaChi, SDT) VALUES('GV003',N'Trần Thị Diễm Trang', '0','7/15/2000',N'Gò Công', '012345678')
INSERT INTO GIANGVIEN(MaGV, TenGV,GioiTinh, NgaySinh, DiaChi, SDT) VALUES('GV004',N'Trần Thị Ngà', '0','7/15/2000',N'Cai Lậy', '078905555')
INSERT INTO GIANGVIEN(MaGV, TenGV,GioiTinh, NgaySinh, DiaChi, SDT) VALUES('GV005',N'Nguyễn Minh Khánh','1','7/15/2000', N'Vĩnh Kim', '034567890')
INSERT INTO GIANGVIEN(MaGV, TenGV, GioiTinh, NgaySinh,DiaChi, SDT) VALUES('GV006',N'Huỳnh Kim Quýt','0','7/15/2000', N'Chợ Gạo', '012309876')
INSERT INTO GIANGVIEN(MaGV, TenGV, GioiTinh, NgaySinh,DiaChi, SDT) VALUES('GV007',N'Nguyễn Văn Thuận', '1','7/15/2000',N'Cai Lậy', '0678903333')
INSERT INTO GIANGVIEN(MaGV, TenGV, GioiTinh, NgaySinh,DiaChi, SDT) VALUES('GV008',N'Trần Huy Long', '1','7/15/2000',N'Mỹ Tho', '067834512')
INSERT INTO GIANGVIEN(MaGV, TenGV,GioiTinh, NgaySinh, DiaChi, SDT) VALUES('GV009',N'Nguyễn Thị Phương Linh','0','7/15/2000', N'Mỹ Tho', '067834512')
go
INSERT INTO HOCPHAN(MaHP, TenHP, SoTiet) VALUES('HP001',N'Cơ sở dữ liệu', '90')
INSERT INTO HOCPHAN(MaHP, TenHP, SoTiet) VALUES('HP002',N'Lập trình Cơ sở dữ liệu', '60')
INSERT INTO HOCPHAN(MaHP, TenHP, SoTiet) VALUES('HP003',N'Mạng máy tính', '45')
INSERT INTO HOCPHAN(MaHP, TenHP, SoTiet) VALUES('HP004',N'Phát triển ứng dụng Web', '60')
INSERT INTO HOCPHAN(MaHP, TenHP, SoTiet) VALUES('HP005',N'Công nghệ .Net', '60')
INSERT INTO HOCPHAN(MaHP, TenHP, SoTiet) VALUES('HP006',N'Phân tích thiết kế HĐT', '75')
go
INSERT INTO PHANCONG(MaLop, MaHP, MaGV, TrinhTrang) VALUES('DHCNTT15','HP001', 'GV001','1')
INSERT INTO PHANCONG(MaLop, MaHP, MaGV, TrinhTrang) VALUES('DHCNTT16','HP002', 'GV001','1')
INSERT INTO PHANCONG(MaLop, MaHP, MaGV, TrinhTrang) VALUES('CDCNTT17','HP003', 'GV005','1')
INSERT INTO PHANCONG(MaLop, MaHP, MaGV, TrinhTrang) VALUES('DHCNTT15','HP004', 'GV003','1')
INSERT INTO PHANCONG(MaLop, MaHP, MaGV, TrinhTrang) VALUES('CDCNTT18','HP005', 'GV005','1')
INSERT INTO PHANCONG(MaLop, MaHP, MaGV, TrinhTrang) VALUES('DHCNTT15','HP006', 'GV002','1')


insert into GIANGVIEN values('GV010', N'Gumbal','1', '12/20/2003', 'Tien Giang', '0865466071' );

select top 1 MaGV from GiangVien order by MaGv desc

select *from GIANGVIEN order by magv desc;
insert into GIANGVIEN(MaGV, TenGV, GioiTinh, NgaySinh,DiaChi,SDT) Values('gv010', N'Gumbal','1','12/20/2003',N'Tien Giang', '09837378');
update GIANGVIEN set TenGV='gumbal', GioiTinh='1', NgaySinh='12/20/2003', SDT='0965466071' where magv='gv010';
delete from GIANGVIEN where MaGV = 'gv012';

