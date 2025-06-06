package com.example.bai_tap_1.controller;

import com.example.bai_tap_1.dto.ProductDtoResponse;
import com.example.bai_tap_1.entity.Manufacturer;
import com.example.bai_tap_1.entity.Products;
import com.example.bai_tap_1.service.IManufactureService;
import com.example.bai_tap_1.service.IProductService;
import com.example.bai_tap_1.service.ManufactureService;
import com.example.bai_tap_1.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "productController", urlPatterns = "/products")
public class ProductController extends HttpServlet {
    private static final IProductService productService = new ProductService();
    private static final IManufactureService manufactureService = new ManufactureService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(req, resp);
                break;
            case "update":
                break;
            case "delete":
                break;
            default:
                showList(req, resp);
                break;
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDtoResponse> productsList = productService.findAll();
        List<Manufacturer> manufacturerList = manufactureService.findAll();
        req.setAttribute("manufacturerList", manufacturerList);
        req.setAttribute("productsList", productsList);
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }

    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Manufacturer> manufacturerList = manufactureService.findAll();
        req.setAttribute("manufacturerList", manufacturerList);
        req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        if (action.equals("findIdCanUpdate")) {
            findIdCanUpdate(req, resp);
        }
        switch (action) {
            case "create":
                save(req, resp);
                break;
            case "update":
                updateProduct(req, resp);
                break;
            case "delete":
                deleteProductId(req, resp);
                break;
            case "search":
                String searchName = req.getParameter("search");
                int manufacturer_id = Integer.parseInt(req.getParameter("manufacturer_id"));
                List<ProductDtoResponse> productsList = productService.findByNameAndPrice(manufacturer_id, searchName);
                List<Manufacturer> manufacturerList = manufactureService.findAll();
                req.setAttribute("manufacturerList", manufacturerList);
                req.setAttribute("productsList", productsList);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            default:
                showList(req, resp);
                break;
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("productId"));
        String name = req.getParameter("productName");
        int price = Integer.parseInt(req.getParameter("productPrice"));
        String productDescription = req.getParameter("productDescription");
        int manufacturer_id = Integer.parseInt(req.getParameter("manufacturer_id"));
        Products products = new Products(id, name, price, productDescription, manufacturer_id);
        boolean updateSuccess = productService.update(products);
        String mess = "update success";
        if (!updateSuccess) {
            mess = "not update success";
        }
        resp.sendRedirect("/products?message" + mess);
    }

    private void findIdCanUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int updateProductId = Integer.parseInt(req.getParameter("updateProductId"));
        ProductDtoResponse productDtoResponse = productService.findProductById(updateProductId);
        List<Manufacturer> manufacturerList = manufactureService.findAll();
        req.setAttribute("manufacturerList", manufacturerList);
        req.setAttribute("productDtoResponse", productDtoResponse);
        req.getRequestDispatcher("/view/update.jsp").forward(req, resp);
    }

    private void deleteProductId(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("deleteProductId"));
        boolean isDeleteSuccess = productService.remove(id);
        String mess = "delete success";
        if (!isDeleteSuccess) {
            mess = "not delete success";
        }
        resp.sendRedirect("/products?message" + mess);
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("productName");
        int price = Integer.parseInt(req.getParameter("productPrice"));
        String productDescription = req.getParameter("productDescription");
        int manufacturer_id = Integer.parseInt(req.getParameter("manufacturerId"));
        Products products = new Products(name, price, productDescription, manufacturer_id);
        boolean isSaveSuccess = productService.save(products);
        String mess = "create success";
        if (!isSaveSuccess) {
            mess = "not create success";
        }
        resp.sendRedirect("/products?message" + mess);
    }
}

