<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.youtubee.entities.user"%>
<%@page import="com.mycompany.youtubee.entities.Post"%>
<%@page import="com.mycompany.youtubee.entities.comments"%>
<%@page import="com.mycompany.youtubee.dao.postdao"%>
<%@page import="com.mycompany.youtubee.dao.likesdao"%>
<%@page import="com.mycompany.youtubee.dao.commentsdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.youtubee.dao.userdao"%>
<%@page import="com.mycompany.youtubee.helper.ConnectionProvider"%>

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
        <title>Read More</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/beauty.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
       
    </head>
    <body style="background-color: #eee;">
<!--        <h1>Hello World!</h1>-->
             <%@include  file="afterlogin_navbar.jsp"%>
        <%
            int id = Integer.parseInt(request.getParameter("post_id"));
        %>
        <main>
                <div class="container">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="card mt-5 p-3">
                        <div class="card-header text-center log ">
                            <%
                                postdao pd = new postdao(ConnectionProvider.getConnection());
                                Post p = pd.getPostData(id);
                                likesdao ld = new likesdao(ConnectionProvider.getConnection());
                                userdao ud = new userdao(ConnectionProvider.getConnection()); 
                                String name = ud.getusername(p.getPoster());
                            %>
                            <h5><%=p.getPtitle()%></h5>
                            
                        </div>
                            <div class="text-center"><img src = "images/<%= p.getPpic()%>" class="card-img-top my-2 text-center " style="height:350px ;width:400px;">
                            </div>
                            BY: <a href='other_person_profile.jsp?id=<%= "p.getPoster()"%>'><%= name%></a><br>
                            <div class="">
                                <a href="#" onclick='getlikes(<%= id%>,"<%= u.getEmailid()%>")' class=" btn btn-outline-primary like_and_comment"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countlikes(id)%></span></a>
                                <button class="btn btn-outline-primary"><i class="fa fa-commenting-o"></i><span></span></button>
                                
                                </div>
                                </div>
                                </div>
                                </div>
                        <div class="row">
                        <div class="col-md-5 offset-md-1">
                            <div class="card mt-5">
                            <p class="text-center text-muted"><b>Description: </b><%= p.getPdescription()%></p>
                        <hr>
                        <div class="card-body">
                            <p class="card-text"><b>Content: </b>
                                <div class="vertical-scrollable" style="">
                                <div class="scroll">
                                    
                                <%= p.getPcontent()%>
                                
                                </div>
                                </div>
                            </p><hr>
                            <b>Code</b><br>
                               <div class="vertical-scrollable" style="">
                                 <div class="scroll">
                                     
                                     <pre class=""><%= p.getPcode()%></pre>
                                
                                </div>
                                </div>
                            
                        </div>
                        
                        <div class="card-footer">
                          
                            BY: <a href='other_person_profile.jsp?id=<%= "p.getPoster()"%>'><%= name%></a>
                            <br>
                            <%= p.getPtime() %>
                        </div>
                    </div> 
                        </div>
                        <div class="col-md-5 mt-5"> 
                        <div class="vertical-scrollable" style="">
                            
                                <div class="card p-3 content" style="margin:1px;border-radius: 25px;">
                                    <div class="scroll">
                                    <%
                                        commentsdao cd = new commentsdao(ConnectionProvider.getConnection());
                                        List<comments> comment = new ArrayList<>();
                                        
                                        comment = cd.getcomments(id);
                                        if(comment.size()==0)
                                        {
                                        %>
                                        <h6 class="text-center">No Comments</h6>
                                        <%
                                            }
                                            else{
                                        for(comments c : comment)
                                        {
                                        user u1 = new user();
                                        String name1 = ud.getusername(c.getUseremailid());

                                        %>
                                        
                                         By: <a href="#"><%= name1%></a>
                                         
                                            <%= c.getCommentcontent()%>
                                            <br>
                                            <small><%= c.getTime()%></small>
                                            <hr>
                                    <%
                                        }
                                        }
                                        
                                    %>
                                    
                                    <div id="new_comment" class="container-fluid">
                                        
                                       
                                    </div>
                                    
                                    </div>
                                    </div>
                                    </div>
                                    <div class="">
                                    <h3 id="notification" style="display:none;">Your comment will be displayed once you refresh the page!!</h3>
                                    
                                    
                                    <b class="">Add a comment</b>
                                    <form action="commentservlet" method="post" id="post">
                                    <input type="textarea" name="comment" class="form-control" placeholder="--Comment--" style="margin:1px;border-radius: 25px;">
                                    <input type="hidden" value="<%= id%>" name="pd">
                                    <input type="hidden" value="<%= u.getEmailid()%>" name="ud">
                                    <button type="submit" class="btn btn-outline-primary m-1 float-right" >Post</button>
                                    </form>
                                    </div>
                                    </div>
                                    
                                        
                                    </div>
                            
                        
        </div>
        </main>                       
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function getlikes(p,u)
            {
                console.log("in function");
                $.ajax({
                    url:"likeservlet",
                    data:{p:p,
                          u:u},
                    success:function(data,textStatus,jqXHR)
                    {
                        
                        console.log("pass");
                        if(data.trim()==="likedone")
                        {
                            
                            console.log("passjk");
                            let like=$(".like-counter").html();
                            like++;
                            $(".like-counter").html(like);
                        }
                        else if(data.trim()==="likedeleted")
                        {
                            console.log("deletedlike");
                            let like=$(".like-counter").html();
                            like--;
                            $(".like-counter").html(like); 
                        }
                        else if(data.trim()==="something")
                        {
                            console.log("something went wrong");
                        }
                    },
                    error:function(jqXHR,textStatus,errorThrown)
                    {
                        console.log("fail");
                    }
                })
            }
            $(document).ready(function()
            {
                $("#post").on('submit',function(event)
                {
                    event.preventDefault();
                    let f = new FormData(this);
                    $.ajax({
                        url:"commentservlet",
                        data:f,
                        type:'POST',
                        success:function(data,textStatus,jqXHR)
                        {
                            console.log("success");
                            if(data.trim()==='error')
                            {
                                console.log("notsaved");
                            }
                            else
                            {
                                console.log("saved");
                                console.log(data);
                                $("#new_comment").show();
                                $("#new_comment").append(data);
                            }
                        },
                        error: function(jqXHR,textStatus,errorThrown)
                        {
                            console.log("error in error");
                        },
                        processData:false,
                      contentType:false    
                    })
                })
            });
        //}
            
        </script>
    </body>
</html>
