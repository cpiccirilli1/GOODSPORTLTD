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
    <body style="background-color: #f2f2f2">
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
        <%
            Customer c1 = new Customer();
            try {
                c1 = (Customer)session.getAttribute("c1");
                c1.getCustId();
            } catch (Exception e) {
                c1 = new Customer();
                c1.Customer("", "", "", "", " , , , , ", "", "", "");
            }
            String[] addr = c1.getAddr().split(",");
            %>
        <div class="container">
		<h2 style="font-size:2.5vw; text-align: center; font-family: 'Arial Black', Gadget, sans-serif;">Getting Your Order</h2>
		<hr class="style1" style="border: 1px solid #999999;">
                <br>
		<div class="row">
                    <form onsubmit="return validate()" action="http://localhost:8080/GoodSportProject/CustOrderServlet" method="Post" >
                        <div class="form-group col-sm-5" style="border-collapse: collapse; background-color: #ffffff; border: 1px solid #999999;" >
                            <h3 style="font-size:1.5vw; text-align: center; font-family: 'Arial Black', Gadget, sans-serif;">Shipping Information</h3>
                            <br>
                            <label>First Name</label>
                            <input type="name" class="form-control" name="fname" value="<%=c1.getFName()%>"/>
                            <br>
                            <label>Last Name</label>
                            <input type="name" class="form-control" name="lname" value="<%=c1.getLName()%>"/>
                            <br>
                            <label>Address</label>
                            <input type="address" class="form-control" name="addr" value="<%=addr[0]%>" required/>
                            <br>
                            <label for="name">Apt #, Suite, Floor (optional)</label>
                            <input type="address" class="form-control" name="addr" value="<%=addr[1]%>"/>
                            <br>
                            <label>City</label>
                            <input type="city" class="form-control" name="city" value="<%=addr[2]%>" required/>
                            <br>
                            <label>State</label>
                            <input type="state" class="form-control" name="state" value="<%=addr[3]%>" required/>
                            <br>
                            <label>Zip Code</label>
                            <input type="zip" class="form-control" name="zip" value="<%=addr[4]%>" required/>
                            <br>
                            <hr class="style2">               
                            <h3 style="font-size:1.5vw; text-align: center; font-family: 'Arial Black', Gadget, sans-serif;">Contact Information</h3>
                            <br>
                            <label for="email">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%=c1.getEmail()%>" required/>
                            <br>
                            <label for="phone">Phone Number</label>
                            <input type="phone" class="form-control" id="phone" name="phone" value="<%=c1.getPhone()%>" required/>
                            <br>
                            <hr class="style2">
                            <h3 style="font-size:1.4vw; text-align: center; font-family: 'Arial Black', Gadget, sans-serif;">Billing Address</h3>
                            <br>
                            <label>First Name</label>
                            <input type="name" class="form-control" name="fname2" value="<%=c1.getFName()%>"/>
                            <br>
                            <label>Last Name</label>
                            <input type="name" class="form-control" name="lname2" value="<%=c1.getLName()%>"/>
                            <br>
                            <label>Address</label>
                            <input type="address" class="form-control" name="addr2" value="<%=addr[0]%>" required/>
                            <br>
                            <label for="name">Apt #, Suite, Floor (optional)</label>
                            <input type="address" class="form-control" name="addr2" value="<%=addr[1]%>"/>
                            <br>
                            <label>City</label>
                            <input type="city" class="form-control" name="city2" value="<%=addr[2]%>" required/>
                            <br>
                            <label>State</label>
                            <input type="state" class="form-control" name="state2" value="<%=addr[3]%>" required/>
                            <br>
                            <label>Zip Code</label>
                            <input type="zip" class="form-control" name="zip2" value="<%=addr[4]%>" required/>
                            <br>
                        </div>
			<div class="col-sm-1">
			</div>
			<div class="form-group col-sm-6" style="background-color:#ffffff; border-collapse: collapse; border-radius: 25px; border: 1px solid #999999;">
			<h3 style="font-size:1.8vw; text-align: center; font-family: 'Arial Black', Gadget, sans-serif; text-align: center">Order Summary</h3>
                        <hr class="style1" style="border: 1px solid #999999;">
			 <%
                            ItemList cart = new ItemList();
                            DecimalFormat df = new DecimalFormat("#,###.##");
                            try {
                                cart = (ItemList)session.getAttribute("cart");
                                cart.getArray();
                            } catch (NullPointerException npe) {
                                cart = new ItemList();
                                try
                                {
                                    c1 = (Customer)session.getAttribute("c1");
                                    cart.populateCart(c1.getCart().split(","));
                                } catch (NullPointerException e)
                                {

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
                            <h3 style="font-size:1.5vw; font-weight: bold;">Estimated Order Total: $<%=df.format(cost + (cost*0.06) + 10)%></h3>
				<br>
				<br>
                                <button type="submit" class="btn btn-primary btn-block">CONTINUE TO PAYMENT</button>
                                <br>
                                <br>
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



