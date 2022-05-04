<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: bree2
  Date: 5/3/22
  Time: 7:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/businessdirectory", "root", "BreeF#11");
    Statement stmt = connection.createStatement();
    String sql = "SELECT businesses.name, users.fname, users.lname FROM businesses " +
            "INNER JOIN users " +
            "ON businesses.user_id = users.user_id " +
            "WHERE businesses.is_pending = 1";
    ResultSet rs = stmt.executeQuery(sql);
%>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="WEB-INF/css/styles.css" type="text/css">
</head>
    <body>
        <header id="nav-container">
            <table id="navigation-menu">
                <tr>
                    <td><a href="index.jsp">Home</a></td>
                    <td><a href="about.jsp">About</a></td>
                    <td><a href="#" onclick="return false;">Dashboard</a></td>
                    <td><a href="logout.jsp">Logout</a></td>
                </tr>
            </table>
        </header>
        <div id="content-wrapper">
            <label id="admin-dash-approvals-label" for="pending-approvals">Pending Approvals</label>
            <table id="pending-approvals" name="pending-approvals">
                <thead>
                    <tr>
                        <td>Business</td>
                        <td>Owner</td>
                        <td>Approval</td>
                    </tr>
                </thead>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("fname") + " " + rs.getString("lname")%></td>
                    <td><a id="approve-link" href="approvalprocess.jsp">Approve</a>/<a id="deny-link" href="denialprocess.jsp">Deny</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
