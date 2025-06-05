package com.example.bai_tap_1.repository;

import com.example.bai_tap_1.entity.Manufacturer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManufactureRepository implements IManufactureRepository {
    private final String SELECT_ALL = "select * from manufacturer";

    @Override
    public List<Manufacturer> findAll() {
        List<Manufacturer> manufacturerList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Manufacturer manufacturer = new Manufacturer(id, name);
                manufacturerList.add(manufacturer);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return manufacturerList;
    }
}
