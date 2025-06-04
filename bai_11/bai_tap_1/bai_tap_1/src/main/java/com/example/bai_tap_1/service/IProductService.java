package com.example.bai_tap_1.service;

import com.example.bai_tap_1.entity.Products;

import java.util.ArrayList;
import java.util.List;

public interface IProductService {
    List<Products> findAll();

    void save(Products product);

    void update(Products product);

    void remove(int id);

    List<Products> findByName(String name);

    default int findMaxId() {
        List<Products> productsList = findAll();
        if (productsList.isEmpty()) {
            return 0;
        }
        int max = 0;
        for (Products products : productsList) {
            if (max < products.getId()) {
                max = products.getId();
            }
        }
        return max;
    }

    default Products findById(int id) {
        List<Products> productsList = findAll();
        for (Products product : productsList) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

}
