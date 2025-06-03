package com.example.bai_tap_10.repository;

import com.example.bai_tap_10.entity.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
}
