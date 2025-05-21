
create database if not exists quan_ly_internet;
use quan_ly_internet;

create table dich_vu_di_kem(
id int primary key auto_increment,
name varchar(50) not null unique);


create table hang_sx(
id int primary key auto_increment,
name varchar(50) not null unique);

create table loai_khach_hang(
id int primary key auto_increment,
name varchar(50) not null unique);

create table khach_hang(
id int primary key auto_increment,
ten_khach_hang varchar(50)not null unique,
sdt int ,
email varchar (50),
loai_khach_hang_id int,
foreign key(loai_khach_hang_id) references loai_khach_hang(id));



create table computer(
id int primary key auto_increment,
hang_sx_id int,
vi_tri_may int ,
foreign key (hang_sx_id) references hang_sx(id)
);

create table computer_khach_hang(
ma_khach_hang int ,
ma_computer int ,
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
tong_tien float,
primary key (ma_khach_hang,ma_computer),
foreign key (ma_khach_hang) references  khach_hang(id),
foreign key (ma_computer) references computer(id));


create table khach_hang_dich_vu_them(
ma_kh int,
ma_dv int,
primary key (ma_kh,ma_dv),
foreign key(ma_kh) references khach_hang(id),
foreign key(ma_dv) references dich_vu_di_kem(id)
);


select * from computer;
select * from computer_khach_hang;
select * from dich_vu_di_kem;
select * from hang_sx;
select * from khach_hang;
select * from loai_khach_hang;
select * from khach_hang_dich_vu_them;


 