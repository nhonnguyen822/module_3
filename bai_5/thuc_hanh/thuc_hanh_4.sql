USE classicmodels;
create view view_name as
select * from customers 
where city='Nantes';

select * from view_name;
drop view view_name
