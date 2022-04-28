<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,
javax.xml.parsers.DocumentBuilder, org.w3c.dom.*"
%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>
<%@ page import="org.xml.sax.SAXException" %>
<%@ page import="com.example.finalproject.Business" %>
<%
    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    try {
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document xmlDoc = builder.parse(application.getResourceAsStream("/WEB-INF/businesses.xml"));

        NodeList businessNames = xmlDoc.getElementsByTagName("name");
        NodeList businessOwners = xmlDoc.getElementsByTagName("owner");
        NodeList businessPhones = xmlDoc.getElementsByTagName("phone");
        NodeList businessDesc = xmlDoc.getElementsByTagName("description");
        NodeList businessSites = xmlDoc.getElementsByTagName("website");

        List<Business> businessList = new ArrayList<>();

        int i = 0;
        while (i < businessNames.getLength()) {

            String name = businessNames.item(i).getFirstChild().getNodeValue();
            String owner = businessOwners.item(i).getFirstChild().getNodeValue();
            String phone = businessPhones.item(i).getFirstChild().getNodeValue();
            String desc = businessDesc.item(i).getFirstChild().getNodeValue();
            String website = businessSites.item(i).getFirstChild().getNodeValue();

            businessList.add(new Business(name, owner, phone, desc, website));
            i++;
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <!--<link href="./WEB-INF/styles.css" rel="stylesheet" type="text/css">-->
    </head>
    <body>
        <div id="nav-container"> <!--style="background-color: #2b2d2f;color: beige;"-->
            <ul id="navigation-menu" style="list-style-type: none;">
                <li><a href="HomeServlet" style="text-decoration: none;list-style-type: none;display: inline">Home</a></li>
                <li><a href="AboutServlet" style="text-decoration: none;list-style-type: none;display: inline">About</a></li>
                <li>
                    <%
                        if (session.getAttribute("uname") != null) {
                    %>
                    <a href="logout.jsp" style="text-decoration: none;list-style-type: none;display: inline">Logout</a>
                    <%
                        } else {
                    %>
                    <a href="LoginServlet" style="text-decoration: none;list-style-type: none;display: inline">Login</a>
                    <%
                            }
                    %>
                </li>
            </ul>
        </div>

        <h1>Welcome!</h1>
        <% for (Business business : businessList) { %>
        <div>
            <h2><%=business.getName()%></h2>
            <p><%=business.getDescription()%></p>
            <br/>
            <div>
                <h3><%=business.getOwner()%></h3>
                <h4><%=business.getPhone()%></h4>
                <a href="<%=business.getWebsite()%>"><%=business.getWebsite()%></a>
                <br/>
            </div>
        </div>
        <%
                }
            } catch (ParserConfigurationException | SAXException e) {
                System.out.println("An error occurred: " + e.getLocalizedMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>