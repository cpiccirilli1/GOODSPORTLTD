<%-- 
    Document   : purchase
    Created on : Feb 14, 2020, 10:27:59 AM
    Author     : rikam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="BusinessObjects.Customer"%>
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
        <title>Getting Your Order</title>
     
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
		<h2 style="font-size:2.5vw;">Getting Your Order</h2>
		<hr class="style2">
		<h3 style="font-size:2vw;">Shipping Information</h3>
		<div class="row">
                    <form onsubmit="return validate()" action="http://localhost:8080/GoodSportProject/Pages/payment.jsp" method="Post" >
                        <div class="form-group col-sm-4">
                            <label>First Name</label>
                            <input type="name" class="form-control" name="fname"/>
                            <br>
                            <label>Last Name</label>
                            <input type="name" class="form-control" name="lname"/>
                            <br>
                            <label>Address</label>
                            <input type="address" class="form-control" name="addr" required/>
                            <br>
                            <label for="name"></label>
                            <input type="address" class="form-control" placeholder="Apt #, Suite, Floor (optional)" name="addr"/>
                            <br>
                            <label>City</label>
                            <input type="city" class="form-control" name="city" required/>
                            <br>
                            <label>State</label>
                            <input type="state" class="form-control" name="state" required/>
                            <br>
                            <label>Zip Code</label>
                            <input type="zip" class="form-control" name="zip" required/>
                            <br>
                            <hr class="style2">               
                            <h3 style="font-size:2vw;">Contact Information</h3>
                            <label for="email">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required/>
                            <br>
                            <label for="phone">Phone Number</label>
                            <input type="phone" class="form-control" id="phone" name="phone" required/>
                            <br>
                            <hr class="style2">
                            <h3 style="font-size:1.5vw;">Billing Address</h3>
                            <label>First Name</label>
                            <input type="name" class="form-control" name="fname"/>
                            <br>
                            <label>Last Name</label>
                            <input type="name" class="form-control" name="lname"/>
                            <br>
                            <label>Address</label>
                            <input type="address" class="form-control" name="addr" required/>
                            <br>
                            <label for="name"></label>
                            <input type="address" class="form-control" placeholder="Apt #, Suite, Floor (optional)" name="addr"/>
                            <br>
                            <label>City</label>
                            <input type="city" class="form-control" name="city" required/>
                            <br>
                            <label>State</label>
                            <input type="state" class="form-control" name="state" required/>
                            <br>
                            <label>Zip Code</label>
                            <input type="zip" class="form-control" name="zip" required/>
                            <br>
                        </div>
			<div class="col-sm-3">
			</div>
			<div class="form-group col-sm-3">
			<h3 style="font-size:1.8vw;">Order Summary</h3>
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
                                <button type="submit" class="btn btn-primary btn-block">CONTINUE TO PAYMENT</button>
			</div>
			<br>
			<br>
			<br>
			
                   </form>
		</div>	
        </div>
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
                                <img src="http://localhost:8080/GoodSportProject/Media/basketball-court.png" title="basketball" class="img-thumbnail" style=" background-color: transparent; border: 0;" alt="Baseball" width="80" height="80" ></a>
                                <img src="http://localhost:8080/GoodSportProject/Media/baseball.png" title="baseball" class="img-thumbnail" style=" background-color: transparent; border: 0;" alt="Baseball" width="70" height="70" ></a>
                                <img src="http://localhost:8080/GoodSportProject/Media/american-football.png" title="football" class="img-thumbnail" style=" background-color: transparent; border: 0;" alt="Baseball" width="70" height="70" ></a>
                                <img src="http://localhost:8080/GoodSportProject/Media/football.png" title="soccer" class="img-thumbnail" style=" background-color: transparent; border: 0;" alt="Baseball" width="70" height="70" ></a>
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
        <script
            
    </body>
</html>



