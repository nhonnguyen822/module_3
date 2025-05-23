USE classicmodels;
delimiter // 
create procedure find_all_customer()
begin 
select * from customers;
end//
call find_all_customer();

drop procedure if exists find_all_customer;
delimiter //
create procedure find_all_customers()
begin
select * from customers where customerNumber=175;
end //
delimiter ;
call find_all_customers()
