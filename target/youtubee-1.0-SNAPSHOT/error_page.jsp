<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page isErrorPage="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry, Something went wrong</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/beauty.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            img{
                width:300px;
                height:400px;
                padding: 10px;
                margin: 30px;
            }
        </style>
    </head>
    <body>
        <div class="container text-center">
            <img src="images/error.jpg" class="img-fluid">
            <h3 class="display-3">Sorry!! Page not found..</h3><br><br>
            <%= exception%>
            <a href="index.jsp" class="btn btn-outline-primary ">Home</a>        
        </div>
    </body>
</html>
