/*
    Created by IntelliJ IDEA.
    User: Abriana Fornis
    Date: 5/3/22
    Time: 7:18 PM
*/
package com.example.finalproject.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
