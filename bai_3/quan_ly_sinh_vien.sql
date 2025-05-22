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

insert into class (name, start_date, status) values 
('c0225g1', '2024-01-10', 1),
('c0325g1', '2024-02-01', 1),
('c0525g1', '2024-03-05', 1),
('c0925g1', '2024-04-20', 0);

insert into students (name, adress, phone, status, class_id) values
('Nguyễn Văn An', 'Hà Nội', '0912345678', 1, 1),
('Trần Thị Binh', 'Hồ Chí Minh', '0923456789', 1, 2),
('Lê Văn Cam', 'Đà Nẵng', '0934567890', 1, 1),
('Phạm Thị uy', 'Cần Thơ', '0945678901', 0, 3),
('Đỗ Văn Em', 'Huế', '0956789012', 1, 2),
('Hoàng Thị Ni', 'Nha Trang', '0967890123', 1, 3),
('Vũ Văn Ga', 'Hà Nam', '0978901234', 1, 1),
('Phan Thị Huy', 'Nam Định', '0989012345', 0, 4),
('Ngô Văn ý', 'Bình Dương', '0990123456', 1, 4),
('Dương Thị Kiet', 'Hải Phòng', '0901234567', 1, 2);

insert into subjects (name, credit, status) values 
('Toán rời rạc', 3, 1),
('Cấu trúc dữ liệu', 2, 1),
('Cơ sở dữ liệu', 3, 1),
('Thiết kế Web', 2, 0);

insert into mark (sub_id, student_id, mark, examtimes) values
(1, 1, 85.5, 1),
(2, 2, 70.0, 2),
(3, 3, 92.0, 1),
(1, 4, 55.5, 3);



