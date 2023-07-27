<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.youtubee.helper.ConnectionProvider"%>
<%@page import="com.mycompany.youtubee.dao.likesdao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int postid = Integer.parseInt(request.getParameter("p"));
            String email = request.getParameter("u");
            likesdao ld = new likesdao(ConnectionProvider.getConnection());
            ld.insertnewlike(postid,email);
            response.sendRedirect("first_login_page.jsp");
        %>
        
    </body>
</html>
