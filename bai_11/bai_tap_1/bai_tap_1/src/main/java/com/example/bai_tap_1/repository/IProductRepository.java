package com.example.bai_tap_1.repository;

import com.example.bai_tap_1.entity.Products;

import java.util.List;

public interface IProductRepository {
    List<Products> findAll();

    void save(Products product);

    void update(Products product);

    void remove(int id);

    List<Products> findByName(String name);
}
