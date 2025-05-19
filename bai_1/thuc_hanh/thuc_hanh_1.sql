create database thuc_hanh;
use thuc_hanh;
create table student(
id int,
name varchar(100),
age int,
country varchar(50)
);

insert into student (id,name,age,country) values(1,"nhon",18,"tay son"),
(2,"nhon",18,"tay son");
select * from student;
select name from student;
alter table student add primary key (id);
delete from student where id=2;
update student set country="binh dinh" where id=1;
