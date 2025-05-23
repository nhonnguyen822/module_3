USE classicmodels;
explain select * from customers;
 alter table customers add index i_customerName(customerName);
 explain select * from customers where customerName ='Land of Toys Inc.';
create index i_full_name on customers(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
 drop index i_full_name on customers 