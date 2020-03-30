<%-- 
    Document   : payment
    Created on : Feb 17, 2020, 3:37:05 PM
    Author     : rikam
--%>

<%@page import="BusinessObjects.Customer"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="BusinessObjects.ItemList"%>
<%@page import="BusinessObjects.Item"%>
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
        <title>Payment Information</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
		<div class="container">
		<div class="row">
                <div class="col-sm-1">
		</div>
                <form action="http://localhost:8080/GoodSportProject/CustPaymentServlet" method="post" novalidate="novalidate" class="needs-validation">
		<div class="form-group col-sm-4">
			<h3 style="font-size:2vw;">Payment Information</h3>
                        <i class="fa fa-cc-visa" style="font-size:30px"></i>
                        <i class="fa fa-cc-amex" style="font-size:30px"></i>
                        <i class="fa fa-cc-discover" style="font-size:30px"></i>
                        <i class="fa fa-cc-mastercard" style="font-size:30px"></i>
                        <i class="fa fa-cc-jcb" style="font-size:30px"></i>
                        <br>
                        <br>
                         <label for="nameoncard" class="control-label mb-1">Name on card</label>
                            <input id="name" name="name" type="text" class="form-control name" required autocomplete="off"  >
                            <span class="invali>-feedback">Please enter name on card</span>
			  <br>
                          <br>
			  <label for="cc-number" class="control-label mb-1">Card number</label>
                            <input id="cc-number" name="cc-number" type="text" class="form-control cc-number identified visa" required autocomplete="off"  >
                            <span class="invali>-feedback">Enter a valid 12 to 16 digit card number</span>
			  <br>
                          <br>
			   <label for="cc-exp" class="control-label mb-1">Expiration</label>
                             <input id="cc-exp" name="cc-exp" type="text" class="form-control cc-exp" required placeholder="MM / YY" autocomplete="cc-exp">
                             <span class="invalid-feedback">Enter the expiration date</span>
			  <br>
                          <br>
			  <label for="x_card_code" class="control-label mb-1">CVV</label>
                          <input id="cc-cvv" name="cc-cvv" type="text" class="form-control cc-cvc" required autocomplete="off">
                                <span class="invali>-feedback">Enter the 3-digit code on back</span>
			  <br>
                          <br>
                              <button id="payment-button" type="submit" class="btn btn-lg btn-info btn-block">
                                        <i class="fa fa-lock fa-lg"></i>&nbsp;
                                        <span id="payment-button-amount">PLACE MY ORDER </span>
                                        <span id="payment-button-sending" style="display:none;">Sending…</span>
                                      </a>
		</div>
                </form>
		<div class="form-group col-sm-1">
		</div>
		<div class="col-sm-4">
                    <br>
                    <br>
                    <br>
			<h3 style="font-size:1.6vw;">Order Summary</h3>
			 <%
                            ItemList cart = new ItemList();
                            DecimalFormat df = new DecimalFormat("#,###.##");
                            try
                            {
                                Customer c1 = (Customer)session.getAttribute("c1");
                                cart.populateCart(c1.getCart().split(","));
                            } catch (NullPointerException e)
                            {
                                try {
                                    cart = (ItemList)session.getAttribute("cart");
                                    cart.getArray();
                                } catch (NullPointerException npe) {
                                    cart = new ItemList();
                                }
                                
                            }
                            double cost = 0;
                            if (cart.iArr.size() == 0) {
                                %>
                                <h3>No items in cart</h3>
                                <%
                            } else {
                                
                                for(int i = 0; i < cart.iArr.size(); i++)
                                {
                                    Item i1 = cart.iArr.get(i);
                                    cost += i1.getPrice();
                        %>
                            <div class="row">
				<div class="form-group col-sm-3">
                                    <div class="panel-body"><img src="<%=i1.getimgLink()%>" class="img-responsive" style="width:100%" alt="Image"></div>
				</div>
				<div class="form-group col-sm-5">
                                    <h3 style="font-size:1.2vw;">Product ID: <%=i1.getId()%></h3>
				</div>
                            </div>
                        <%
                                }
                            }
                        %>
			 <h3 style="font-size:1vw;">Order Subtotal: $<%=df.format(cost)%></h3>
                            <h3 style="font-size:1vw;">Estimated Shipping: $<%=10%></h3>
                            <h3 style="font-size:1vw;">Estimated Tax: $<%=df.format(cost*0.06)%></h3>
                            <h3 style="font-size:1.5vw;">Estimated Order Total: $<%=df.format(cost + (cost*0.06) + 10)%></h3>
				<br>
				<br>
                               
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
                    <div class="signature">
                            <h2><a href="index.jsp">Good Sport</a></h2>
                            <p>This website was create and designed by Project Team #1</p>
                    </div>
                    <div class="contactcontainer">
                            <div class="contactbutton">
                                    <a href="" class="contact" title="Contact Info">Contact us</a>
                            </div>
                    </div>
            </div>
	</footer>
    </body>
</html>
