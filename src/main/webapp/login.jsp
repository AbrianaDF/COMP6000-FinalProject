<%--
  Created by IntelliJ IDEA.
  User: Abriana Fornis
  Date: 4/26/22
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Login</title>
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
                    <td><a href="home">Home</a></td>
                    <td><a href="about.jsp">About</a></td>
                    <td><a href="#" onclick="return false;">Login</a></td>
                </tr>
            </table>
        </div>
        <%
            if (request.getParameter("b") != null) {
                out.println("You must sign in first!");
            }
        %>
        <div>
            <form method="post" action="loginprocess.jsp">
                <table border="0" cellpadding="5" align="center" width = "500px">
                    <tr>
                        <td colspan="2"><h3>Login</h3></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username" required/></td>                  <!-- name: username -->
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password" required/></td>               <!-- name: password -->
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /> </td>
                        <td>
                            <%
                                if(request.getParameter("c")!= null) {
                                    //check the value for variable "c"
                                    out.println("Username or password is incorrect.!");
                                }
                            %>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
