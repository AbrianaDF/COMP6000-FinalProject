<%--
  Created by IntelliJ IDEA.
  User: Abriana Fornis
  Date: 4/27/22
  Time: 8:27 PM
--%>
<%
    java.sql.Connection conn;                 // Connection: A connection with a specific database.
    java.sql.ResultSet rs;                   // ResultSet: A table of data representing a database result set, which is usually generated by executing a statement that queries the database.
    java.sql.Statement st;                   // Statement: The object used for executing a static SQL statement and returning the results it produces.

    conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/businessdirectory", "root", "BreeF#11");
    st = conn.createStatement();

    //get parameter value by using the 'name' of the field
    String uname = request.getParameter("username");
    String password = request.getParameter("password");

    String qr = "SELECT username FROM users WHERE username = '"+uname+"' and password = '"+password+"'";    //query to select if the username already exists or not
    rs = st.executeQuery(qr);
    if(rs.next())
    {
        // if username and password is correct
        session.setAttribute("uname", uname);
        response.sendRedirect("index.jsp");
    }
    else
    {
        // if username or password is incorrect
        // passing variable "c" with URL
        // lets say "c" is for "username/password is incorrect"
        response.sendRedirect("login.jsp?c");
    }
%>