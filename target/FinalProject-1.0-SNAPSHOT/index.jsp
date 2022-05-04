<%--
  Created by IntelliJ IDEA.
  User: Abriana Fornis
  Date: 4/27/22
  Time: 5:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.finalproject.models.BusinessModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/businessdirectory", "root", "BreeF#11")) {
        List<BusinessModel> businessList = new ArrayList<>();
        Statement stmt = connection.createStatement();
        String sql1 = "SELECT businesses.name, businesses.description, businesses.is_pending, users.fname, users.lname, businesses.phone, businesses.website" +
                " FROM businesses" +
                " INNER JOIN users" +
                " ON businesses.user_id = users.user_id" +
                " WHERE businesses.is_pending = 0";
        ResultSet rs = stmt.executeQuery(sql1);
        while (rs.next()) {
            BusinessModel business = new BusinessModel();
            business.setName(rs.getString("name"));
            business.setDescription(rs.getString("description"));
            business.setOwner(rs.getString("fname") + " " + rs.getString("lname"));
            business.setPhone(rs.getString("phone"));
            business.setWebsite(rs.getString("website"));
            businessList.add(business);
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Business Directory</title>
        <style>
            body {
                padding-top: 5%;
            }
            div#nav-container {
                position: absolute;
                left: 0;
                right: 0;
                top: 0;
                background-color: aquamarine;
                color: #2b2d2f;
                width: 100%;
                height: 35px;
            }
            div.business-container {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                grid-auto-rows: auto;
                grid-gap: 5rem;
                padding: 3%;
            }
            div.business-card {
                border: 2px solid #e7e7e7;
                border-radius: 4px;
                padding: .5rem;
            }
            a {
                text-decoration: none;
                color: #2b2d2f;
            }
            td {
                padding-right: 2%;
            }
            table#navigation-menu {
                align: right;
                background-color: aquamarine;
                width: 20%;
            }
            p#business-desc {
                width: 80%;
            }
        </style>
    </head>
    <body>
        <div id="nav-container">
            <table id="navigation-menu" align="right">
                <tr>
                    <td><a class="nav-link" href="#" onclick="return false;">Home</a></td>
                    <td><a class="nav-link" href="about.jsp">About</a></td>
                    <td>
                        <%
                            if (session.getAttribute("uname") != null) {
                        %>
                        <a class="nav-link" href="dashboard">Dashboard</a>
                    </td>
                    <td>
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </td>
                        <%
                            } else {
                        %>
                    <td>
                        <a class="nav-link" href="login.jsp">Login</a>
                        <%
                                }
                        %>
                    </td>
                </tr>
            </table>
        </div>

        <h1>Business Directory</h1>
        <div class="business-container">
        <% for (BusinessModel business : businessList) { %>
            <div class="business-card">
                <h2><%=business.getName()%></h2>
                <p id="business-desc"><%=business.getDescription()%></p>
                <h3><%=business.getOwner()%></h3>
                <h4><%=business.getPhone()%></h4>
                <a href="#"><%=business.getWebsite()%></a>
            </div>
        <%
                }
            } catch (SQLException e) {
                System.out.println("An error occurred: " + e.getLocalizedMessage());
                e.printStackTrace();
            }
        %>
        </div>
    </body>
</html>