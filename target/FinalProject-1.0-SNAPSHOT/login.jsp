<%--
  Created by IntelliJ IDEA.
  User: bree2
  Date: 4/26/22
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <header id="nav-container">
            <table id="navigation-menu" style="list-style-type: none;">
                <tr>
                    <td><a href="home" style="text-decoration: none;list-style-type: none;">Home</a></td>
                    <td><a href="#" onclick="return false;" style="text-decoration: none;list-style-type: none;">Login</a></td>
                    <td><a href="about.jsp" style="text-decoration: none;list-style-type: none;">About</a></td>
                </tr>
            </table>
        </header>
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
