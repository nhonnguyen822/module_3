package com.example.bai_tap_1.repository;

import com.example.bai_tap_1.dto.ProductDtoResponse;
import com.example.bai_tap_1.entity.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT_ALL = "select p.id,p.name,p.price,p.productDescription ,m.name as hangSX " +
            "from products p \n" +
            "left join manufacturer m on p.manufacturer_id=m.id";
    private static final String INSERT_INTO = "insert into products(name,price,productDescription,manufacturer_id)value(?,?,?,?);";
    private final String DELETE_BY_ID = "delete from products where id=?;";
    private final String UPDATE_BY_ID = "update products set name=?,price=?," +
            "                                                productDescription=?,manufacturer_id=? where id=?;";


    private final String SEARCH_BY_NAME_AND_PRICE = "call find_by_name_and_id(?,?)";


    @Override
    public List<ProductDtoResponse> findAll() {
        List<ProductDtoResponse> productsList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                String productDescription = resultSet.getString("productDescription");
                String manufacturer_name = resultSet.getString("hangSX");
                ProductDtoResponse product = new ProductDtoResponse(id, name, price, productDescription, manufacturer_name);
                productsList.add(product);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productsList;
    }

    @Override
    public boolean save(Products product) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setString(3, product.getProductDescription());
            preparedStatement.setInt(4, product.getManufacturer_id());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("loi ket noi db");
        }
        return false;
    }

    @Override
    public boolean update(Products product) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setString(3, product.getProductDescription());
            preparedStatement.setInt(4, product.getManufacturer_id());
            preparedStatement.setInt(5, product.getId());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("loi ket noi db");
        }
        return false;
    }

    @Override
    public boolean remove(int id) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID)) {
            preparedStatement.setInt(1, id);
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("loi ket noi db");
        }
        return false;
    }

    @Override
    public List<ProductDtoResponse> findByNameAndPrice(int manufacturerId, String productName) {
        List<ProductDtoResponse> productsListSearch = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(SEARCH_BY_NAME_AND_PRICE);
        ) {
            callableStatement.setInt(2, manufacturerId);
            callableStatement.setString(1, "%" + productName + "%");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String productNameByNameAndId = resultSet.getString("name");
                int productPrice = resultSet.getInt("price");
                String productDescription = resultSet.getString("productDescription");
                String manufacturer_name = resultSet.getString("hang_sx");
                ProductDtoResponse product = new ProductDtoResponse(id, productNameByNameAndId, productPrice, productDescription, manufacturer_name);
                productsListSearch.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productsListSearch;
    }

}
