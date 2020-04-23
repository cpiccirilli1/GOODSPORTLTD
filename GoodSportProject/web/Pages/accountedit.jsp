<%-- 
    Document   : index
    Created on : Jan 27, 2020, 3:31:36 PM
    Author     : mitho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BusinessObjects.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" rel="stylesheet">
        <link href="http://localhost:8080/GoodSportProject/CSS/accountEditCSS.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Good Sport</title>
    </head>
    <body>
        
        <%
            Customer cust = (Customer)request.getSession().getAttribute("c1");
            String pass = cust.getPassword();
            String fname = cust.getFName();
            String lname = cust.getLName();
            String address = cust.getAddr();
            String email = cust.getEmail();
            String phone = cust.getPhone();
            
            String[] addressln = address.split(",");
            
            String add1 = addressln[0];
            String add2 = addressln[1];
            String city = addressln[2];
            String state = addressln[3];
            String zip = addressln[4];
            
            %>
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
        <div class="container">  
            <div class="row">
             <div class="col-sm-3"></div>  
                <div class="col-sm-6">
                    <h1 style="font-size:2vw; font-weight: bold;" class="center">Update Customer Account</h1>

               <form method="post" action="http://localhost:8080/GoodSportProject/accountservlet">
               <table class="table">
                   <tr>
                       <td style="font-weight: bold;">First Name</td><td><input type="text" class="form-control" name="firstname" value="<%= fname %>"></td>
                   </tr>
                   <tr>
                       <td style="font-weight: bold;">Last Name: </td><td><input type="text" class="form-control" name="lastname" value="<%= lname %>"></td>
                   </tr>
                   <tr>
                       <td style="font-weight: bold;">Email:</td><td><input type="text" class="form-control" name="email" value="<%= email %>"></td>
                   </tr>
                   <tr>
                       <td style="font-weight: bold;">Phone Number:  </td><td><input type="text" class="form-control" name="phonenum" value="<%= phone %>"></td>
                   </tr>
                   <tr>
                       <td style="font-weight: bold;">Address:</td><td><input type="text" class="form-control" name="address1" value="<%= add1 %>"></td>
                   </tr>

                   <tr>
                       <td style="font-weight: bold;">Address cont:</td><td><input type="text" class="form-control" name="address2" value="<%= add2 %>"></td>
                   </tr>
                   <tr>

                       <td style="font-weight: bold;">City:</td><td><input type="text" class="form-control" name="city" value="<%= city %>"></td>

                   </tr>            
                   <tr>
                       <td style="font-weight: bold;">State:</td><td><input type="text" class="form-control" name="state" value="<%= state %>"></td>
                   </tr>
                   <tr>
                       <td style="font-weight: bold;">Zip:</td><td><input type="text" class="form-control" name="zip" value="<%= zip %>"></td>
                   </tr>
                   <tr>
                       <td style="font-weight: bold;">Password:</td><td><input type="text" class="form-control" name="password" value="<%= pass %>"></td>
                   </tr>

                   <tr>
                       <td></td><td><button type="submit" class="btn btn-default">Update</button></td>
               </table>
            </form>
                </div>
            </div>
        </div>
            <br>
            <br>
            <br>
            <br>
            <br>
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
                        <br>
                    </div>
            </div>
	</footer>

    </body>
</html>
