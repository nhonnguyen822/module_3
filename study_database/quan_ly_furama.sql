create database if not exists quan_ly_khu_nghi_duong_furama;
use quan_ly_khu_nghi_duong_furama;

create table vi_tri
(ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45));

create table trinh_do
(ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45));

create table bo_phan
(ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45));

create table nhan_vien
(ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan));

create table loai_khach
(ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45));

create table khach_hang
(ma_khach_hang int primary key auto_increment,
ma_loai_khach_hang int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit default (1),
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (ma_loai_khach_hang) references loai_khach(ma_loai_khach));

create table dich_vu_di_kem
(ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45));

create table loai_dich_vu
(ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45));

create table loai_kieu_thue
(ma_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45));

create table dich_vu
(ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
foreign key (ma_kieu_thue) references loai_kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu));


create table hop_dong
(ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu));

create table hop_dong_chi_tiet
(ma_hop_dong_chi_tiet int primary key auto_increment,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int,
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem));

insert into vi_tri(ten_vi_tri) values
('Quản Lý'),
('Nhân Viên');

insert into trinh_do(ten_trinh_do) values
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đaị Học');

insert into bo_phan(ten_bo_phan) values
('Sele_Marketing'),
('Hành Chính'),
('Phục Vụ'),
('Quản Lý');

insert into loai_khach(ten_loai_khach) values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values
('Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','mailto:annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
('Lê Văn Bình','1997-04-09','654231234',7000000,'0934212314','mailto:binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2),
('Hồ Thị Yến','1995-12-12','999231723',14000000,'0412352315','mailto:thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
('Võ Công Toản','1980-04-04','123231365',17000000,'0374443232','mailto:toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
('Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'0902341231','mailto:phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
('Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','mailto:annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
('Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','mailto:nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
('Nguyễn Hà Đông','1989-09-03','234414123',9000000,'0642123111','mailto:donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
('Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','mailto:hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
('Nguyễn Công Đạo','1994-01-08','755434343',8000000,'0988767111','mailto:nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);

insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach_hang)values
('Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','mailto:thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
('Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','mailto:xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',3),
('Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','mailto:nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
('Dương Văn Quan','1981-07-08',1,'543432111','0490039241','mailto:duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng',1),
('Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','mailto:nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
('Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','mailto:tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
('Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','mailto:kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
('Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','mailto:haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
('Trần Đại Danh','1994-07-01',1,'432341235','0643343433','mailto:danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1),
('Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','mailto:dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',2);

insert into loai_kieu_thue(ten_kieu_thue) values 
('year'),
('month'),
('day'),
('hour');

insert into loai_dich_vu(ten_loai_dich_vu) values
('Villa'),
('House'),
('Room');

insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu) values
('Villa Beach Front',25000,10000000,10,'vip','Có hồ bơi',500,4,3,1),
('House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướngi',null,3,2,2),
('Room Twin 01',5000,1000000,2,'normal','Có tivi',null,null,4,3),
('Villa No Beach Front',9000000,10000000,8,'normal','Có hồ bơi',300,3,3,1),
('House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',null,2,3,2),
('Room Twin 02',3000,900000,2,'normal','Có tivi',null,null,4,3);

insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai) values
('Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
('Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
('Thuê xe đạp', 20000, 'chiếc', 'tốt'),
('Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');


insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) values
('2020-12-08', '2020-12-08', 0, 3, 1, 3),
('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
('2021-07-14', '2021-07-15', 0, 7, 2, 6),
('2021-06-01', '2021-06-03', 0, 7, 7, 6),
('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
('2020-11-19', '2020-11-19', 0, 3, 4, 3),
('2021-04-12', '2021-04-14', 0, 10, 3, 5),
('2021-04-25', '2021-04-25', 0, 2, 2, 1),
('2021-05-25', '2021-05-27', 0, 7, 10, 1);

insert into hop_dong_chi_tiet(so_luong, ma_hop_dong, ma_dich_vu_di_kem) values
(5, 2, 4),
(8, 2, 5),
(15, 2, 6),
(1, 3, 1),
(11, 3, 2),
(1, 1, 3),
(2, 1, 2),
(2, 12, 2);

-- Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.

-- 2,Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
 from nhan_vien 
 where ho_ten regexp '^[HTK]'
 and char_length(ho_ten) <=15;
 
 -- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
 select * from khach_hang 
 where year(now()) - year(ngay_sinh) >=18
 and year(now()) - year(ngay_sinh) <=50
 and substring_index(dia_chi,',',-1) regexp'Đà Nẵng'
 or substring_index(dia_chi,',',-1) regexp'Quảng Trị';
 
--  4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
 
 select kh.* ,count(hd.ma_hop_dong) as sl_dat_phong from khach_hang kh 
 join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach_hang
 join hop_dong hd on kh.ma_khach_hang=hd.ma_khach_hang
 where lk.ten_loai_khach like'Diamond'
 group by kh.ma_khach_hang
 order by sl_dat_phong asc;
 
--  5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu,
--  ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
--  (Với tổng tiền được tính theo công thức như sau: 
--  Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).


select kh.ma_khach_hang,
kh.ho_ten,
lk.ten_loai_khach,
hd.ma_hop_dong,
dv.ten_dich_vu,
hd.ngay_lam_hop_dong,
hd.ngay_ket_thuc,
sum(dv.chi_phi_thue +ifnull(dv_dk.gia * hd_ct.so_luong,0))
from khach_hang  kh 
left join hop_dong hd on kh.ma_khach_hang=hd.ma_khach_hang
left join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach_hang
left join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
left join hop_dong_chi_tiet hd_ct on hd_ct.ma_hop_dong=hd.ma_hop_dong
left join dich_vu_di_kem dv_dk on dv_dk.ma_dich_vu_di_kem=hd_ct.ma_dich_vu_di_kem
group by kh.ma_khach_hang,hd.ma_hop_dong,dv.ma_dich_vu;

--  6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
--  ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 
--  (Quý 1 là tháng 1, 2, 3).

select d.ma_dich_vu,d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,ldv.ten_loai_dich_vu from dich_vu  d 
join hop_dong hd on d.ma_dich_vu=hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu=d.ma_loai_dich_vu
where d.ma_dich_vu not in(
 select ma_dich_vu
         from hop_dong 
         where year(ngay_lam_hop_dong)=2021 and month(ngay_lam_hop_dong) in(1,2,3)
       )
       group by d.ma_dich_vu;
       
     --   7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, 
--        chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 
--        2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select d.ma_dich_vu,d.ten_dich_vu,d.dien_tich,d.so_nguoi_toi_da ,d.chi_phi_thue,ldv.ten_loai_dich_vu from dich_vu  d 
join hop_dong hd on d.ma_dich_vu=hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu=d.ma_loai_dich_vu
where d.ma_dich_vu not in(
 select ma_dich_vu
         from hop_dong 
         where year(ngay_lam_hop_dong)=2021
       )
       group by d.ma_dich_vu;
       
       -- 8.Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
	select distinct * from khach_hang;
    
	select ho_ten from khach_hang
    where ho_ten in(select ho_ten from khach_hang
    group by ho_ten);
    
 --    9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 
--     2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(hd.ngay_lam_hop_dong) ,count(ma_dich_vu) from hop_dong hd
where year(hd.ngay_lam_hop_dong)=2021
group by month(hd.ngay_lam_hop_dong)
order by month(hd.ngay_lam_hop_dong);

-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
--  so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc, hd.tien_dat_coc,sum(hdct.so_luong),group_concat(dvdk.ten_dich_vu_di_kem) from hop_dong hd 
left join hop_dong_chi_tiet  hdct on  hd.ma_hop_dong=hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on  hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;
    
   -- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
--     có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong=hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang=hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach_hang
where lk.ten_loai_khach='Diamond'and substring_index(kh.dia_chi,',',-1) regexp'Vinh' or substring_index(kh.dia_chi,',',-1) regexp'Quảng Ngãi';

--    12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
--     so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong 
--     ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 
--     3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
       
       select hd.ma_hop_dong,
       nv.ho_ten,kh.ho_ten,
       kh.so_dien_thoai,
       dv.ten_dich_vu ,
       sum(hdct.so_luong) as so_luong_dich_vu_di_kem,
       hd.tien_dat_coc as tien_dat_coc
       from hop_dong  hd 
       left join dich_vu dv on dv.ma_dich_vu =hd.ma_dich_vu
       left join khach_hang kh on kh.ma_khach_hang=hd.ma_khach_hang
       left join nhan_vien nv on nv.ma_nhan_vien= hd.ma_nhan_vien
       left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
       left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
       where year(hd.ngay_lam_hop_dong)=2020 
       and month(hd.ngay_lam_hop_dong) in(10,11,12)
       and hd.ma_dich_vu not in(select ma_dich_vu from hop_dong
       where year(ngay_lam_hop_dong)=2020 and month(ngay_lam_hop_dong)=6)
       group by hd.ma_hop_dong;
       
     --   13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều
--        nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
	

select dvdk.ma_dich_vu_di_kem,
dvdk.ten_dich_vu_di_kem ,
sum(hdct.so_luong) as so_luong_su_dung
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem =dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong_su_dung =(
          select sum(so_luong) 
          from hop_dong_chi_tiet hdct 
          right join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
          group by dvdk.ma_dich_vu_di_kem 
          order by sum(so_luong) desc
          limit 1
);


--  14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hdct.ma_hop_dong,
ldv.ten_loai_dich_vu,
dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk 
join  hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong=hd.ma_hop_dong
join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
where hdct.ma_hop_dong_chi_tiet in(select dvdk.ma_dich_vu_di_kem from 
dich_vu_di_kem dvdk 
join  hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) =1)
group by  hdct.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem;

-- 15.Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select 
nv.ma_nhan_vien,
nv.ho_ten,
td.ten_trinh_do,
bp.ten_bo_phan,
nv.so_dien_thoai,
nv.dia_chi,
count(hd.ma_hop_dong)
 from nhan_vien nv 
 join bo_phan bp on nv.ma_bo_phan=bp.ma_bo_phan
 join trinh_do td on nv.ma_trinh_do =td.ma_trinh_do
 join hop_dong hd on hd.ma_nhan_vien=nv.ma_nhan_vien
 where year(hd.ngay_lam_hop_dong) in(2019,2020,2021)
 group by nv.ma_nhan_vien
 having count(hd.ma_nhan_vien) <=3;
 
 -- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
 
alter table nhan_vien add is_delete tinyint default 0;


create view nv_chua_tao_hd as select nv.ma_nhan_vien from nhan_vien nv left join hop_dong hd on nv.ma_nhan_vien=hd.ma_nhan_vien
where nv.ma_nhan_vien not in (
         select 
		 distinct nv.ma_nhan_vien
        from nhan_vien nv 
        join hop_dong hd on hd.ma_nhan_vien=nv.ma_nhan_vien
        where year(hd.ngay_lam_hop_dong) in(2019,2020,2021)
        )
        group by nv.ma_nhan_vien;
        
create temporary table bang_tam as select ma_nhan_vien from  nv_chua_tao_hd;
	
update nhan_vien set is_delete=1 where ma_nhan_vien in (select ma_nhan_vien from bang_tam);
 select * from  get_all_nv_chua_xoa;
 
--  17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
 
 
select kh.* from khach_hang kh 
join loai_khach lk on kh.ma_loai_khach_hang=lk.ma_loai_khach
where lk.ten_loai_khach in ('Platinium','Diamond')
and kh.ma_khach_hang in 
(
          select kh.ma_khach_hang from khach_hang kh 
          join hop_dong hd on kh.ma_khach_hang=hd.ma_khach_hang
          join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
          join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
          join dich_vu_di_kem  dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
          where year(hd.ngay_lam_hop_dong)=2021
          group by kh.ma_khach_hang
		  having sum(dv.chi_phi_thue+ ifnull(dvdk.gia*hdct.so_luong,0))>=10000000
)
group by kh.ma_khach_hang;

-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
alter table khach_hang add is_delete tinyint default 0;

create temporary table hd_truoc_2021 as (select hd.ma_khach_hang from hop_dong hd 
where year(hd.ngay_ket_thuc)<2021);

update khach_hang set is_delete =1 where ma_khach_hang in (select ma_khach_hang from hd_truoc_2021);
select ma_khach_hang ,ho_ten as ten_khach_hang_bi_xoa from khach_hang
where is_delete=1;

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
create temporary table dv_di_kem_tren_10 as 
select hdct.ma_dich_vu_di_kem from hop_dong_chi_tiet hdct join hop_dong hd on hd.ma_hop_dong=hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong)=2020
 group by ma_hop_dong_chi_tiet
 having sum(so_luong)>10;
 
update dich_vu_di_kem  set gia = gia/2 where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from dv_di_kem_tren_10);

select ma_dich_vu_di_kem,ten_dich_vu_di_kem from dich_vu_di_kem
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from dv_di_kem_tren_10);

-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select ma_khach_hang as id,ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from khach_hang 
union all
select ma_nhan_vien as id,ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from nhan_vien;

-- 21Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là 
-- “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as 
select nv.* from nhan_vien nv join hop_dong hd on hd.ma_nhan_vien=nv.ma_nhan_vien
 where  substring_index(nv.dia_chi,',',-2) regexp'Yên Bái' and  date(hd.ngay_lam_hop_dong)='2021-04-25'
group by nv.ma_nhan_vien;


-- 22 Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
SET SQL_SAFE_UPDATES =0;
update nhan_vien set dia_chi='Liên Chiểu' where dia_chi in(select dia_chi from v_nhan_vien);
SET SQL_SAFE_UPDATES =1;

-- 23Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với
--  ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter \\
create procedure sp_xoa_khach_hang(in id int)
begin 
update khach_hang set is_delete= 1 where ma_khach_hang=id;
end \\
delimiter ;

-- 24Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
-- với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter //
create procedure sp_them_moi_hop_dong(in ngay_kt datetime,in tien_dc float,
in ma_nv int,in ma_kh int, in ma_dv int)
begin
if tien_dc<0 then signal sqlstate'45000' set message_text ='tien dat coc khong the be hon 0';end if;
if ngay_kt<=now() then signal sqlstate '45000'
set message_text ='ngay ket thuc khong the nho hon ngay tao';end if;
if not exists (select *from khach_hang where ma_khach_hang=ma_kh) then signal sqlstate '45000'
set message_text ='ma khach hang khong ton tai';end if;
if not exists (select *from khach_hang where ma_khach_hang=ma_kh) then signal sqlstate '45000'
set message_text ='ma khach hang khong ton tai';end if;
if not exists (select *from nhan_vien where ma_nhan_vien=ma_nv) then signal sqlstate '45000'
set message_text ='ma nhan vien khong ton tai';end if;
if not exists (select *from dich_vu where ma_dich_vu=ma_dv) then signal sqlstate '45000'
set message_text ='ma dich vu khong ton tai';end if;
insert into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values(
 now(),ngay_kt,tien_dc,ma_nv,ma_kh,ma_dv);
end //
delimiter ;

--  25.Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng
--  số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.

alter table hop_dong add is_delete tinyint default 0;
 CREATE TABLE log_hd_chua_xoa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    massage varchar(100),
    log_time DATE
);
select massage ,log_time as so_luong_hd_con_lai from log_hd_chua_xoa

delimiter //
create function so_luong_hd_con_lai()
returns int
reads sql data
begin
declare so_luong_con_lai int;
select count(*) into so_luong_con_lai from hop_dong where is_delete=0;
return so_luong_con_lai;
end //
delimiter ;

 delimiter //
 create trigger tr_xoa_hop_dong
 after update on hop_dong
 for each row
 begin
 insert  into log_hd_chua_xoa (massage,log_time) values(so_luong_hd_con_lai(),now());
 end //
 delimiter ;

 update hop_dong set is_delete=1 where ma_hop_dong=1;
 
-- 26 Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, 
--  cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau:
--  Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.
--  Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra
--  thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.

create table log_cap_nhap_hop_dong(
 id INT PRIMARY KEY AUTO_INCREMENT,
 old_ngay_ket_thuc datetime,
 new_ngay_ket_thuc datetime,
 lod_time datetime);
 select*from log_cap_nhap_hop_dong;

delimiter //
create trigger  tr_cap_nhat_hop_dong 
before update on hop_dong
for each row
begin
if datediff(new.ngay_ket_thuc,old.ngay_lam_hop_dong) <2 then signal sqlstate '45000' set message_text ='ngay ket thuc hop dong phai lon hon ngay bat dau 2 ngay';end if;
insert  into log_cap_nhap_hop_dong ( old_ngay_ket_thuc,new_ngay_ket_thuc,lod_time) values(old.ngay_ket_thuc,new.ngay_ket_thuc,now());
end //
delimiter ;

update hop_dong set ngay_ket_thuc ='2020-12-12' where ma_hop_dong=1;

-- Tạo Function thực hiện yêu cầu sau:
-- Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
-- Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp
--  đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời 
--  gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng).
--  Mã của khách hàng được truyền vào như là 1 tham số của function này.

delimiter //
create function  func_dem_dich_vu ()
returns int 
reads sql data
begin
declare so_luong_dv int;
select count(*) into so_luong_dv from dich_vu where ma_dich_vu in (
       select dv.ma_dich_vu from  dich_vu dv join hop_dong hd on hd.ma_dich_vu=dv.ma_dich_vu
       group by dv.ma_dich_vu
	   having sum(dv.chi_phi_thue)>=2000000
);
return so_luong_dv;
end //
delimiter ;

delimiter //
create function  func_tinh_thoi_gian_hop_dong (ma_kh int)
returns int 
reads sql data
begin
declare max_thoi_gian int;
select max(datediff(ngay_ket_thuc,ngay_lam_hop_dong)) into max_thoi_gian from hop_dong where ma_khach_hang=ma_kh;
return max_thoi_gian;
end //
delimiter ;






 
 
 