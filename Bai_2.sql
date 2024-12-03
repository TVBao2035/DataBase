create database Bai_2
go 
use Bai_2
go
create table khoa
( MaKhoa char(4) not null,
  tenkhoa varchar(40),
  ngtlap smalldatetime,
  trgkhoa char(4),
  primary key (MaKhoa) )
  go
  create table monhoc
 (
  Mamh varchar(10) not null,
  tenmh varchar(40),
  tclt tinyint,
  tcth tinyint,
  MaKhoa char(4),
  constraint Pk_Monhoc primary key (Mamh)
  )
  go
  create table dieukien
    (
    mamh varchar(10) not null,
   mamh_truoc varchar(10) not null,
constraint Pk_Dk primary key (mamh,mamh_truoc)
	)
  go
	create table Giaovien
	(
	magv char(4) not null,
	hoten varchar(40),
	hocvi varchar(10),
	hocham varchar(10),
	gioitinh varchar(3),
	ngsinh smalldatetime,
	ngvl smalldatetime,
	heso numeric(4,2),
	mucluong money,
	MaKhoa char(4),
	constraint Pk_gv primary key (magv)
	)
	go
	create table lop
	( malop char(3),
	 tenlop varchar(40),
	 trglop char(5),
	 siso tinyint,
	 magvcn char(4),
	 constraint Pk_Lop primary key (malop)
	 )
	 go 
	 create table hocvien
	 (
	 mahv char(5),
	 ho varchar(40),
	 ten varchar(10),
	 ngsinh smalldatetime,
	 gioitinh varchar(3),
	 noisinh varchar(40),
	 malop char(3),
	  constraint Pk_hv primary key (mahv)
	  )
	  go
	   create table giangday
	  (
	  malop char(3),
	  mamh varchar(10),
	  magv char(4),
	  hk tinyint,
	  nam smallint,
	  tungay smalldatetime,
	  denngay smalldatetime,
	  constraint Pk_GD primary key (malop,mamh)
	  )
	  go 
	  create table ketquathi
	  (
	  mahv char(5),
	  mamh varchar(10),
	  lanthi tinyint,
	  ngthi smalldatetime,
	  diem numeric(4,2),
	  kqua varchar(10),
	  primary key (mamh,mahv,lanthi)
	  )
	---Tạo khóa ngoại

ALTER TABLE KHOA ADD CONSTRAINT FK_Hvvakhoa FOREIGN KEY(TRGKHOA) REFERENCES GIAOVIEN(MAGV);
ALTER TABLE MONHOC ADD CONSTRAINT FK_MonvaKHOA FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA);
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_DKVAMH FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH);
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_DKVAMHTR FOREIGN KEY(MAMH_TRUOC) REFERENCES MONHOC(MAMH);
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GVVAKHOA FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA);
ALTER TABLE LOP ADD CONSTRAINT FK_LVHV FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV);
ALTER TABLE LOP ADD CONSTRAINT FK_LVGV FOREIGN KEY(MAGVCN)    REFERENCES GIAOVIEN(MAGV);
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HVVL FOREIGN KEY(MALOP) REFERENCES LOP(MALOP);
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GDVL FOREIGN KEY(MALOP) REFERENCES LOP(MALOP);
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GDMH FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH);
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GDGV FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV);
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KQTMH FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH);
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KQTHV FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV);
--Nhập dữ liệu
--KHOA
INSERT INTO khoa (Makhoa, Tenkhoa, Ngtlap)VALUES('KHMT', 'Khoa hoc may tinh', '6/7/2005')
INSERT INTO khoa (Makhoa, Tenkhoa, Ngtlap)VALUES('HTTT', 'he thong thong tin', '6/7/2005')
INSERT INTO khoa (Makhoa, Tenkhoa, Ngtlap)VALUES('CNPM', 'Cong nghe phan mem', '6/7/2005')
INSERT INTO khoa (Makhoa, Tenkhoa, Ngtlap)VALUES('MTT', 'Mang va truyen thong', '10/20/2005')
INSERT INTO khoa (Makhoa, Tenkhoa, Ngtlap)VALUES('KTMT', 'ky thuat may tinh', '12/20/2005')

Select* from KHOA
--MONHOC
Insert into MONHOC values ('THDC',' Tin hoc dai cuong','4','1','KHMT')
Insert into MONHOC values('CTRR',' Cau truc roi rac','5','0','KHMT')
Insert into MONHOC values('CSDL',' Co so du lieu','3','1','HTTT') 
Insert into MONHOC values('CTDLGT',' Cau truc du lieu va giai thuat','3','1','KHMT')
Insert into MONHOC values('PTTKTT',' Phan tich thiet ke thuat toan','3','0','KHMT')
Insert into MONHOC values('DHMT',' Do hoa may tinh','3','1','KHMT')
Insert into MONHOC values('KTMT',' Kien truc may tinh','3','0','KTMT'); 
Insert into MONHOC values('TKCSDL','Thiet ke co so du lieu','3','1','HTTT')
Insert into MONHOC values('PTTKHTTT','Phan tich thiet ke he thong thong tin','4','1','HTTT')
Insert into MONHOC values ('HDH','He dieu hanh','4','0','KTMT')
Insert into MONHOC values('NMCNPM','Nhap mon cong nghe phan mem','3','0','CNPM')
Insert into MONHOC values('LTCFW','Lap trinh C for win','3','1','CNPM') 
Insert into MONHOC values('LTHDT','Lap trinh huong doi tuong','3','1','CNPM'); 
select * from MONHOC 
--dieukien
Insert into DIEUKIEN values ('CSDL','CTRR') 
Insert into DIEUKIEN values ('CSDL','CTDLGT') 
Insert into DIEUKIEN values ('CTDLGT','THDC') 
Insert into DIEUKIEN values ('PTTKTT','THDC') 
Insert into DIEUKIEN values ('PTTKTT','CTDLGT') 
Insert into DIEUKIEN values ('DHMT','THDC') 
Insert into DIEUKIEN values ('LTHDT','THDC') 
Insert into DIEUKIEN values ('PTTKHTTT','CSDL'); 
select * From DIEUKIEN
--giaovien
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV01','Ho Thanh Son','PTS','GS','Nam','5/2/1950','1/11/2004','5.00','2,250,000','KHMT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV02','Tran Tam Thanh','TS','PGS','Nam','12/17/1965','4/20/2004','4.50','2,025,000','HTTT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV03','Do Nghiem Phung','TS','GS','Nu','8/1/1950','9/23/2004','4.00','1,800,000','CNPM')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV04','Tran Nam Son','TS','PGS','Nam','2/22/1961','1/12/2005','4.50','2,025,000','KTMT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV05','Mai Thanh Danh','ThS','GV','Nam','3/12/1958','1/12/2005','3.00','1,350,000','HTTT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV06','Tran Doan Hung','TS','GV','Nam','3/11/1953','1/12/2005','4.50','2,025,000','KHMT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV07','Nguyen Minh Tien','ThS','GV','Nam','11/23/1971','3/1/2005','4.00','1,800,000','KHMT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV08','Le Thi Tran','KS','Nu','3/26/1974','3/1/2005','1.69','760,500','KHMT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV09','Nguyen To Lan','ThS','GV','Nu','12/31/1966','3/1/2005','4.00','1,800,000','HTTT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI,  GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV10','Le Tran Anh Loan','KS','Nu','7/17/1972','3/1/2005','1.86','837,000','CNPM')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV11','Ho Thanh Tung','CN','GV','Nam','1/12/1980','5/15/2005','2.67','1,201,500','MTT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA )values('GV12','Tran Van Anh','CN','Nu','3/29/1981','5/15/2005','1.69','760,500','CNPM')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV13','Nguyen Linh Dan','CN','Nu','5/23/1980','5/15/2005','1.69','760,500','KTMT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV14','Truong Minh Chau','ThS','GV','Nu','11/30/1976','5/15/2005','3.00','1,350,000','MTT')
Insert into GIAOVIEN( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA ) values('GV15','Le Ha Thanh','ThS','GV','Nam','5/4/1978','5/15/2005','3.00','1,350,000','KHMT')
select * from GIAOVIEN
--lop
Insert into LOP(MALOP, TENLOP, SISO, MAGVCN) values ('K11','lop 1 khoa 1','11','GV07')
Insert into LOP(MALOP, TENLOP, SISO, MAGVCN) values ('K12','lop 2 khoa 2','12','GV09')
Insert into LOP(MALOP, TENLOP, SISO, MAGVCN) values ('K13','lop 3 khoa 3','12','GV14')
select * from LOP

--hocvien
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1101','NGUYEN VAN','A','1/27/1986','Nam','TpHCM','K11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1102','Tran Ngoc','HAN','3/14/1986','NU','KIEN GIANG','k11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1103','HA DUY','Lap','4/18/1986','Nam','NGHE AN','k11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1104','TRAN NGOC','LINH','3/30/1986','NU','TAY NINH','k11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1105','TRAN MINH','LONG','2/27/1986','NAM','TpHCM','k11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1106','LE NHAT','MINH','1/24/1986','NAM','TpHCM','k11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1107','NGUYEN NHU','NHUT','1/27/1986','NAM','HA NOI','k11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1108','NGUYEN MANH','TAM','2/27/1986','NAM','KIEN GIANG','k11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1109','PHAN THI THANH','TAM','1/27/1986','NU','VINH LONG','k11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1110','LE HOAI','THUONG','2/5/1986','NU','CAN THO','k11')
insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) values ('k1111','LE HA','VINH','12/25/1986','NAM','VINH LONG','k11')


insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1201','Nguyen van','B','2/11/1986','Nu','Kien Giang','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1202','Nguyen Thi Kim ','Duyen','1/18/1986','Nu','tpHCM','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1203','Tran Thi Kim','Duyen','9/17/1986','nu','tpHCM','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1204','TRuong My','Hanh','5/19/1986','nu','Dong Nai','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1205','Nguyen Thanh','Nam','4/17/1986','Nam','TpHCM','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1206','Nguyen Thi TRuc ','Thanh','3/4/1986','nu','Kien Giang','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1207','Tran Thi Bich ','Thuy','2/8/1986','Nu','Nghe An','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1208','Huynh Thi Kim ','Trieu','4/8/1986','Nu','Tay Ninh','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1209','Pham Thanh','Trieu','2/23/1986','Nam','TpHCM','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1210','Ngo Thanh ','Tuan','2/14/1986','Nam','TpHCM','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1211','Do Thi ','Xuan','3/9/1986','Nu','Ha Noi','K12')
insert into HOCVIEN(MAHV , HO, TEN , NGSINH , GIOITINH , NOISINH , MALOP) values('K1212','Le Thi Phi','Yen','3/12/1986','Nu','TpHCM','K12')


INSERT INTO HOCVIEN VALUES('K1301','Nguyen Thi Kim','Cuc','6/9/1986','Nu','Kien Giang','K13');
INSERT INTO HOCVIEN VALUES('K1302','Truong Thi My','Hien','3/18/1986','Nu','Nghe An','K13');
INSERT INTO HOCVIEN VALUES('K1303','Le Duc','Hien','3/21/1986','Nam','Tay Ninh','K13');
INSERT INTO HOCVIEN VALUES('K1304','Le Quang','‘Hien','4/18/1986','Nam','TpHCM','K13');
INSERT INTO HOCVIEN VALUES('K1305','Le Thi','Huong','3/27/1986','Nu','TpHCM','K13');
INSERT INTO HOCVIEN VALUES('K1306','Nguyen Thai','Huu','3/30/1986','Nam','Ha Noi','K13');
INSERT INTO HOCVIEN VALUES('K1307','Tran Minh','Man','5/28/1986','Nam','TpHCM','K13');
INSERT INTO HOCVIEN VALUES('K1308','Nguyen Hieu','Nghia','4/8/1986','Nam','Kien Giang','K13');
INSERT INTO HOCVIEN VALUES('K1309','Nguyen Trung',' Nghia','1/18/1987','Nam','Nghe An','K13');
INSERT INTO HOCVIEN VALUES('K1310','Tran Thi Hong','Tham','4/22/1986','Nu','Tay Ninh','K13');
INSERT INTO HOCVIEN VALUES('K1311','Tran Minh','Thuc','4/4/1986','Nam','TpHCM','K13');
INSERT INTO HOCVIEN VALUES('K1312','Nguyen Thi Kim ','Yen','9/7/1986','Nu','TpHCM','K13');



Select * FROM HOCVIEN
--giangday

insert into giangday values ('K11', 'THDC', 'GV07', 1, 2006, '1/2/2006', '5/12/2006'),
							('K12', 'THDC', 'GV06', 1, 2006, '1/2/2006', '5/12/2006'),
							('K13', 'THDC', 'GV15', 1, 2006, '1/2/2006', '5/17/2006'),
							('K11', 'CTRR', 'GV02', 1, 2006, '1/9/2006', '5/17/2006'),
							('K12', 'CTRR', 'GV02', 1, 2006, '1/9/2006', '5/17/2006'),
							('K13', 'CTRR', 'GV08', 1, 2006, '1/9/2006', '5/17/2006'),
							('K11', 'CSDL', 'GV05', 2, 2006, '6/1/2006', '7/15/2006'),
							('K12', 'CSDL', 'GV09', 2, 2006, '6/1/2006', '7/15/2006'),
							('K13', 'CTDLGT', 'GV15', 2, 2006,  '6/1/2006', '7/15/2006'),
							('K13', 'CSDL', 'GV05', 3, 2006,  '8/1/2006', '12/15/2006'),
							('K13', 'DHMT', 'GV07', 3, 2006,  '8/1/2006', '12/15/2006'),
							('K11', 'CTDLGT', 'GV15', 3, 2006,  '8/1/2006', '12/15/2006'),
							('K12', 'CTDLGT', 'GV15', 3, 2006,  '8/1/2006', '12/15/2006'),
							('K11', 'HDH', 'GV04', 1, 2007, '1/2/2007', '7/15/2007'),
							('K12', 'HDH', 'GV04',  1, 2007, '1/2/2007', '3/20/2007'),
							('K11', 'DHMT', 'GV07',  1, 2007, '2/18/2007', '3/20/2007')
select * from GIANGDAY

--ketquathi
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1101','CSDL','1','7/20/2006','10.00','Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1101','CTDLGT','1','12/28/2006','9.00','Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1101','THDC','1','5/20/2006','9.00','Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1101','CTRR','1','5/13/2006','9.50','Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1102','CSDL','1','7/20/2006','4.00','Khong Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1102','CSDL','2','7/27/2006','4.25','Khong Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1102','CSDL','3','8/10/2006','4.50','Khong Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1102','CTDLGT','1','12/28/2006','4.50','Khong Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1102','CTDLGT','2','1/5/2007','4.00','Khong Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1102','CTDLGT','3','1/15/2007','6.00','Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1102','THDC','1','5/20/2006','5.00','Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1102','CTRR','1','5/13/2006','7.00','Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1103','CSDL','1','7/20/2006','3.50','Khong Dat')
Insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) values('K1103','CSDL','2','7/27/2006','8.25','Dat')




INSERT INTO KETQUATHI values ('K1103','CTDLGT','1','12/28/2006','7.00','Dat');
INSERT INTO KETQUATHI  values ('K1103','THDC','1','5/20/2006','8.00','Dat');
INSERT INTO KETQUATHI values  ('K1103','CTRR','1','5/13/2006','6.50','Dat');
INSERT INTO KETQUATHI  values ('K1104','CSDL','1','7/20/2006','3.75','Khong Dat');
INSERT INTO KETQUATHI  values ('K1104','CTDLGT','1','12/28/2006','4.00','Khong Dat');
INSERT INTO KETQUATHI  values ('K1104','THDC','1','5/20/2006','4.00','Khong Dat');
INSERT INTO KETQUATHI  values ('K1104','CTRR','1','5/13/2006','4.00','Khong Dat');
INSERT INTO KETQUATHI values  ('K1104','CTRR','2','5/20/2006','3.50','Khong Dat');
INSERT INTO KETQUATHI values  ('K1104','CTRR','3','6/30/2006','4.00','Khong Dat');
INSERT INTO KETQUATHI values  ('K1201','CSDL','1','7/20/2006','6.00','Dat');
INSERT INTO KETQUATHI values  ('K1201','CTDLGT','1','12/28/2006','5.00','Dat');
INSERT INTO KETQUATHI values  ('K1201','THDC','1','5/20/2006','8.50','Dat');
INSERT INTO KETQUATHI values  ('K1201','CTRR','1','5/13/2006','9.00','Dat');
INSERT INTO KETQUATHI values  ('K1202','CSDL','1','7/20/2006','8.00','Dat');


INSERT INTO KETQUATHI VALUES('K1202', 'CTDLGT', 1, '12/28/2006',4.00, 'Khong Dat');
INSERT INTO KETQUATHI VALUES('K1202', 'CTDLGT', 2, '5/1/2007',5.00, 'Dat');
INSERT INTO KETQUATHI VALUES('K1202', 'THDC', 1, '5/20/2006',4.00, 'Khong Dat');
INSERT INTO KETQUATHI VALUES('K1202', 'THDC', 2, '5/27/2006',4.00, 'Khong Dat');
INSERT INTO KETQUATHI VALUES('K1202', 'CTRR', 1, '5/13/2006',3.00, 'Khong Dat');
INSERT INTO KETQUATHI VALUES('K1202', 'CTRR', 2, '5/20/2006',4.00, 'Khong Dat');
INSERT INTO KETQUATHI VALUES('K1202', 'CTRR', 3, '6/30/2006',6.25, 'Dat');
INSERT INTO KETQUATHI VALUES('K1203', 'CSDL', 1, '7/20/2006',9.25, 'Dat');
INSERT INTO KETQUATHI VALUES('K1203', 'CTDLGT', 1, '12/28/2006',6.75, 'Dat');
INSERT INTO KETQUATHI VALUES('K1203', 'THDC', 1, '5/20/2006',10.00, 'Dat');
INSERT INTO KETQUATHI VALUES('K1203', 'CTRR', 1, '5/13/2006',10.00, 'Dat');
INSERT INTO KETQUATHI VALUES('K1204', 'CSDL', 1, '7/20/2006',8.50, 'Dat');
INSERT INTO KETQUATHI VALUES('K1204', 'CTDLGT', 1, '12/28/2006',6.75, 'Dat');
INSERT INTO KETQUATHI VALUES('K1204', 'THDC', 1, '5/20/2006',4.00, 'Khong Dat');


insert into ketquathi values ('K1204','CTRR','1','5/13/2006','6.00','Dat')
insert into ketquathi values ('K1301','CSDL','1','12/20/2006','4.25','Khong Dat')
insert into ketquathi values ('K1301','CTDLGT','1','7/25/2006','8.00','Dat')
insert into ketquathi values ('K1301','THDC','1','5/20/2006','7.75','Dat')
insert into ketquathi values ('K1301','CTRR','1','5/13/2006','8.00','Dat')
insert into ketquathi values ('K1302','CSDL','1','12/20/2006','8.50','Dat')
insert into ketquathi values ('K1302','CTDLGT','1','7/25/2006','5.00','Dat')
insert into ketquathi values ('K1302','THDC','1','5/20/2006','8.00','Dat')
insert into ketquathi values ('K1302','CTRR','1','5/13/2006','8.50','Dat')
insert into ketquathi values ('K1303','CSDL','1','12/20/2006','4.00','Khong Dat')

insert into ketquathi values ('K1303','CTDLGT','1','7/25/2006','4.50','Khong Dat')
insert into ketquathi values ('K1303','CTDLGT','2','8/7/2006','4.00','Khong Dat')
insert into ketquathi values ('K1303','CTDLGT','3','8/15/2006','4.25','Khong Dat')
insert into ketquathi values ('K1303','THDC','1','5/20/2006','4.50','Khong Dat')
insert into ketquathi values ('K1303','CTRR','1','5/13/2006','3.25','Khong Dat')
insert into ketquathi values ('K1303','CTRR','2','5/20/2006','5.00','Dat')
insert into ketquathi values ('K1304','CSDL','1','12/20/2006','7.75','Dat')
insert into ketquathi values ('K1304','CTDLGT','1','7/25/2006','9.75','Dat')
insert into ketquathi values ('K1304','THDC','1','5/20/2006','5.50','Dat')
insert into ketquathi values ('K1304','CTRR','1','5/13/2006','5.00','Dat')
insert into ketquathi values ('K1305','CSDL','1','12/20/2006','9.25','Dat')
insert into ketquathi values ('K1305','CTDLGT','1','7/25/2006','10.00','Dat')
insert into ketquathi values ('K1305','THDC','1','5/20/2006','8.00','Dat')
insert into ketquathi values ('K1305','CTRR','1','5/13/2006','10.00','Dat')


select * from KETQUATHI order by mahv

update khoa set trgkhoa='GV01' where MaKhoa='KHMT';
update khoa set trgkhoa='GV02' where MaKhoa='HTTT';
update khoa set trgkhoa='GV03' where MaKhoa='MTT';
update khoa set trgkhoa='GV04' where MaKhoa='CNPM';
update lop set trglop='K1108' where malop='K11';
update lop set trglop='K1205' where malop='K12';
update lop set trglop='K1305' where malop='K13';
select * from khoa
select * from lop
--EXERCISE 12
SELECT A.MAHV, HO + ' ' + TEN AS HOTEN, LANTHI, KQUA
FROM HOCVIEN A, KETQUATHI B
WHERE A.MAHV = B.MAHV AND KQUA LIKE 'KHONG DAT' 
	AND A.MAHV NOT IN (SELECT MAHV FROM KETQUATHI WHERE LANTHI = 2)

--EXERCISE 13

SELECT DISTINCT MAGV, HOTEN
FROM GIAOVIEN 
WHERE MAGV NOT IN (SELECT MAGV FROM GIANGDAY)

--EXERCISE 14

SELECT DISTINCT A.MAGV, HOTEN
FROM GIAOVIEN A, GIANGDAY B, MONHOC C
WHERE A.MAGV NOT IN 
	(
		SELECT DISTINCT A.MAGV
		FROM GIAOVIEN A, MONHOC B, GIANGDAY C 
		WHERE C.MAMH = B.MAMH AND A.MAKHOA = B.MAKHOA
	)


--EXERCISE 15

SELECT HO + ' ' + TEN AS HOTEN, A.MAHV, LANTHI, KQUA
FROM HOCVIEN A, KETQUATHI B
WHERE A.MAHV = B.MAHV
	AND (
			(LANTHI = 3 AND KQUA = 'KHONG DAT' AND A.MALOP = 'K11' ) 
			OR 
			(LANTHI = 2 AND B.MAMH = 'CTRR' AND DIEM = 5) 
		)

--EXERCISE 16

SELECT HOTEN
FROM GIAOVIEN A, GIANGDAY B
WHERE A.MAGV = B.MAGV AND B.MAMH = 'CTRR'
GROUP BY HOTEN
HAVING COUNT(A.MAGV) >= 2;


--EXERCISE 17
 
SELECT A.MAHV, DIEM
FROM HOCVIEN A, KETQUATHI B
WHERE A.MAHV = B.MAHV AND MAMH = 'CSDL' AND 
	LANTHI = (
				SELECT MAX(LANTHI) 
				FROM KETQUATHI AA 
				WHERE A.MAHV = AA.MAHV AND AA.MAMH = B.MAMH
			 )
ORDER BY A.MAHV ASC

--EXERCISE 18

SELECT A.MAHV, DIEM
FROM HOCVIEN A, KETQUATHI B
WHERE A.MAHV = B.MAHV AND MAMH = 'CSDL' AND 
	DIEM IN (
				SELECT MAX(DIEM) 
				FROM KETQUATHI C 
				WHERE A.MAHV = C.MAHV AND B.MAMH = C.MAMH
			)

--EXERCISE 19

SELECT MAKHOA, TENKHOA, NGTLAP
FROM KHOA A
WHERE NGTLAP = (
					SELECT MIN(NGTLAP)
					FROM KHOA B
				)

--EXERCISE 20

SELECT COUNT(MAGV) AS GS_PGS
FROM GIAOVIEN
WHERE HOCHAM IN ('GS', 'PGS')

--EXERCISE 21

SELECT A.MAKHOA, COUNT(B.MAGV)
FROM KHOA A, GIAOVIEN B
WHERE A.MAKHOA = B.MaKhoa AND HOCVI IN ('CN', 'KS', 'THS', 'TS', 'PTS')
GROUP BY A.MAKHOA


--EXERCISE 22

SELECT TDAT.MAMH, DAT, KHONGDAT
FROM 
	(
		SELECT A.MAMH, COUNT(KQUA) AS DAT
		FROM MONHOC A, KETQUATHI B
		WHERE A.MAMH = B.MAMH AND KQUA = 'DAT'
		GROUP BY A.MAMH
	) TDAT,
	(
		SELECT A.MAMH, COUNT(KQUA) AS KHONGDAT
		FROM MONHOC A, KETQUATHI B
		WHERE A.MAMH = B.MAMH AND KQUA = 'KHONG DAT'
		GROUP BY A.MAMH
	) TKDAT
WHERE TDAT.MAMH = TKDAT.MAMH


--EXERCISE 23

SELECT A.MAGV, HOTEN, COUNT(B.MAMH)
FROM GIAOVIEN A, GIANGDAY B, LOP C
WHERE A.MAGV = B.MAGV AND C.MAGVCN = A.MAGV AND C.MALOP = B.MALOP
GROUP BY A.MAGV, HOTEN
HAVING COUNT(B.MAMH) >= 1


--EXERCISE 24

SELECT HO + ' ' + TEN AS HOTEN
FROM HOCVIEN A, LOP B
WHERE A.MAHV = B.TRGLOP AND B.SISO IN(
										SELECT MAX(SISO)
										FROM LOP 
									)

--EXERCISE 25

SELECT TOP 1 WITH TIES A.MAHV, COUNT(A.MAHV) AS SOMON
FROM HOCVIEN A, KETQUATHI B
WHERE A.MAHV = B.MAHV AND B.DIEM BETWEEN 9 AND 10
GROUP BY A.MAHV
ORDER BY SOMON DESC


--EXERCISE 26

SELECT * FROM KETQUATHI 
SELECT A.MAHV, COUNT(DIEM), MALOP
FROM HOCVIEN A, KETQUATHI B
WHERE A.MAHV = B.MAHV AND B.DIEM BETWEEN 9 AND 10
GROUP BY MALOP, A.MAHV
HAVING COUNT(DIEM) >= ALL (
							SELECT COUNT(D.DIEM) 
							FROM HOCVIEN C, KETQUATHI D 
							WHERE C.MALOP = A.MALOP AND D.DIEM BETWEEN 9 AND 10 AND C.MAHV = D.MAHV
							GROUP BY C.MALOP, D.MAHV
						)

--EXERCISE 30
select a.mahv, ho + ' ' + ten as hoten
from hocvien a, ketquathi b
where a.mahv = b.mahv and a.mahv not in (									
											select mahv
											from ketquathi
											where kqua = 'khong dat'
										)
---exercise 29
select a.mamh, tenmh, count(a.mamh)
from monhoc a, ketquathi b
where a.Mamh = b.mamh and b.lanthi = 1 and b.kqua = 'khong dat'
group by a.Mamh, tenmh
having count(a.mamh) >= all
(	
	select count(a.mamh) 
	from ketquathi c 
	where a.mamh = c.mamh and c.lanthi = 1 and c.kqua = 'khong dat'
)

--repeat ex 25
select top 1 a.mahv, ho + ' ' + ten as hoten, count(mamh) as somon
from hocvien a, ketquathi b
where a.mahv = b.mahv and b.diem between 9 and 10
group by a.mahv, ho, ten
order by somon desc


--repeat 24
select top 1 with ties a.mahv, ho + ' ' + ten as hoten, siso
from hocvien a, lop b
where a.malop = b.malop and a.mahv = b.trglop
order by siso desc

--repeat 23
select a.magv, hoten
from giaovien a, giangday b, lop c
where a.magv = b.magv and a.magv = c.magvcn and b.malop = c.malop
group by a.magv, hoten
having count(a.magv) >= 1

