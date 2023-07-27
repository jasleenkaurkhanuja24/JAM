<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.youtubee.dao.commentsdao"%>
<%@page import="com.mycompany.youtubee.dao.userdao"%>
<%@page import="com.mycompany.youtubee.entities.comments"%>
<%@page import="com.mycompany.youtubee.entities.user"%>
<%@page import="com.mycompany.youtubee.helper.ConnectionProvider"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/beauty.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
    </head>
    <body>
        <%
              String comment = request.getParameter("comment");
              String uid = request.getParameter("ud");
              String p = request.getParameter("pd");
              System.out.println("p " +p);
              System.out.println("uid = "+uid);
              System.out.println("comment "+comment);
              int pid = Integer.parseInt(p);
              commentsdao cd = new commentsdao(ConnectionProvider.getConnection());
             
              comments c = new comments(comment,pid,uid);
              userdao ud = new userdao(ConnectionProvider.getConnection()); 
              user u1 = new user();
              String name1 = ud.getusername(c.getUseremailid());
              boolean status = cd.insertnewcomment(comment, pid, uid);
              if(status==true)
              {
        %>
            <div>
                
             By: <a href="#"><%= name1%></a>                                 
             <%= c.getCommentcontent()%>
             <br>
             <small><%= c.getTime()%></small>
             <hr>
             </div>
        <%
              }
              else
              {
                  out.println("error");
              }
//              response.sendRedirect("read_more.jsp");
        %>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
    </body>
</html>
