<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.youtubee.dao.postdao"%>
<%@page import="com.mycompany.youtubee.dao.likesdao"%>
<%@page import="com.mycompany.youtubee.entities.Post"%>
<%@page import="com.mycompany.youtubee.entities.user"%>
<%@page import="com.mycompany.youtubee.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    user u = (user) session.getAttribute("currentUser");
    if (u == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Load Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="CSS/beauty.css">

    </head>
    <body>

        <div class="row">
            <%
                likesdao ld = new likesdao(ConnectionProvider.getConnection());
                postdao pd = new postdao(ConnectionProvider.getConnection());
                int cid = Integer.parseInt(request.getParameter("c"));
                List<Post> list = null;
                if (cid == 0) {
                    list = pd.getAllPosts();
                } else {
                    list = pd.getPostByCategory(cid);
                }
                if (list.size() == 0) {
                    out.println("<h3 class='display-4 text-center p-5'>No posts available under this category!!</h3>");

                } else {
                    for (Post p : list) {

            %>
            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="card-header">
                        <img class="card-img" alt="image" src="images/<%= p.getPpic()%>">
                    </div>
                    <div class="card-body ">

                        <h5 class="card-title"><%= p.getPtitle()%></h5>
                        <p class="card-text"><%= p.getPdescription()%></p>

                    </div>
                    <div class="card-footer">
                        <%
                            int pp = p.getPid();
                            String emailid = u.getEmailid();
                        %>

                        <a href="read_more.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary">Read more</a>

                    </div>
                </div>

            </div>

            <%
                    }
                }
            %>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function getlikes(p, u)
            {
                console.log("in function");
                $.ajax({
                    url: "likeservlet",
                    data: {p: p, u: u},
                    success: function (data, textStatus, jqXHR)
                    {
                        console.log("pass");
                        if (data.trim() === "likedone")
                        {
                            console.log("passjk");
                            let like = $(".like-counter").html();
//                            like++;
                            $(".like-counter").html(like);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown)
                    {
                        console.log("fail");
                    }
                })
            }
        </script>
    </body>
</html>
