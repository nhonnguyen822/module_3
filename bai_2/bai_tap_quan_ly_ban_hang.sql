create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
id int primary key auto_increment,
name varchar(225)  unique,
age int check (age>=10));

create table orders(
id int primary key auto_increment,
customer_id int,
ngay_order date,
total_price float check(total_price>0),
foreign key (customer_id) references customer(id));

CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name varchar(50) not null,
    price float check(price>0)
);


CREATE TABLE order_detail (
   order_id int,
   product_id int,
   order_quality int check(order_quality>0),
   primary key (order_id,product_id),
   foreign key (order_id) references orders(id),
   foreign key (product_id) references product(id)

);
insert into customer (name,age) values 
('minh quan ',10),
('ngoc oanh ',20),
('hong ha ',50);

insert into orders (customer_id,ngay_order) values 
(1,'2006-3-21'),
(2,'2006-3-23'),
(1,'2006-3-26');

 insert into product (product_name ,price) values 
 ('may giat' ,3),
 ('tu lanh' ,5),
 ('dieu hoat' ,7),
 ('quat' ,1),
 ('bep dien' ,2);
 
 insert into order_detail(order_id,product_id,order_quality) values
 (1,1,3),
 (1,3,7),
 (1,4,2),
 (2,1,1),
 (3,1,8),
 (2,5,4),
 (2,3,3);
 
 select o.id,o.ngay_order,o.total_price from orders o;
 
 select c.*,group_concat(p.product_name) as product_name
 from customer c 
 join orders o on c.id=o.customer_id 
 join order_detail od on o.id=od.order_id
 join product p on p.id=od.product_id
 group by c.id;
 
 select c.* from customer c left 
 join orders o on c.id=o.customer_id 
 where  o.id is null;
 
 select o.id as ma_hoa_don ,o.ngay_order as ngay_ban_hang , sum(od.order_quality*p.price) from orders o 
 join order_detail od on o.id=od.order_id 
 join product p on p.id=od.product_id
 group by o.id,o.ngay_order
 
 


 
