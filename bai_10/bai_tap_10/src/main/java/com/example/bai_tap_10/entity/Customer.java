package com.example.bai_tap_10.entity;

import jdk.vm.ci.meta.Local;

import java.time.LocalDate;

public class Customer {
    private int id;
    private String name;
    private LocalDate birthDay;
    private String address;
    private String avatar;

    public Customer() {
    }

    public Customer( String name, LocalDate birthDay, String address, String avatar) {
        this.name = name;
        this.birthDay = birthDay;
        this.address = address;
        this.avatar = avatar;
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

    public LocalDate getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(LocalDate birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

}
