<%--
  Created by IntelliJ IDEA.
  User: bree2
  Date: 5/3/22
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Business Application</title>
</head>
<body>
    <header id="nav-container">
        <table id="navigation-menu" style="list-style-type: none;">
            <td><a href="home" style="text-decoration: none;list-style-type: none;">Home</a></td>
            <td><a href="login" style="text-decoration: none;list-style-type: none;">Login</a></td>
            <td><a href="#" onclick="return false;" style="text-decoration: none;list-style-type: none;">About</a></td>
        </table>
    </header>
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
