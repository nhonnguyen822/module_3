create database if not exists bai_tap_1_bai_2;
use bai_tap_1_bai_2;

create table sdt(
id int primary key,
sdt int unique  
);

create table nha_cung_cap(
ma_cung_cap int primary key,
ten_nha_cung_cap varchar (100),
dia_chi varchar (100),
sdt int,
foreign key(sdt) references sdt(id));



create table don_dat_hang(
so_don_hang int primary key,
ngay_dat_hang date ,
ma_nha_cung_cap int ,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_cung_cap)
);

create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date 
);

create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat date 
);

create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar (100) 
);

create table phieu_xuat_vat_tu(
ma_vat_tu int,
so_phieu_xuat int,
so_luong int ,
don_gia float,
primary key(ma_vat_tu,so_phieu_xuat),
foreign key (ma_vat_tu)references vat_tu(ma_vat_tu),
foreign key (so_phieu_xuat)references phieu_xuat(so_phieu_xuat)
);

create table phieu_nhap_vat_tu(
ma_vat_tu int,
so_phieu_nhap int,
so_luong int ,
don_gia float,
primary key(ma_vat_tu,so_phieu_nhap),
foreign key (ma_vat_tu)references vat_tu(ma_vat_tu),
foreign key (so_phieu_nhap)references phieu_nhap(so_phieu_nhap)
);

create table vat_tu_don_hang(
ma_vat_tu int,
so_don_hang int,
primary key(ma_vat_tu,so_don_hang),
foreign key (ma_vat_tu)references vat_tu(ma_vat_tu),
foreign key (so_don_hang)references don_dat_hang(so_don_hang)
);