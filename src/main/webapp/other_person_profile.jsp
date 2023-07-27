<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.youtubee.entities.user"%>
<%
    user u = (user)session.getAttribute("currentUser");
    if(u==null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
