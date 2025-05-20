create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
id int primary key auto_increment,
name varchar(225)  unique,
age int check (age>18));

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