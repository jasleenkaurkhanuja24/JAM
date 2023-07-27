<%-- 
    Document   : normal_navbar
    Created on : Sep 18, 2022, 2:02:10 PM
    Author     : 91700
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>nav</title>
        
    </head >
    <body >
        <div class="fixed-nav-bar">
        <nav class="navbar navbar-expand-lg navbar-dark primary-background" style="background-color: #339900;">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-book"></span>  JAM  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto" >
<!--      <li class="nav-item">
          
      </li>
      <li class="nav-item">
        </li>
      <li class="nav-item">-->
<!--        </li>
      <li class="nav-item">
        </li>
      <li class="nav-item">
        </li>
      <li class="nav-item">
        </li>-->
<!--      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#"><img src="images/java.png"  class="icon">  Java  </a>
          <a class="dropdown-item" href="#"><img src="images/cpp.png"  class="icon">  C++  </a>
      <a class="dropdown-item" href="#"><img src="images/py.png" " class="icon">  Python  </a>
      <a class="dropdown-item" href="#"><img src="images/html.png" class="icon">  HTML  </a>
            <a class="dropdown-item" href="#"><img src="images/css.jpg" class="icon">  CSS  </a>
            <a class="dropdown-item" href="#"><img src="images/js.png"  class="icon">  JavaScript  </a>
      
            <a class="dropdown-item" href="#">Data Structure</a>
          <a class="dropdown-item" href="#">Project Ideas</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Profile</a>
        </div>
      </li>-->
      <li class="nav-item">
          <a class="nav-link" href="login.jsp"><img  src="images/login.jpg" class="icon">  Log-In  </a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="signup.jsp"><span class="fa fa-user-plus"> Sign-Up</span>  </a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
            </div>
    </body>
</html>
