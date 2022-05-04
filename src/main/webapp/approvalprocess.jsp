<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: bree2
  Date: 5/3/22
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/businessdirectory", "root", "BreeF#11")) {
        Statement stmt = connection.createStatement();
        String query = "DELETE FROM businesses"
    }
%>
