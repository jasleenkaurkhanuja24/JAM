

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.youtubee.helper.Message"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/beauty.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 81% 0, 100% 0, 100% 76%, 80% 88%, 52% 79%, 28% 86%, 0 76%, 0 0, 18% 0);
            }

        </style>
    </head>

    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center banner-background" style="height: 90vh;">
            <div class="container"> 
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card ">
                            <div class="card-header log">
                                <h3 >Login Here!!</h3>
                                
                            </div>
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
                            <div class="card-body">
                                <form action="Loginservlet" method="post" >
                                    Email Id<input type="email" name="email" class="form-control" placeholder="Enter emailid">
                                    Password<input type="password" name="password" class="form-control" placeholder="Enter Password" >
                                    <small id="emailhelp">We'll never share your email or password with anyone else.</small>
                                    <br>
                                    <button type="submit" class="btn btn-outline-light " style="margin:5px; ">Log-In</button>
                                </form>
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
