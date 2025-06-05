package com.example.bai_tap_1.repository;

import com.example.bai_tap_1.dto.ProductDtoResponse;
import com.example.bai_tap_1.entity.Products;

import java.util.List;

public interface IProductRepository {
    List<ProductDtoResponse> findAll();

    boolean save(Products product);

    boolean update(Products products);

    boolean remove(int id);

    List<ProductDtoResponse> findByNameAndPrice(int price, String name);
}
