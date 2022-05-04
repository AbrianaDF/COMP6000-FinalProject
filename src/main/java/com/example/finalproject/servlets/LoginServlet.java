package com.example.finalproject.servlets;

import com.example.finalproject.models.UserModel;
import org.jboss.weld.context.http.Http;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        UserModel user = new UserModel();

        if (username != null && password != null) {
            user.setUsername(username);
            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/businessdirectory", "root", "BreeF#11");
                Statement stmt = conn.createStatement();
                String sql = "SELECT * FROM users WHERE username = " + username;
                ResultSet rs = stmt.executeQuery(sql);
                if (rs.next()) {
                    user.setAdmin(rs.getBoolean("is_admin"));
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }


    }
}
