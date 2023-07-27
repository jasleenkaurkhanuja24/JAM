<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.mycompany.youtubee.entities.user"%>
<%@page import="com.mycompany.youtubee.helper.deletefile"%>
<%@page import="java.io.File"%>
<%@page import="com.mycompany.youtubee.helper.Message"%>
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
        <title>User Profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/beauty.css">
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
    </head>
    <body>
        <main>
        <%@include file="afterlogin_navbar.jsp"%>
        <%
            Message m = (Message)session.getAttribute("msg");
            if(m!=null)
            {
        %>
        <div class="alert <%= m.getCssclass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
            session.removeAttribute("msg");
            }
        %>
      <section style="background-color: #eee;">
          
  <div class="container py-5" >
    <div class="row" id="profile-final">
      <div class="col-lg-4">
        <div class="card">
          <div class="card-body text-center">
              <img src="images/<%= u.getProfile()%>" alt="avatarj" class="rounded-circle img-fluid" style="width: 150px;">
              
            <h5 class="my-3"><%= u.getFirstname()%>
            <%= u.getLastname()%></h5>
            <p class="text-muted mb-1"><%= u.getRole()%></p>
           <a href="deletingservlet" class=" btn btn-outline-primary m-1" id="remove-profile-picture">Remove profile picture</a>
          </div>
          </div> 
           </div>
            
      <div class="col-lg-8">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">
                   <%= u.getFirstname()%>
                   <%= u.getLastname()%></p>
              </div>
            </div>
              
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%= u.getEmailid()%></p>
              </div>
            </div>
            
              <hr>
            
              <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Mobile</p>
              </div>
              <div class="col-sm-9">
                  <p class="text-muted mb-0"><%= u.getMobile()%></p>
              </div>
            </div>
              
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%= u.getAddress()%></p>
              </div>
            </div>
              <a href="profile_editing.jsp" class="btn btn-outline-primary float-right" id="edit-profile-button" style="padding: 5px;margin: 5px;">Edit</a>
   
            </div>
          </div>
        </div>
      
       
          <div class="col-lg-12 ">
            <div class="card">
              <div class="card-body">
                <p class="mb-4"><span class="text-primary font-italic me-1">Articles Contributed</span></p>
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
        
    </body>
</html>
