USE classicmodels;
delimiter //
create procedure get_customes_by_id(in cus_id int)
begin 
select * from customers where customerNumber=cus_id;
end //
delimiter ;
call get_customes_by_id(175)

delimiter \\
create procedure GetCustomersCountByCity(in in_city varchar(50),out total int)
begin
select count(customerNumber) into total from customers where city=in_city;
end \\
delimiter ;

call GetCustomersCountByCity('Lyon',@total);
select @total;