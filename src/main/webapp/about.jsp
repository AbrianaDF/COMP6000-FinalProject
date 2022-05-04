<%--
  Created by IntelliJ IDEA.
  User: bree2
  Date: 4/27/22
  Time: 5:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About Us</title>
</head>
<body>
    <header id="nav-container">
        <table id="navigation-menu" style="list-style-type: none;">
            <td><a href="home" style="text-decoration: none;list-style-type: none;">Home</a></td>
            <td><a href="login" style="text-decoration: none;list-style-type: none;">Login</a></td>
            <td><a href="#" onclick="return false;" style="text-decoration: none;list-style-type: none;">About</a></td>
        </table>
    </header>
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
