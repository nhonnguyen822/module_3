package com.example.bai_tap_2;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String message = "";
        double result = 0;
        double a = Double.parseDouble(req.getParameter("start"));
        double b = Double.parseDouble(req.getParameter("end"));
        String operator = req.getParameter("operator");
        switch (operator) {
            case "add":
                result = a + b;
                break;
            case "minus":
                result = a - b;
                break;
            case "mul":
                result = a * b;
                break;
            case "div":
                if (b == 0) {
                    message = "Không thể chia cho 0";
                } else {
                    result = a / b;
                }
                break;
            default:
                message = "Toán tử không hợp lệ!";
        }

        req.setAttribute("result", result);
        req.setAttribute("message", message);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}