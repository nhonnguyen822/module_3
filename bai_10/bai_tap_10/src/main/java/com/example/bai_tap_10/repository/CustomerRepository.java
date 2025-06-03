package com.example.bai_tap_10.repository;

import com.example.bai_tap_10.entity.Customer;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements  ICustomerRepository {
    private static final List<Customer> customers = new ArrayList<>();

    static {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        customers.add(new Customer("Mai Văn Hoàn", LocalDate.parse("1983-08-20"), "Hà Nội", "img/hoan.jpg"));
        customers.add(new Customer("Nguyễn Văn Nam", LocalDate.parse("1983-08-20"), "Bắc Giang", "img/nam.jpg"));
        customers.add(new Customer("Nguyễn Thái Hòa", LocalDate.parse("1983-08-20"), "Nam Định", "img/hoa.jpg"));
        customers.add(new Customer("Trần Đăng Khoa", LocalDate.parse("1983-08-20"), "Hà Tây", "img/khoa.jpg"));
        customers.add(new Customer("Nguyễn Đình Thi", LocalDate.parse("1983-08-20"), "Hà Nội", "img/thi.jpg"));
    }

    @Override
    public List<Customer> findAll() {
        return customers;
    }
}
