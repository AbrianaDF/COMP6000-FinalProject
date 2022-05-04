<%@ page import="com.example.finalproject.models.BusinessModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    try {
        List<BusinessModel> businessList = new ArrayList<>();
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/businessdirectory", "root", "BreeF#11");
        Statement stmt = connection.createStatement();
        String sql1 = "SELECT businesses.name, businesses.description, businesses.is_pending, users.fname, users.lname, businesses.phone, businesses.website" +
                " FROM businesses" +
                " INNER JOIN users" +
                " ON businesses.user_id = users.user_id" +
                " WHERE businesses.is_pending = 0";
        ResultSet rs = stmt.executeQuery(sql1);
        while (rs.next()) {
            BusinessModel business = new BusinessModel();
            business.setName(rs.getString("name"));
            business.setDescription(rs.getString("description"));
            business.setOwner(rs.getString("fname") + " " + rs.getString("lname"));
            business.setPhone(rs.getString("phone"));
            business.setWebsite(rs.getString("website"));
            businessList.add(business);
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link rel="stylesheet" href="WEB-INF/css/styles.css" type="text/css">
    </head>
    <body>
        <header id="nav-container" style="background-color: aquamarine">
            <table id="navigation-menu" align="right">
                <tr>
                    <td style="padding-right: 5px"><a class="nav-link" href="#" onclick="return false;">Home</a></td>
                    <td style="padding-right: 5px"><a class="nav-link" href="about.jsp">About</a></td>
                    <td style="padding-right: 5px">
                        <%
                            if (session.getAttribute("uname") != null) {
                        %>
                        <a class="nav-link" href="dashboard">Dashboard</a>
                    </td>
                    <td style="padding-right: 5px">
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </td>
                        <%
                            } else {
                        %>
                    <td style="padding-right: 5px">
                        <a class="nav-link" href="login.jsp">Login</a>
                        <%
                                }
                        %>
                    </td>
                </tr>
            </table>
        </header>

        <h1>Welcome!</h1>
        <% for (BusinessModel business : businessList) { %>
        <div>
            <h2><%=business.getName()%></h2>
            <p><%=business.getDescription()%></p>
            <br/>
            <div>
                <h3><%=business.getOwner()%></h3>
                <h4><%=business.getPhone()%></h4>
                <a href="#"><%=business.getWebsite()%></a>
                <br/>
            </div>
        </div>
        <%
                }
            } catch (SQLException e) {
                System.out.println("An error occurred: " + e.getLocalizedMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>