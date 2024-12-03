create database bai1
use bai1
create table student(
    id varchar(4) not null primary key,
    name nvarchar(40),
    grade varchar(3)
)


insert into student values('3353', 'gumball', '23');

select * from student