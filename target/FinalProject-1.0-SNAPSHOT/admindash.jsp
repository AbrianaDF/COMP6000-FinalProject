<%--
  Created by IntelliJ IDEA.
  User: Abriana Fornis
  Date: 5/3/22
  Time: 7:18 PM
--%>
<%@ page import="java.sql.*" %>
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
        table#pending-approvals {
            width: 700px;
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
        <div id="content-wrapper">
            <form name="admin-approval-form" method="post" action="application">
                <h1>Pending Approvals</h1>
                <table id="pending-approvals" name="pending-approvals" cellspacing="20px">
                    <thead>
                        <tr>
                            <td><h3>Business</h3></td>
                            <td><h3>Owner</h3></td>
                            <td><h3>Approval</h3></td>
                        </tr>
                    </thead>
                    <%
                        while (rs.next()) {
                            String businessName = rs.getString("name");
                            String ownerFName = rs.getString("fname");
                            String ownerLName = rs.getString("lname");
                    %>
                    <tr>
                        <td><%=businessName%></td>
                        <td><%=ownerFName + " " + ownerLName%></td>
                        <td>
                            <input name="approve-button" type="submit" value="Approve">
                            <input name="deny-button" type="submit" value="Deny">

                            <input name="pending-business" type="hidden" value="<%=businessName%>">
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </form>
        </div>
    </body>
</html>
