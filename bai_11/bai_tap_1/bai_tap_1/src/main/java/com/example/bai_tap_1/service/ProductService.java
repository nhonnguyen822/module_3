package com.example.bai_tap_1.service;

import com.example.bai_tap_1.entity.Products;
import com.example.bai_tap_1.repository.IProductRepository;
import com.example.bai_tap_1.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private static final IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Products> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Products product) {
        productRepository.save(product);
    }

    @Override
    public void update(Products product) {
        productRepository.update(product);
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }

    @Override
    public List<Products> findByName(String name) {
        return productRepository.findByName(name);
    }
}
