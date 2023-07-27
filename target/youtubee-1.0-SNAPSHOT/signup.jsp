<%-- 
    Document   : signup.jsp
    Created on : Sep 19, 2022, 10:54:38 PM
    Author     : 91700
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-Up Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/beauty.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
           .banner-background{
            /*clip-path: polygon(50% 0%, 80% 0, 100% 0, 100% 85%, 74% 79%, 47% 87%, 24% 79%, 0 87%, 0 0, 21% 0);*/   
/*            clip-path: polygon(50% 0%, 81% 0, 100% 0, 100% 76%, 80% 88%, 62% 89%, 28% 86%, 0 76%, 0 0, 18% 0);
            */
/*            clip-path: polygon(50% 0%, 81% 0, 100% 0, 100% 90%, 80% 90%, 50% 90%, 22% 90%, 0 89%, 0 0, 19% 0%);
            background-attachment: fixed;*/
}
           </style>
    </head>
    <body >
        <%@include file="normal_navbar.jsp" %>
        <main>
        <main class="d-flex align-items-center ">                      
            <!--<img src="images/signup.jpg" width="400px" height="400px" align="right" style="margin-left: 150px">-->
                    
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card" >
                        <div class="card-header log">
                            <h3>Sign-Up</h3>
                        </div>
                        <div class="card-content container mt-3 p-3" >
                            <form action="Signupservlet" method="post" id="su">
                                <div class="row">
                                <div class="col-md-6 ">
                                First Name<br><input type="text" name="first_name" class="form-control" placeholder="Enter first name"><br>
                                </div>
                                <div class="col-md-6 ">
                                Last name<br><input type="text" name="last_name" class="form-control" placeholder="Enter last name"><br>
                                </div>
                                    </div>
                                <div class="row">
                                    <div class="col-md-6">
                                 
                                Set Password<br><input type="password" name="password1" class="form-control" placeholder="Enter password"><br>
                                
                                </div>
                                    <div class="col-md-6">
                                        Rewrite password<br><input type="password" name="password2" class="form-control" placeholder="Re-Enter Password"><br>
                               </div> </div>
                                Email Id<br><input type="email" name="user_email" class="form-control" placeholder="Enter emailid"><br>
                                <div class="row">
                                    <div class="col-md-6">
                                Address<br><input type="text" name="address" class="form-control" placeholder="Enter Address"><br>
                                </div>
                                <div class="col-md-6">
                                Mobile<br><input type="tel" name="mobile" class="form-control" placeholder="Enter Mobile Number"><br>
                                </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                Are you a
                                <input type="radio" name="user" value="Teacher">Teacher
                                <input type="radio" name="user" value="Student">Student<br>
                                </div>
                                    <div class="col-md-6">
                                Which pronoun do you prefer
                                <input type="radio" name="gender" value="female">Female
                                <input type="radio" name="gender" value="male">Male<br>
                                </div>
                                </div>
                                <div class="container text-center" id="loader" style="display:none;">
                                <span class="fa fa-refresh fa-spin fa-4x"></span>
                                <h3>Please Wait</h3>
                            </div>
                                <button type="submit" class="btn btn-outline-primary" style="margin: 5px" id="submit-id">Sign-Up</button>
                                <h3 style="display: none;" id="success"></h3>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </main>
        </main>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                console.log("Loaded...");
                $("#su").on('submit',function(event){
                    //to stop the page to be reloaded
                   event.preventDefault();
                   //getting form data in form
                   
                   let form = new FormData(this);
                   $("#submit-id").hide();
                   $("#loader").show();
                   $("#success").hide();
                   //submitting form on the servlet
                   $.ajax({
                      url: "Signupservlet",
                      data: form,
                      type: 'POST',
                      success:function(data,textStatus,jqXHR){
                          //console.log(data);
                          $("#submit-id").show();
                          $("#loader").hide();
                          
                          if(data.trim()==='Done')
                          {
                              swal("Registered Successfully, Go to login page.")
                              .then((value) => {
                          window.location="login.jsp";
                          });
                          $('#success').show();
                          $('#success').html("You have been signed up successfully...");
                      }
                      else if(data.trim()==='Wrongpass')
                      {
                          console.log(data);
                          $('#success').show();
                          $('#success').html("Different passwords were entered both the times");
                      }
                      else if(data.trim()==='PassShort')
                      {
                           $('#success').show();
                           $('#success').html("Password should contain atleast 8 characters");
                      }
                      else if(data.trim()==='Values')
                      {
                          swal("Fill in all the details.");
                      }
                      else if(data.trim()==='Present')
                      {
                          swal("User Already exists, Go to login page.")
                          .then((value) => {
                          
                          window.location="login.jsp";
                          });
                           $('#success').show();
                           $('#success').html("User already exists.");
                      }
                      },
                      error:function(jqXHR,textStatus,errorThrown){
                          console.log("failed");
                          console.log(data);
                          $("#submit-id").show();
                          $("#loader").hide();
                              $("#success").show();
                              $('#success').html("User alreay exists")
                      },
                      processData:false,
                      contentType:false    
                   })
                })
            });
        </script>
    </body>
</html>
