<%--
  Created by IntelliJ IDEA.
  User: bree2
  Date: 4/27/22
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //invalidate session
    if(session.getAttribute("uname") != null) {
        //if session was created
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
    else
    {
        // passing variable "b" with URL
        // lets say "b" is for "user must login"
        response.sendRedirect("login.jsp?b");
    }
%>