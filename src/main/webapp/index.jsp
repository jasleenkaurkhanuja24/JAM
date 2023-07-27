<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mycompany.youtubee.entities.user"%>
<%@page import="com.mycompany.youtubee.helper.ConnectionProvider"%>
<%
            user u = (user)session.getAttribute("currentUser");
            
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/beauty.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <!--        <script>
            $(document).ready(function(){
                alert("document loaded")
            })
        </script>-->
       <style>
           .banner-background{
               clip-path: polygon(30% 0%, 100% 0, 100% 100%, 75% 84%, 51% 100%, 26% 86%, 0 100%, 0 0);
           }
       </style>
    </head>
    <body>
        <% if(u==null)
        {
        %>
                <%@include file="normal_navbar.jsp"%>
            <%
                }
else{
            %>
             <%@include file="afterlogin_navbar.jsp"%>

             <%
             
                 }
             %>
             <main>
        <div class="container-fluid">
            <div class="jumbotron text-center text-white banner-background" style="background-color: #339900;margin: 20px">
                <h3 class="display-4">Welcome to JAM..</h3>
                <p>A portal where you can learn the most trending Technical Languages By out Tech Masters.</p>
                <a href="signup.jsp" class="btn btn-outline-light">Get Started now</a>
                <a href="login.jsp" class="btn btn-outline-light">Login</a>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <h5 class="card-header">Java</h5>
                        <p class="card-body">“Why do Java programmers have to wear glasses? Because they don’t C#.” Java is the most flexible and secure language used by almost every top tech companies. Start leaning and see the wonders Java could do.</p>
                        <a href="first_profile_page.jsp" class="btn btn-outline-dark">Start now!</a>
                    </div>    
                </div>
                <div class="col-md-4">
                    <div class="card ">
                        <h5 class="card-header">C++</h5>
                        <p class="card-body">“Programming made the impossible possible. You can have a null object and a constant variable.”
                        To learn more about how this ironical thing works check out the C++ Tutorials by our Tech Masters.</p>
                        <a href="first_profile_page.jsp" class="btn btn-outline-dark">Start now!</a>
                    </div>    
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <h5 class="card-header">Python</h5>
                        <p class="card-body">Rossum thought he needed a name that was short, unique, and slightly mysterious, so he decided to call the language Python. 
                            Let's learn more about this interpreted language. See you there folks.</p>
                        <a href="first_profile_page.jsp" class="btn btn-outline-dark">Start now!</a>
                    </div>    
                </div>
        </div>
        </div>
            <br>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card" >
                        <h5 class="card-header">HTML</h5>
                        <p class="card-body">Everything in this world is properly structured, so don't you think your website should also be!!
                        Starting learning HTML and see the wonders it could do.</p>
                        <a href="first_profile_page.jsp" class="btn btn-outline-dark">Start now!</a>
                    </div>    
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <h5 class="card-header">CSS</h5>
                        <p class="card-body">The World is beautiful, so should be your website. Put amazing colors and fonts in your websites and make them look even more attractive. Join us today!! </p>
                        <a href="first_profile_page.jsp" class="btn btn-outline-dark">Start now!</a>
                    </div>    
                </div>
                <div class="col-md-4">
                    <div class="card ">
                        <h5 class="card-header">JavaScript</h5>
                        <p class="card-body">If languages could talk what would Javascript say to Java? "I can smell the jealousy huh." Learn more about JavaScript from out Tech Experts. Join us today.</p>
                        <a href="first_profile_page.jsp" class="btn btn-outline-dark">Start now!</a>
                    </div>    
                </div>
        </div>
        </div>      
             </main>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
