package com.example.bai_tap_1.service;

import com.example.bai_tap_1.dto.ProductDtoResponse;
import com.example.bai_tap_1.entity.Products;


import java.sql.ResultSet;
import java.util.List;

public interface IProductService {
    List<ProductDtoResponse> findAll();

    boolean save(Products product);

    boolean update(Products products);

    boolean remove(int id);

    List<ProductDtoResponse> findByNameAndPrice(int price, String name);

    default ProductDtoResponse findProductById(int id) {
        List<ProductDtoResponse> productDtoResponses = findAll();
        for (ProductDtoResponse productDtoResponse : productDtoResponses) {
            if (productDtoResponse.getId() == id) {
                return productDtoResponse;
            }
        }
        return null;
    }
}
