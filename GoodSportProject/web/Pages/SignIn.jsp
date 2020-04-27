<%-- 
    Document   : index
    Created on : Jan 27, 2020, 3:31:36 PM
    Author     : mitho
--%>

<%@page import="BusinessObjects.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="http://localhost:8080/GoodSportProject/CSS/SignInCSS.css" rel="stylesheet">
        <title>Good Sport</title>
    </head>
    <body>
       <%
            session = request.getSession();
            String fName;
            Customer c1 = new Customer();
            if(null==session.getAttribute("c1")){
                fName = "My";
                
            }
            else{
                c1 = (Customer)session.getAttribute("c1");
                fName = c1.getFName()+"'s";
                response.sendRedirect("http://localhost:8080/GoodSportProject/Pages/account.jsp");
            }
            %>
        <nav class="navbar-custom-wrapper">
            <div class="container-fluid navbar-custom">
                <div class="row">
                    <div class="form-group col-sm-1">
                        <div class="navbar-header">
                            <div class="logo_wrapper">
                                <a href="http://localhost:8080/GoodSportProject/index.jsp"><img class="logo" src="http://localhost:8080/GoodSportProject/Media/Logo.png"/></a>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-sm-1">
                        <ul class="nav navbar-nav">
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop <span class="caret"></span></a>
                                <ul class="dropdown-menu category-drop-down">
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Running">Running</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Football">Football</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Basketball">Basketball</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Baseball">Baseball</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Volleyball">Volleyball</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Soccer">Soccer</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Golf">Golf</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Rugby">Rugby</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Hockey">Hockey</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Hunting">Hunting</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="form-group col-sm-4">
                        <form class="navbar-form navbar-left search-bar-wrapper" action="http://localhost:8080/GoodSportProject/Search">
                            <div class="input-group search-bar-wrapper">
                                <input type="text" class="form-control" placeholder="Search" size="50" name="search" required>
                                <div class="input-group-btn">
                                <button type="submit" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>                  
                    <div class="form-group col-sm-6">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="http://localhost:8080/GoodSportProject/Pages/SignIn.jsp"><span class="glyphicon glyphicon-user"></span> <%=fName%> Account</a></li>
                            <li><a href="http://localhost:8080/GoodSportProject/Pages/shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                        </ul>
                    </div>
                </div>
            </div>
       </nav>  
      <main>
        <div class="container-fluid" style="background-color: #f2f2f2;">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-3">
                    <h3 style="font-weight: bold;">Sign In</h3>
                            <%
                                if(null!=session.getAttribute("signInErr")){
                            String inErr = (String)session.getAttribute("signInErr");
                            out.println(inErr);
                            }
                            %>
                    <form method="post" action="http://localhost:8080/GoodSportProject/LoginServlet">
                        <div class="form-group">
                            <label>Email: </label>
                            <input type="email" class="form-control" name="emailSignIn" required>
                        </div>
                        <div class="form-group">
                            <label>Password: </label>
                            <input type="password" class="form-control" name="passwordSignIn" required>
                        </div>
                        <div class="form-group">
                            <div>
                                <input type="radio" name="employeeCheck" id="customer" value="Customer" checked>
                                <label>Customer</label>
                            </div>
                            <div>
                                <input type="radio" name="employeeCheck" id="employee" value="Employee">
                                <label>Employee</label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Sign In</button>
                    </form>
                </div>
                <div class="col-sm-3">
                    <h3 style="font-weight: bold;">Sign Up</h3>
                    <form onsubmit="return validate()" action="http://localhost:8080/GoodSportProject/CreateAccountServlet" method="Post">
                        <%
                        if(null!=session.getAttribute("signUpErr")){
                        String upErr = (String)session.getAttribute("signUpErr");
                        out.println(upErr);
                        }
                        %>
                        <div class="form-group">
                            <label>Email: </label>
                            <input type="text" class="form-control" name="emailSignUp" required>
                        </div>
                        <div class="form-group">
                            <label>Password: </label>
                            <input type="password" class="form-control" name="passwordSignUp" required>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password: </label>
                            <input type="password" class="form-control" name="confirmPswd" required>
                        </div>
                        <div class="form-group">
                            <label>First Name: </label>
                            <input type="text" class="form-control" name="firstNameSignUp">
                        </div>
                        <div class="form-group">
                            <label>Last Name: </label>
                            <input type="text" class="form-control" name="lastNameSignUp">
                        </div>
                        <div class="form-group">
                            <label>Phone Number: </label>
                            <input type="text" class="form-control" name="phoneNumberSignUp">
                        </div>
                        <div class="form-group">
                            <label>Add address</label>
                            <input type="checkbox" name="address" onclick="visibility()">
                        </div>
                        <div id="addressBoxes" style="display:none;">
                            <div class="form-group">
                                <label>Street: </label>
                                <input type="text" class="form-control" name="streetSignUp">
                            </div>
                            <div class="form-group">
                                <label>Appt/Suite No.: </label>
                                <input type="text" class="form-control" name="streetSignUp1">
                            </div>
                            <div class="form-group">
                                <label>City: </label>
                                <input type="text" class="form-control" name="citySignUp">
                            </div>
                            <div class="form-group">
                                <label>State: </label>
                                <input type="text" class="form-control" name="stateSignUp">
                            </div>
                            <div class="form-group">
                                <label>Zipcode: </label>
                                <input type="text" class="form-control" name="zipcodeSignUp">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Sign Up</button>
                        <br>
                        <br>
                    </form>
                </div>
                <div class="col-sm-1"></div>
            </div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
        </div>
      </main>             
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
        <footer>									<!-- footer begins here -->
            <div class="footer">
                    <div class="signature container">
                        <div class="row">
                            <div class="col-sm-12">
                                <h2 style="text-align: center; font-family: Impact, Charcoal, sans-serif; font-size: 50px;"><a href="http://localhost:8080/GoodSportProject/index.jsp">Good Sport</a></h2>
                                <p style="text-align: center;">This website was create and designed by Project Team #1</p>
                                <br>
                            </div>                       
                        </div>
                        <div class="row">
                            <div class="col-sm-12" style="text-align: center;">
                                <img src="http://localhost:8080/GoodSportProject/Media/basketball-court.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;"  width="55" height="55" >
                                <img src="http://localhost:8080/GoodSportProject/Media/baseball.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;"  width="50" height="50" >
                                <img src="http://localhost:8080/GoodSportProject/Media/american-football.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;"  width="50" height="50" >
                                <img src="http://localhost:8080/GoodSportProject/Media/football.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;"  width="50" height="50" >
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-12" style="text-align: center;">
                                <h4 style="font-family: sans-serif; font-size: 15px;"><a href="http://localhost:8080/GoodSportProject/Pages/FAQ.jsp" target="_blank">Frequently Asked Questions</a></h4>
                            </div>
                        </div>
                        <br>
                    </div>
            </div>
	</footer>
    </body>
</html>