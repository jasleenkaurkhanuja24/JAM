
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.mycompany.youtubee.entities.user"%>
<%@page import="com.mycompany.youtubee.entities.Category"%>
<%@page import="com.mycompany.youtubee.dao.postdao"%>
<%@page import="com.mycompany.youtubee.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
    user u = (user)session.getAttribute("currentUser");
    if(u==null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Post</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/beauty.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sw="https:eetalert.min.js">-->
       
    </head>
    
    <body style="background-color: #eee;">
        <%@include file = "afterlogin_navbar.jsp"%>
        <main>
        <div class="container">
        <div class="row">
        <div class="col-md-8 offset-md-2">
        <div class="card">
        <div class="card-header text-center display-4 log">
            Add a new Post
        </div>
        <div class="card-body ">
            <form action="AddPostServlet" method="post" id="form_id">
                <div class="row">
                <div class="form-group mb-4 col-md-6">
                <label class="form-label" for="1">Title</label>
                <input type="text" id="1" class="form-control" name="title" placeholder="Enter Title">
                </div>
                <div class="form-group mb-4 col-md-6 ">
                <label class="form-label " for="2">Category</label><br>
                <div class="form-control">
                <select name="cid">
                    <option selected disabled>---Select Category---</option>
                    <%
                    postdao p = new postdao(ConnectionProvider.getConnection());
                    ArrayList<Category> a = p.getAllCategories();
                    for(Category category : a)
                    {                            
                    %>
                    <option value="<%= category.getCid()%>"><%= category.getCname()%> <%= category.getCid()%></option>
                    <%                            
                    }
                    %>
                </select>
                </div>
                </div>
                </div>
                <div class="form-group mb-4">
                <label class="form-label" for="3">Code</label>
                <textarea id="3" class="form-control" name="code" placeholder="Enter Code(if any)"></textarea>
                </div>
                <div class="form-group mb-4">
                <label class="form-label" for="4">Upload a file</label><br>
                <input type="file" id="4" name="file" class="">
                </div>
                <div class="form-group mb-4">
                <label class="form-label" for="5">Post Description</label>
                <textarea class="form-control" id="5" name="description" rows="4"></textarea>
                </div>
                <div class="form-group mb-4">
                <label class="form-label" for="6">Post Content</label>
                <textarea class="form-control" id="6" name="content" rows="4"></textarea>
                </div>

                <button type="submit" class="btn btn-primary btn-block mb-4">Post</button>
            </form>
        </div>
        </div>
        </div>
        </div>
        </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <!-- Script to submit the post without reloading the page -->
        
        <script>
            $(document).ready(function()
            {
                $("#form_id").on("submit",function(event)
                {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url:"AddPostServlet",
                        type:'POST',
                        data:form,
                        success: function(data,textStatus,jqXHR)
                        {
                            if(data.trim()==="Done")
                            {
                            console.log("pass");
                            swal({
                            title: "Post added successfully!!",
                            icon: "success",
                            button: "OK",
                            });
                        }
                        else
                        {
                            console.log("fail");
                            swal({
                            title: "Post was not added...",
                            text: "Something went wrong.",
                            icon: "error",
                            button: "OK",
                            });
                        }
                        },
                        error: function(jqXHR,textStatus,errorThrown)
                        {
                            console.log("fail");
                            swal({
                            title: "Post was not added...",
                            text: "Something went wrong.",
                            icon: "error",
                            button: "OK",
                            });
                        },
                        processData:false,
                        contentType:false
                    })
                })
            });
        </script>

    </body>
</html>
