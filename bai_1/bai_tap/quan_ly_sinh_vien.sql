create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table Class(
id int primary key,
name varchar(100));
create table Teachers(
id int ,
name varchar(100),
age int,
country varchar(50));
alter table Teachers add primary key(id);
insert into teachers (id,name,age,country) values(1,"nhon",18,"tay son");
insert into teachers (id,name,age,country) values(2,"nhi",18,"tay son");
select * from teachers;
insert into class (id,name) values (1,"c02");
insert into class (id,name) values (2,"c03");
select * from class;


