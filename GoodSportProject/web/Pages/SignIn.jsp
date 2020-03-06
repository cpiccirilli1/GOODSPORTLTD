<%-- 
    Document   : index
    Created on : Jan 27, 2020, 3:31:36 PM
    Author     : mitho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Good Sport</title>
        <link href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" rel="stylesheet">
    </head>
    <body>
        <nav class="">
            <div class="container-fluid navbar-custom">
                <div class="navbar-header">
                    <div class="logo_wrapper">
                        <a href="http://localhost:8080/GoodSportProject/index.jsp"><img class="logo" src="http://localhost:8080/GoodSportProject/Media/Logo.png"/></a>
                    </div>
                </div>
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Page 1-1</a></li>
                            <li><a href="#">Page 1-2</a></li>
                            <li><a href="#">Page 1-3</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" action="http://localhost:8080/GoodSportProject/Servlets/Search.java">
                    <div class="form-group search-bar-wrapper">
                        <input type="text" class="search-bar" placeholder="Search" name="search">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/SignIn.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
                     <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-5">
                    <h4>Sign In</h4>
                    <form method="post" action="http://localhost:8080/GoodSportProject/LoginServlet">
                        <div class="form-group">
                            <label>Email: </label>
                            <input type="text" name="emailSignIn" required>
                        </div>
                        <div class="form-group">
                            <label>Password: </label>
                            <input type="password" name="passwordSignIn" required>
                        </div>
                        <div class="form-group">
                            <div>
                                <input type="radio" name="employeeCheck" id="customer" value="Customer" checked="true">
                                <label>Customer</label>
                            </div>
                            <div>
                                <input type="radio" name="employeeCheck" id="employee" value="Employee">
                                <label>Employee</label>
                            </div>
                        </div>
                        <input type="submit" value="Sign In">
                    </form>
                </div>
                <div class="col-sm-5">
                    <h4>Sign Up</h4>
                    <form onsubmit="return validate()" action="http://localhost:8080/GoodSportProject/CreateAccountServlet" method="Post">
                        <div class="form-group">
                            <label>Email: </label>
                            <input type="text" name="emailSignUp" required>
                        </div>
                        <div class="form-group">
                            <label>Password: </label>
                            <input type="password" name="passwordSignUp" required>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password: </label>
                            <input type="password" name="confirmPswd" required>
                        </div>
                        <div class="form-group">
                            <label>First Name: </label>
                            <input type="text" name="firstNameSignUp">
                        </div>
                        <div class="form-group">
                            <label>Last Name: </label>
                            <input type="text" name="lastNameSignUp">
                        </div>
                        <div class="form-group">
                            <label>Phone Number: </label>
                            <input type="text" name="phoneNumberSignUp">
                        </div>
                        <div class="form-group">
                            <label>Add address</label>
                            <input type="checkbox" name="address" onclick="visibility()">
                        </div>
                        <div id="addressBoxes" style="display:none;">
                            <div class="form-group">
                                <label>Street: </label>
                                <input type="text" name="streetSignUp">
                            </div>
                            <div class="form-group">
                                <label>Street cont.: </label>
                                <input type="text" name="streetSignUp1">
                            </div>
                            <div class="form-group">
                                <label>City: </label>
                                <input type="text" name="citySignUp">
                            </div>
                            <div class="form-group">
                                <label>State: </label>
                                <input type="text" name="stateSignUp">
                            </div>
                            <div class="form-group">
                                <label>Zipcode: </label>
                                <input type="text" name="zipcodeSignUp">
                            </div>
                        </div>
                        <input type="submit" value="Sign Up">
                    </form>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
        <script>
            function visibility() {
                var x = document.getElementById("addressBoxes");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
            function validate() {
                if (document.getElementsByName(usernameSignUp).toString().indexOf("@") > 0) {
                    
                } else {
                    alert("Please enter a valid email address");
                }
                var x = document.getElementsByName(passwordSignUp).toString();
                if ((x != null) && (x !== document.getElementsByName(confirmPswd).toString())) {
                    alert("Confirm password does not match");
                }
            }
    </script>
    </body>
    <footer>
        <ul style="list-style: none;"> 
            
            <li style="display:inline;"><a href ="account.jsp">My Account</a>  </li>

            <li style="display:inline;"><a href ="SignIn.jsp">Sign In</a>  </li>

            <li style="display:inline;"><a href ="ItemGrid.jsp">Item Grid</a>  </li>

            <li style="display:inline;"><a href ="../index.jsp">Home</a>  </li>

            <li style="display:inline;"><a href ="ItemDisplay.jsp">Item Display</a>  </li>

            <li style="display:inline;"><a href ="">page 6 </a>  </li>
        
        </ul>

    </footer>
</html>