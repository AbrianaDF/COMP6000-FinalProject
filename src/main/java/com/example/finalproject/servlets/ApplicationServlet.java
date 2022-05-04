package com.example.finalproject.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "ApplicationServlet", value = "/application")
public class ApplicationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String business = request.getParameter("pending-business");
        System.out.println("Business approved/denied: " + business);

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/businessdirectory", "root", "BreeF#11")) {
            String sql = " ";
            if (request.getParameter("approve-button") != null) {
                sql = "UPDATE businesses SET is_pending = 0 WHERE name = '"+business+"'";
            } else if (request.getParameter("deny-button") != null) {
                sql = "DELETE FROM businesses WHERE name = '"+business+"'";
            }
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("dashboard");
    }
}
