create database if not exists quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
id int auto_increment primary key,
name varchar(60) not null,
start_date datetime not null,
status bit );

create table students(
id int auto_increment primary key,
name varchar(60) not null,
adress varchar(50),
phone varchar(10),
status bit,
class_id int,
foreign key (class_id) references class(id));

create table subjects(
id int auto_increment primary key,
name varchar(60) not null,
credit tinyint not null default 1 check(credit >=1),
status bit  default 1
);

create table mark(
id int auto_increment primary key,
sub_id int,
student_id int ,
mark float default 0 check(mark between 0 and 100),
examtimes tinyint default 1,
foreign key (sub_id) references subjects(id),
foreign key (student_id) references students(id)
);

insert into class (name,start_date) values ('c0225g1' ,'2000-12-12');
insert into class (name,start_date) values ('c0325g1' ,'2000-12-12');
insert into class (name,start_date) values ('c0525g1' ,'2000-12-12');
insert into class (name,start_date) values ('c0925g1' ,'2000-12-12');

insert into students (name,adress,phone,class_id) values
 ('nguyen thanh nhon','tay son','0256854587',1),
 ('nguyen thanh hung','tay son','0256854587',1),
 ('nguyen thanh nhi','tay son','0256854587',2),
 ('tran van nam','tay son','0256854587',4);
 insert into students (name,adress,phone) values
 ('nguyen thanh huong','tay son','0256854587'),
 ('nguyen can thanh ','tay son','0256854587');

insert into subjects(name,credit) values
 ('toan' ,1),
 ('ly' ,3),
 ('hoa' ,5);
 
 insert into mark(sub_id,student_id,mark,examtimes) values
 (1,1,5,30),
 (2,2,5,30),
 (3,3,5,30),
 (2,4,5,30),
 (1,5,5,30);
 
 select * from students
 where name like'% h%';

 select * from class
 where month(start_date)=12;
 
 select * from subjects 
 where credit between 3 and 5;
 
 update students set class_id= 2
 where name like '% hung';
 
 select s.name,sub.name,m.mark from mark m join students s on  m.student_id=s.id join subjects sub on m.sub_id=sub.id
 order by m.mark ,substring_index(s.name,' ',-1);