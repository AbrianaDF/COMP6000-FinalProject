<%--
  Created by IntelliJ IDEA.
  User: Abriana Fornis
  Date: 5/3/22
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Business Application</title>
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
            <td><a href="home">Home</a></td>
            <td><a href="login">Login</a></td>
            <td><a href="#" onclick="return false;">About</a></td>
        </table>
    </div>
    <%
        if (request.getParameter("a") != null) {
            out.println("Oh no! Looks like that username is taken ...");
        }
    %>
    <form method="post" name="application" action="signup.jsp">
        <table>
            <tr>
                <td>First Name:</td>
                <td><input type="text" name="firstname" required></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input type="text" name="lastname" required></td>
            </tr>
            <tr>
                <td>Business Name:</td>
                <td><input type="text" name="business-name" required></td>
            </tr>
            <tr>
                <td>Business Description:</td>
                <td><input type="text" name="description" required></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><input type="tel" name="phone" required></td>
            </tr>
            <tr>
                <td>Website:</td>
                <td><input type="text" name="website" required></td>
            </tr>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Submit"></td>
            </tr>
        </table>
    </form>
</body>
</html>
