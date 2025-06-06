package com.example.bai_tap_1.entity;

public class Products {
    private int id;
    private String name;
    private int price;
    private String productDescription;
    private int manufacturer_id;

    public Products() {
    }
    public Products( String name, int price, String productDescription, int manufacturer_id) {
        this.name = name;
        this.price = price;
        this.productDescription = productDescription;
        this.manufacturer_id = manufacturer_id;
    }

    public Products(int id, String name, int price, String productDescription, int manufacturer_id) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.productDescription = productDescription;
        this.manufacturer_id = manufacturer_id;
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

    public int getManufacturer_id() {
        return manufacturer_id;
    }

    public void setManufacturer_id(int manufacturer_id) {
        this.manufacturer_id = manufacturer_id;
    }
}
