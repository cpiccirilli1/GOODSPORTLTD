<%-- 
    Document   : index
    Created on : Feb 10, 2020, 2:22:08 PM
    Author     : cgoswic1
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
        <title>Good Sport</title>
    </head>
    <body>
        <nav class="navbar-custom-wrapper">
            <div class="container-fluid navbar-custom">

                <div class="navbar-header">
                    <div class="logo_wrapper">
                        <a href="http://localhost:8080/GoodSportProject/index.jsp"><img class="logo" src="http://localhost:8080/GoodSportProject/Media/Logo.png"/></a>
                    </div>
                </div>


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


                <form class="navbar-form navbar-left search-bar-wrapper" action="http://localhost:8080/GoodSportProject/Search">
                    <div class="form-group search-bar-wrapper">
                        <input type="text" class="search-bar" placeholder="Search" name="search">                             
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>





                <ul class="nav navbar-nav navbar-right">
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/SignIn.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                </ul>

            </div>
          
       </nav> 
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Running"><img src="http://localhost:8080/GoodSportProject/Media/running.jpg" alt="Running" style="width:100%; height:485px !important;"></a>
                        <div class="carousel-caption" style="font-family: Impact, Charcoal, sans-serif;">
                            <h3>Shop for Running</h3>
                        </div>      
                    </div>

                    <div class="item">
                        <a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Soccer"><img src="http://localhost:8080/GoodSportProject/Media/soccer.jpg" alt="Soccer" style="width:100%; height:485px !important;"></a>
                        <div class="carousel-caption" style="font-family: Impact, Charcoal, sans-serif;">
                            <h3>Shop for Soccer</h3>
                           
                        </div>  
                    </div>

                    <div class="item">
                        <a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Football"><img src="http://localhost:8080/GoodSportProject/Media/football.jpg" alt="Football" style="width:100%; height:485px !important;"></a>
                        <div class="carousel-caption" style="font-family: Impact, Charcoal, sans-serif;">
                            <h3>Shop for Football</h3>                         
                        </div>  
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        <br>
        <br>
        <div class="container">    
            <div class="row">
              <div class="col-sm-4">
                  <a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Soccer"><img src="http://localhost:8080/GoodSportProject/InventoryPictures/Nike Barcelona Authentic Home Jersey 19-20.jpg " title="Soccer" class="img-thumbnail" alt="Soccer" width="400" height="300"></a>
                <h3 style="font-size:20px; text-align: center; font-family: Impact, Charcoal, sans-serif;">Shop for Soccer</h3>
              </div>
              <div class="col-sm-4"> 
                  <a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Basketball"><img src="http://localhost:8080/GoodSportProject/InventoryPictures/Spalding NBA Official Game Basketball 29.5.jpg " title="Basketball" class="img-thumbnail" alt="Basketball" width="400" height="300"></a>
                <h3 style="font-size:20px; text-align: center; font-family: Impact, Charcoal, sans-serif;">Shop for Basketball</h3>
                </div>
              <div class="col-sm-4"> 
                  <a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Baseball"><img src="http://localhost:8080/GoodSportProject/InventoryPictures/Easton Project 3 ADV BBCOR 2019 Bat.jpg " title="Baseball" class="img-thumbnail" alt="Baseball" width="300" height="400"></a>
                <h3 style="font-size:20px; text-align: center; font-family: Impact, Charcoal, sans-serif;">Shop for Baseball</h3>
              </div>
            </div>
          </div><br>

          <div class="container">    
            <div class="row">
              <div class="col-sm-4">
                  <a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Volleyball"><img src="http://localhost:8080/GoodSportProject/InventoryPictures/Wilson Optix AVP Tour Outdoor Volleyball.jpg" title="Shoes" class="img-thumbnail" alt="Volleball" width="300" height="300"></a>
                <h3 style="font-size:20px; text-align: center; font-family: Impact, Charcoal, sans-serif;">Shop for Volleyball</h3>
              </div>
              <div class="col-sm-4"> 
                  <a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Football"><img src="http://localhost:8080/GoodSportProject/InventoryPictures/Wilson NFL The Duke Official Football.jpg" title="Football" class="img-thumbnail" alt="Football" width="350" height="300"></a>
                <h3 style="font-size:20px; text-align: center; font-family: Impact, Charcoal, sans-serif;">Shop for Football</h3>
              </div>
              <div class="col-sm-4"> 
                  <a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Running"><img src="http://localhost:8080/GoodSportProject/InventoryPictures/adidas Women's Ultraboost 20 Running Shoes.jpg" title="Running" class="img-thumbnail" alt="Running" width="400" height="300"></a>
                <h3 style="font-size:20px; text-align: center; font-family: Impact, Charcoal, sans-serif;">Shop for Running</h3>
              </div>
            </div>
          </div><br><br>
        <br>
	<br>
	<br>
	<br>
        <footer>									<!-- footer begins here -->
            <div class="footer">
                    <div class="signature container">
                        <div class="row">
                            <div class="col-sm-4">
                                <br>
                                &nbsp;
                                &nbsp;
                                &nbsp;
                                &nbsp;
                                &nbsp;
                                &nbsp;
                                <img src="http://localhost:8080/GoodSportProject/Media/basketball-court.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;" alt="Baseball" width="80" height="80" ></a>
                                <img src="http://localhost:8080/GoodSportProject/Media/baseball.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;" alt="Baseball" width="70" height="70" ></a>
                                <img src="http://localhost:8080/GoodSportProject/Media/american-football.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;" alt="Baseball" width="70" height="70" ></a>
                                <img src="http://localhost:8080/GoodSportProject/Media/football.png"  class="img-thumbnail" style=" background-color: transparent; border: 0;" alt="Baseball" width="70" height="70" ></a>
                            </div>
                           <div class="col-sm-3">
                            <h2 style="text-align: center; font-family: Impact, Charcoal, sans-serif; font-size: 50px;"><a href="index.jsp">Good Sport</a></h2>
                            <p style="text-align: center;">This website was create and designed by Project Team #1</p>
                            <br>
                           </div>
                            <br>
                            <br>
                            <div class="col-sm-2">
                                <div class="contactbutton">
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


