<%-- 
    Document   : FAQ
    Created on : Apr 27, 2020, 5:36:22 PM
    Author     : rikam
--%>

<%@page import="BusinessObjects.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" rel="stylesheet">
        <link href="http://localhost:8080/GoodSportProject/CSS/shoppingCartCSS.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Good Sport</title>
    </head>
        <body>
            <%
                session = request.getSession();
                String fName;
                Customer c1 = new Customer();
                if (null == session.getAttribute("c1")) {
                    fName = "My";

                } else {
                    c1 = (Customer) session.getAttribute("c1");
                    fName = c1.getFName() + "'s";
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
                <div class="col-sm-2"></div>
                <div class="col-sm-9">
                    <h1 style="font-family: 'Arial Black', Gadget, sans-serif; text-align: center;">Frequently Asked Questions</h1>
               <hr class="style1" style="border: 1px solid #999999;">
                <br>
                    <p style="color:blue; font-size: 17px;">1. How can I view my account? <p>
                    <p>-You can view your account on top of the corner "My Account".</p>
                    <br>
                    <p style="color:blue; font-size: 17px;">2. I want to change my address. How can I change it?</p>
                    <p>-Go to your account and then login to your account. You can see the edit button to update your address.</p>
                    <br>
                    <p style="color:blue; font-size: 17px;">3. Can you ship internationally or process international credit cards from the outside of the United States?</p>
                    <p>-At this time we do not offer international shipping and cannot accept credit cards from outside of the United States.</p>
                    <br>
                    <p style="color:blue; font-size: 17px;">4. How can I pay for my order?</p>
                    <p>-Good Sport accepts Visa, MasterCard, and American Express.</p>
                    <br>
                    <p style="color:blue; font-size: 17px;">5. Do you guys accept payment via PayPal?</p>
                    <p>-No, we do not.</p>
                    <br>
                    <p style="color:blue; font-size: 17px;">6. How can I save my order confirmation?</p>
                    <p>-You can print your order confirmation page or take a screen shot.</p>
                    <br>
                    <p style="color:blue; font-size: 17px;">7. Can I cancel or change my order?</p>
                    <p>-We begin processing orders as soon as they are placed, for this reason we are unable to cancel or make changes to orders.</p>
                    <br>
                    <p style="color:blue; font-size: 17px;">8. Can I save my product and buy it later?</p>
                    <p>-Yes, you can.</p>
                    <br>
                    <p style="color:blue; font-size: 17px;">9. Can I exchange my order?</p>
                    <p>-We do not offer exchanges at this time.</p>
                    <br>
                    <p></p>
                    <p></p>
                    <br>
                    <br>
                </div>
            </div>
    </div>                              
    <footer>									<!-- footer begins here -->
        <div class="footer">
            <div class="signature container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2 style="text-align: center; font-family: Impact, Charcoal, sans-serif; font-size: 50px;"><a href="index.jsp">Good Sport</a></h2>
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