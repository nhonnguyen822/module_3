package com.example.bai_tap_1.dto;

public class ProductDtoResponse {
    private int id;
    private String name;
    private int price;
    private String productDescription;
    private String hangSX;

    public ProductDtoResponse(int id, String name, int price, String productDescription, String hangSX) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.productDescription = productDescription;
        this.hangSX = hangSX;
    }

    public ProductDtoResponse(String name, int price, String productDescription, String hangSX) {
        this.name = name;
        this.price = price;
        this.productDescription = productDescription;
        this.hangSX = hangSX;
    }

    public ProductDtoResponse() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getHangSX() {
        return hangSX;
    }

    public void setHangSX(String hangSX) {
        this.hangSX = hangSX;
    }
}
