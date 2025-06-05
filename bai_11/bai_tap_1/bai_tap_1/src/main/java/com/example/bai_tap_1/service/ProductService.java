package com.example.bai_tap_1.service;

import com.example.bai_tap_1.dto.ProductDtoResponse;
import com.example.bai_tap_1.entity.Products;
import com.example.bai_tap_1.repository.IProductRepository;
import com.example.bai_tap_1.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private static final IProductRepository productRepository = new ProductRepository();


    @Override
    public List<ProductDtoResponse> findAll() {
        return productRepository.findAll();
    }

    @Override
    public boolean save(Products product) {
        return productRepository.save(product);
    }

    @Override
    public boolean update(Products products) {
        return productRepository.update(products);
    }

    @Override
    public boolean remove(int id) {
        return productRepository.remove(id);
    }

    @Override
    public List<Products> findByName(String name) {
        return productRepository.findByName(name);
    }
}
