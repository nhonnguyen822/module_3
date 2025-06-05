package com.example.bai_tap_1.service;

import com.example.bai_tap_1.entity.Manufacturer;
import com.example.bai_tap_1.repository.IManufactureRepository;
import com.example.bai_tap_1.repository.ManufactureRepository;

import java.util.List;

public class ManufactureService implements IManufactureService {
    private static final IManufactureRepository manufactureRepository = new ManufactureRepository();

    @Override
    public List<Manufacturer> findAll() {
        return manufactureRepository.findAll();
    }
}
