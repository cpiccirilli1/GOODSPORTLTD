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
        <title>Payment Information</title>
        <link href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                <div class="col-sm-1">
		</div>
                <form action="/echo" method="post" novalidate="novalidate" class="needs-validation">
		<div class="form-group col-sm-4">
			<h3 style="font-size:2vw;">Payment Information</h3>
                        <i class="fa fa-cc-visa" style="font-size:30px"></i>
                        <i class="fa fa-cc-amex" style="font-size:30px"></i>
                        <i class="fa fa-cc-discover" style="font-size:30px"></i>
                        <i class="fa fa-cc-mastercard" style="font-size:30px"></i>
                        <i class="fa fa-cc-jcb" style="font-size:30px"></i>
                        <br>
                        <br>
			  <label for="cc-number" class="control-label mb-1">Card number</label>
                            <input id="cc-number" name="cc-number" type="tel" class="form-control cc-number identified visa" required autocomplete="off"  >
                            <span class="invali>-feedback">Enter a valid 12 to 16 digit card number</span>
			  <br>
                          <br>
			   <label for="cc-exp" class="control-label mb-1">Expiration</label>
                             <input id="cc-exp" name="cc-exp" type="tel" class="form-control cc-exp" required placeholder="MM / YY" autocomplete="cc-exp">
                             <span class="invalid-feedback">Enter the expiration date</span>
			  <br>
                          <br>
			  <label for="x_card_code" class="control-label mb-1">CVV</label>
                                <div class="input-group">
                                    <input id="x_card_code" name="x_card_code" type="tel" class="form-control cc-cvc" required autocomplete="off">
                                    <span class="invalid-feedback order-last">Enter the 3-digit code on back</span>
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                        <span class="fa fa-question-circle fa-lg" data-toggle="popover" data-container="body" data-html="true" data-title="CVV" 
                                        data-content="<div class='text-center one-card'>The 3 digit code on back of the card..<div class='visa-mc-cvc-preview'></div></div>"
                                        data-trigger="hover"></span>
                                        </div>
                                    </div>
                                </div>
			  <br>	  
		</div>
                </form>
		<div class="form-group col-sm-1">
		</div>
		<div class="col-sm-4">
			<h3 style="font-size:1.6vw;">Order Summary</h3>
			 <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:80%" alt="Image"></div>
			 <h3 style="font-size:1vw;">Order Subtotal: </h3>
				<h3 style="font-size:1vw;">Estimated Shipping: </h3>
				<h3 style="font-size:1vw;">Estimated Tax: </h3>
				<h3 style="font-size:1.5vw;">Estimated Order Total: </h3>
				<br>
				<br>
                                <form action="/echo" method="post" novalidate="novalidate" class="needs-validation">
                                   <a href="orderConfirmation.jsp"<button id="payment-button" type="submit" class="btn btn-lg btn-info btn-block">
                                        <i class="fa fa-lock fa-lg"></i>&nbsp;
                                        <span id="payment-button-amount">PLACE MY ORDER </span>
                                        <span id="payment-button-sending" style="display:none;">Sending…</span>
                                      </a>
                                </form>
		</div>
		</div>
		</div>
		<br>
	<br>
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
