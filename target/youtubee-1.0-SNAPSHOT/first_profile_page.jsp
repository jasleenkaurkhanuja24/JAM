<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.mycompany.youtubee.entities.user"%>
<%@page import="com.mycompany.youtubee.dao.postdao"%>
<%@page import="com.mycompany.youtubee.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.youtubee.entities.Category"%>
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
        <title>Home</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/beauty.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
    </head>
    <body>
        <%@include file="afterlogin_navbar.jsp"%>
        <main>
        <section style="background-color: #eee;">
        
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="list-group m-4 ">
                            <a href="#" onclick="getPosts(0,this)" class="list-group-item list-group-item-action list-group-item-dark c-link active" aria-current="true">
                            All Posts
                            </a>
                            <%
                                postdao p =  new postdao(ConnectionProvider.getConnection());
                                ArrayList<Category> c = p.getAllCategories();
                                for(Category ca:c)
                                {
                            %>
                            <a href="#" onclick="getPosts(<%= ca.getCid()%>,this)" class="list-group-item list-group-item-action c-link list-group-item-dark"><%= ca.getCname()%></a>
                                <%
                                }
                                %>                        
                         </div>
                    </div>
                    <div class="col-md-8" >
                        <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h3>Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">
                            
                        </div>
                    </div>
                </div>
            </div>
        
        </section>
                         </main>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function getPosts(cid,ob)
            {
                console.log(cid);
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass('active');
                    $.ajax({
                    url:"loadpost.jsp",
                    data:{c : cid},
                    success:function(data,textStatus,jqXHR)
                    {
                        console.log(cid);
                        console.log("pass");
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(ob).addClass('active');
                    },
                    error:function(jqXHR,textStatus,errorThrown)
                    {
                        console.log(cid);
                        console.log("fail");
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                    },
                })
            }
            $(document).ready(function(e)
            {
//                $("#post-container").html(data);
                  let allPostRef = $(".c-link")[0]
                  getPosts(0,allPostRef)
            })
        </script>
    </body>
</html>
