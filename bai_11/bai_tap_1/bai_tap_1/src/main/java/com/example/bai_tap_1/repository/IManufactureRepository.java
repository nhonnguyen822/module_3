package com.example.bai_tap_1.repository;

import com.example.bai_tap_1.entity.Manufacturer;

import java.util.List;

public interface IManufactureRepository {
    List<Manufacturer> findAll();

}
