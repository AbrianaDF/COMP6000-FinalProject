<%--
  Created by IntelliJ IDEA.
  User: bree2
  Date: 4/27/22
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Application</title>
    </head>
    <body>
        <div id="nav-container" style="background-color: #2b2d2f;padding: 0;margin: 0;">
            <ul id="navigation-menu" style="list-style-type: none;">
                <li><a href="HomeServlet" style="text-decoration: none;list-style-type: none;color: beige">Home</a></li>
                <li><a href="LoginServlet" style="text-decoration: none;list-style-type: none;">Login</a></li>
                <li><a href="AboutServlet" style="text-decoration: none;list-style-type: none;">About</a></li>
            </ul>
        </div>
        <form method="post" action="signup.jsp">
            <table border="0" cellpadding="5" align="center" width = "800px">
                <tr>
                    <td colspan="2"><h3>Directory Application</h3></td>
                </tr>
                <tr>
                    <td>Business Name</td>
                    <td><input type="text" name="business-name" required/></td>
                </tr>
                <tr>
                    <td>Business Owner</td>
                    <td><input type="text" name="business-owner" required/></td>
                </tr>
                <tr>
                    <td>Description of Business</td>
                    <td><input type="text" name="description"></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="tel" name="phone" required/></td>
                </tr>
                <tr>
                    <td>Website</td>
                    <td><input type="text" name="website" required/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" required/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" required/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" /> </td>
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
    </body>
</html>
