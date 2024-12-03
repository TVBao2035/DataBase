update Quyen_Permission set MaPermission=5 where MaPermission = 1 and MaQuyen = 1


Insert Permission (MaPermission, Actions) values
(5, 'read/sinhvien'),(6, 'create/sinhvien'), (7, 'delete/sinhvien'), (8, 'update/sinhvien'),
(9, 'read/khoa'), (10, 'create/khoa'), (11, 'delete/khoa'), (12, 'update/khoa'),
(13, 'read/nganh'), (14, 'create/nganh'), (15, 'delete/nganh'), (16, 'udpate/nganh')
select * from Permission
SELECT * FROM Quyen_Permission
WHERE MaPermission = 2 AND MaQuyen = 1;
select * from Quyen_Permission qp, Permission p, Quyen q where p.MaPermission = qp.MaPermission and q.MaQuyen = qp.MaQuyen and q.MaQuyen = 1