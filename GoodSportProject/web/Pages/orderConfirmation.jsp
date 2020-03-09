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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Order Complete!</title>
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
		<div id="order" class="container-fluid">
		  <div class="text-center">
			<h3 style="font-size:2.5vw;">Thank you for your order!</h3>
		  </div>
		  <div class="col-sm-3 col-xs-12">
		  </div>
		  <div class="col-sm-4 col-xs-12">
			<h3>Order number: </h3>
			<hr class="style2">
			<p>We are currently processing your order.</p>
			<p>For your convenience you may want to save your order confirmation.</p>
			<br>
			<h3>Deliverly Details</h3>
			<hr class="style2">
			<h4><strong>Delivery for</strong></h4>
			<br>
			<br>
			<br>
			<br>
			<h4><strong>Address</strong></h4>
			<br>
			<br>
			<h4><strong>Shipping Method</strong></h4>
			<br>
			<br>
		  </div>
		  <div class="col-sm-2 col-xs-12">
			<h3 style="font-size:1.5vw;">Order Summary</h3>
			 <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
			 <h3 style="font-size:1vw;">Order Subtotal: </h3>
				<h3 style="font-size:1vw;">Estimated Shipping: </h3>
				<h3 style="font-size:1vw;">Estimated Tax: </h3>
				<h3 style="font-size:1.2vw;">Estimated Order Total: </h3>
				<br>
				<br>
			</div>
		</div>
		</div>
		</div>
		</div>
    </body>
    <footer>
        <ul style="list-style: none;"> 
            
            <li style="display:inline;"><a href ="Pages/SignIn.jsp">Sign In</a>  </li>

            <li style="display:inline;"><a href ="Pages/ItemGrid.jsp">Item Grid</a>  </li>

            <li style="display:inline;"><a href ="index.jsp">Home</a>  </li>

            <li style="display:inline;"><a href ="Pages/ItemDisplay.jsp">Item Display</a>  </li>

            <li style="display:inline;"><a href ="">page 6 </a>  </li>
        
        </ul>
    </footer>
</html>
