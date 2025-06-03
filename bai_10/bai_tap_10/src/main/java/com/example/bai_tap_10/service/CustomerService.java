package com.example.bai_tap_10.service;

import com.example.bai_tap_10.entity.Customer;
import com.example.bai_tap_10.repository.CustomerRepository;
import com.example.bai_tap_10.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private static final ICustomerRepository customerRepository=new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }
}
