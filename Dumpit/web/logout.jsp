<%-- 
    Document   : logout
    Created on : Sep 7, 2019, 11:05:16 PM
    Author     : Sandip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
    <% 
    session.removeAttribute("user");
session.removeAttribute("admin");
session.removeAttribute("vendor");
response.sendRedirect("Home.jsp");
      %>
      
    </body>
</html>
