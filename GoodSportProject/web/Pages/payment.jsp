<%-- 
    Document   : payment
    Created on : Feb 17, 2020, 3:37:05 PM
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
		<div class="container">
		<div class="row">
		<div class="form-group col-sm-4">
			<h3 style="font-size:2vw;">Payment Information</h3>
			  <label for="num"></label>
			  <input type="num" class="form-control" placeholder="Credit or Debit Card Number" id="num" name="num">
			  <br>
			  <label for="num"></label>
			  <input type="num" class="form-control" placeholder="Exp. Date MM/YY" id="num" name="num">
			  <br>
			  <label for="name"></label>
			  <input type="name" class="form-control" placeholder="Security Code" id="name" name="name">
			  <br>	  
		</div>
		<div class="form-group col-sm-3">
		</div>
		<div class="form-group col-sm-4">
			<h3 style="font-size:1.6vw;">Order Summary</h3>
			 <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:80%" alt="Image"></div>
			 <h3 style="font-size:1vw;">Order Subtotal: </h3>
				<h3 style="font-size:1vw;">Estimated Shipping: </h3>
				<h3 style="font-size:1vw;">Estimated Tax: </h3>
				<h3 style="font-size:1.5vw;">Estimated Order Total: </h3>
				<br>
				<br>
				<button type="button" class="btn btn-primary btn-block">PLACE MY ORDER</button> 
		</div>
		</div>
		</div>
		<br>
	<br>
    </body>
    <footer>
        <ul style="list-style: none;"> 
            
        <li style="display:inline;"><a href ="">page 1 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 2 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 3 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 4 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 5 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 6 </a>  </li>      
        </ul>
    </footer>
</html>
