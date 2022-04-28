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
        <div id="nav-container">
            <ul id="navigation-menu" style="list-style-type: none;">
                <li><a href="HomeServlet" style="text-decoration: none;list-style-type: none;">Home</a></li>
                <li><a href="LoginServlet" style="text-decoration: none;list-style-type: none;">Login</a></li>
                <li><a href="AboutServlet" style="text-decoration: none;list-style-type: none;">About</a></li>
            </ul>
        </div>
        <div>
            <form method="post" action="LoginServlet">
                <table border="0" cellpadding="5" align="center" width = "800px">
                    <tr>
                        <td colspan="2"><h3>Login</h3></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" required/></td>                  <!-- name: username -->
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
                                    //out.println("Username or password is incorrect.!");
                                }
                            %>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
