<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.youtubee.dao.postdao"%>
<%@page import="com.mycompany.youtubee.helper.ConnectionProvider"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Like and Comment</title>
    </head>
    <body>
        <%
            int pid = Integer.parseInt(request.getParameter("l"));
        %>

        <%
            String cate = request.getParameter("cate");
            postdao pd = new postdao(ConnectionProvider.getConnection()); 
            int likes=0,comments=0;
            if(cate.equals("like"))
            {
            
                likes = pd.getLikes(pid);
                out.println(likes);
            }
            else
            {
                comments = pd.getComments(pid);
                out.println(comments);
            }
           response.sendRedirect("first_profile_page.jsp");
            
        %>
        
    </body>
</html>
