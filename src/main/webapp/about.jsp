<%--
  Created by IntelliJ IDEA.
  User: Abriana Fornis
  Date: 4/27/22
  Time: 5:48 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About Us</title>
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
                <td><a class="nav-link" href="index.jsp">Home</a></td>
                <td><a class="nav-link" href="#" onclick="return false;">About</a></td>
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
    <h1>A Little Bit About Us</h1>
    <div style="width: 70%">
        <p style="padding: 5%">This website was created to provide a place for people to find minority-owned businesses. We take pride in
            providing a space for minority-owned businesses to truly shine. Feel free to take a look around! If you
            would like to have your business included in the directory, don't hesitate to click <i>Apply</i> below!
        </p>
        <form name="appRequest" method="get" action="application.jsp">
            <input type="submit" value="Apply">
        </form>
    </div>
</body>
</html>
