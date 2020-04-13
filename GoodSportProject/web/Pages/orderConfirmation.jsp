<%-- 
    Document   : orderConfirmation
    Created on : Mar 7, 2020, 3:48:57 PM
    Author     : rikam
--%>

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
        <title>Order Complete!</title>
    </head>
    <body style="background-color: #f2f2f2;">
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
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Baseball">Baseball</li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Volleyball">Volleyball</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Soccer">Soccer</a></li>
                                    <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Golf">Golf</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="form-group col-sm-4">
                        <form class="navbar-form navbar-left search-bar-wrapper" action="http://localhost:8080/GoodSportProject/Search">
                            <div class="input-group search-bar-wrapper">
                                <input type="text" class="form-control" placeholder="Search" size="50" name="search" required>
                                <div class="input-group-btn">
                                <button type="text" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>                  
                    <div class="form-group col-sm-6">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="http://localhost:8080/GoodSportProject/Pages/SignIn.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
                            <li><a href="http://localhost:8080/GoodSportProject/Pages/shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <div id="order" class="container">
            <div class="text-center">
                <h3 style="font-size:2.5vw; font-family: 'Arial Black', Gadget, sans-serif;">Thank you for your order!</h3>
                <hr class="style1" style="border: 1px solid #999999;">
                <br>
            </div>
            <div class="col-sm-5">
                <h3 style="font-family: 'Arial Black', Gadget, sans-serif;">Order number: </h3>
                <hr class="style1" style="border: 1px solid #999999;">
                <p>We are currently processing your order.</p>
                <p>For your convenience you may want to save your order confirmation.</p>
                <br>
                <h3 style="font-family: 'Arial Black', Gadget, sans-serif;">Delivery Details</h3>
                <hr class="style2" style="border: 1px solid #999999;">
                <h4><strong>Delivery for</strong></h4>
                <br>
                <br>
                <br>
                <br>
                <h4><strong>Address</strong></h4>
                <br>
                <br>
                <br>
            </div>
            <div class="col-sm-2">
            </div>
            <div class="col-sm-5" style="background-color:#ffffff; box-shadow:0 0 10px rgba(0,0,0,.15); border-collapse: collapse; border-radius: 25px; border: 1px solid #999999;">
                <h3 style="font-size:1.8vw; font-family: 'Arial Black', Gadget, sans-serif; text-align: center">Order Summary</h3>
                <hr class="style1" style="border: 1px solid #999999;">
                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:50%" alt="Image"></div>
                <h3 style="font-size:1vw;">Order Subtotal: </h3>
                <h3 style="font-size:1vw;">Estimated Shipping: </h3>
                <h3 style="font-size:1vw;">Estimated Tax: </h3>
                <h3 style="font-size:1.6vw; font-weight: bold;">Estimated Order Total: </h3>
                <br>
                <br>
            </div>
        </div>
        <br>
        <br>
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
                                <img src="http://localhost:8080/GoodSportProject/Media/basketball-court.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;"  width="55" height="55" ></a>
                                <img src="http://localhost:8080/GoodSportProject/Media/baseball.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;"  width="50" height="50" ></a>
                                <img src="http://localhost:8080/GoodSportProject/Media/american-football.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;"  width="50" height="50" ></a>
                                <img src="http://localhost:8080/GoodSportProject/Media/football.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;"  width="50" height="50" ></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="contactbutton" style="text-align: center;">
                                    <a href="" class="contact" title="Contact Info">Contact us</a>
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                </div>
            </div>
        </footer>
    </body>
</html>
