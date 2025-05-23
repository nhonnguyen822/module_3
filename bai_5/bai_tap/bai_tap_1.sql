CREATE DATABASE IF NOT EXISTS demo;
USE demo;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productCode VARCHAR(50),
    productName VARCHAR(50),
    productPrice INT,
    productAmount VARCHAR(50),
    productDescription VARCHAR(50),
    productStatus TINYINT
);

DELIMITER //
CREATE PROCEDURE insert_dummy_products()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
        INSERT INTO products (
            productCode,
            productName,
            productPrice,
            productAmount,
            productDescription,
            productStatus
        ) VALUES (
            CONCAT('P', i),
            CONCAT('Product ', i),
            FLOOR(100 + RAND() * 900), -- giá từ 100 đến 999
            CONCAT(FLOOR(1 + RAND() * 100), ' pcs'), -- số lượng
            CONCAT('Description for product ', i),
            FLOOR(RAND() * 2) -- 0 hoặc 1
        );
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

-- Gọi thủ tục:
CALL insert_dummy_products();
SELECT COUNT(*) FROM products;

create unique index i_products_code on products(productCode);
create index i_composite_product on products(productName,productPrice);
explain select * from products where productCode=1;
explain select * from products where productName='productName 1'and productPrice=2000;


create view view_products as 
select productCode, productName, productPrice, productStatus from products;

select * from  view_products;


create or replace view view_products as 
select productCode, productName, productPrice, productStatus from products
where productPrice > 500;


drop view view_products ;

delimiter //
create procedure p_get_all_products()
begin
select * from products;
end //
delimiter ;

delimiter //
create procedure p_update_by_id(in id int ,in productName varchar(50))
begin
update products set productName =productName ;
end //
delimiter ;

delimiter //
create procedure p_find_by_id(in id int)
begin
select * from products where id =id;
end //
delimiter ;

delimiter //
create procedure p_addproducts(in productCode int,in productName varchar(50) ,
in productPrice int ,
in productAmount varchar(50) ,
in productDescription varchar(50) ,
in productStatus tinyint)
begin
insert into products (productCode,productName,productPrice,productAmount,productDescription,productStatus) values
(productCode,productName,productPrice,productAmount,productDescription,productStatus);
end //
delimiter ;


