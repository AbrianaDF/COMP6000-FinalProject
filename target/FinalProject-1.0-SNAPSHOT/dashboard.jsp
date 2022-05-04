<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: bree2
  Date: 5/3/22
  Time: 7:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String) session.getAttribute("uname");
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/businessdirectory", "root", "BreeF#11")) {
        String query = "SELECT businesses.name, businesses.description, businesses.phone, businesses.website FROM businesses" +
                " INNER JOIN users " +
                " ON businesses.user_id = users.user_id" +
                " WHERE users.username = '"+user+"'";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
%>
<html>
<head>
    <title>Dashboard</title>
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
        a {
            text-decoration: none;
            color: #2b2d2f;
        }
        td {
            padding-right: 2%;
        }
        table#navigation-menu {
            background-color: aquamarine;
            width: 20%;
        }
    </style>
</head>
    <body>
        <div id="nav-container">
            <table id="navigation-menu" align="right">
                <tr>
                    <td><a href="index.jsp">Home</a></td>
                    <td><a href="about.jsp">About</a></td>
                    <td><a href="#" onclick="return false;">Dashboard</a></td>
                    <td><a href="logout.jsp">Logout</a></td>
                </tr>
            </table>
        </div>
        <div style="align-content: center">
            <%
                if (rs.next()) {
            %>
            <h1><%=rs.getString("name")%></h1>
            <p><%=rs.getString("description")%></p>
            <h3><%=rs.getString("phone")%></h3>
            <h4><%=rs.getString("website")%></h4>
            <%
                }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </body>
</html>
