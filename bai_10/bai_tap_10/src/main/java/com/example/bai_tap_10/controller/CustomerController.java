package com.example.bai_tap_10.controller;

import com.example.bai_tap_10.HelloServlet;
import com.example.bai_tap_10.entity.Customer;
import com.example.bai_tap_10.service.CustomerService;
import com.example.bai_tap_10.service.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URL;
import java.util.List;

@WebServlet(urlPatterns = "/customer")
public class CustomerController extends HttpServlet {
    private static final ICustomerService customerService=new CustomerService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customerList=customerService.findAll();
        req.setAttribute("customerList",customerList);
        req.getRequestDispatcher("/WEB-INF/customer.jsp").forward(req,resp);
    }
}
