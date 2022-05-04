package com.example.finalproject;

import com.example.finalproject.models.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageToGoTo = "dashboard.jsp";
        String currentUser = (String) request.getSession().getAttribute("uname");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/businessdirectory", "root", "BreeF#11")) {
            Statement stmt = connection.createStatement();
            String query = "SELECT is_admin FROM users WHERE username = '" + currentUser + "'";
            ResultSet set = stmt.executeQuery(query);
            if (set.next() && set.getInt("is_admin") == 1) {
                pageToGoTo = "admindash.jsp";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher(pageToGoTo).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
