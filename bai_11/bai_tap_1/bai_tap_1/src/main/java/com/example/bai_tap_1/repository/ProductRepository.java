package com.example.bai_tap_1.repository;

import com.example.bai_tap_1.entity.Products;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final List<Products> productsList = new ArrayList<>();

    static {
        productsList.add(new Products(1, "Laptop Dell XPS 13", 25000000, "Ultrabook cao cấp, màn hình 13 inch", "Dell"));
        productsList.add(new Products(2, "iPhone 15 Pro", 34000000, "Điện thoại thông minh, camera 48MP", "Apple"));
        productsList.add(new Products(3, "Máy giặt LG Inverter", 8900000, "Công nghệ giặt hơi nước, tiết kiệm điện", "LG"));
        productsList.add(new Products(4, "Smart TV Samsung 55", 15000000, "TV 4K, hỗ trợ Smart Hub", "Samsung"));
        productsList.add(new Products(5, "Máy lọc không khí Xiaomi", 3200000, "Lọc bụi mịn PM2.5, kết nối app", "Xiaomi"));
        productsList.add(new Products(6, "Bàn phím cơ Logitech G Pro", 2900000, "Bàn phím chơi game, đèn RGB", "Logitech"));
    }

    @Override
    public List<Products> findAll() {
        return productsList;
    }

    @Override
    public void save(Products product) {
        productsList.add(product);
    }

    @Override
    public void update(Products product) {
        List<Products> productsList = findAll();
        for (Products products : productsList) {
            if (product.getId() == products.getId()) {
                products.setName(product.getName());
                products.setPrice(product.getPrice());
                products.setProductDescription(product.getProductDescription());
                products.setManufacturer(product.getManufacturer());
            }
        }
    }

    @Override
    public void remove(int id) {
        List<Products> productsList = findAll();
        for (int i = 0; i < productsList.size(); i++) {
            if (productsList.get(i).getId() == id) {
                productsList.remove(productsList.get(i));
            }
        }
    }

    @Override
    public List<Products> findByName(String name) {
        List<Products> productsListFindByName = new ArrayList<>();
        List<Products> productsList = findAll();
        for (int i = 0; i < productsList.size(); i++) {
            if (productsList.get(i).getName().toLowerCase().contains(name)) {
                productsListFindByName.add(productsList.get(i));
            }
        }
        return productsListFindByName;
    }
}
