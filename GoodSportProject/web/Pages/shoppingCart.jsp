<%-- 
    Document   : shoppingCart
    Created on : Feb 17, 2020, 3:35:11 PM
    Author     : rikam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="BusinessObjects.Item"%>
<%@page import="BusinessObjects.Customer"%>
<%@page import="BusinessObjects.ItemList"%>
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
        <title>Your Cart</title>
    </head>
    <body style="background-color: #f2f2f2;">
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
                            <li><a href="http://localhost:8080/GoodSportProject/SearchByCategoryServlet?sport=Baseball">Baseball</a></li>
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
        <br>
        <br>
        <div class="container">	
			<h2 style="font-size:2.5vw; font-weight: bold; text-align: center; font-family: 'Arial Black', Gadget, sans-serif;">Your Cart</h2>
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
                                Customer c1 = (Customer)session.getAttribute("c1");
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
                                    int id = i1.getId();
                                    String name = i1.getProdName();
                                    String desc = i1.getProdDesc();
                                    String cat = i1.getCategory();
                                    String sport = i1.getSport();
                                    int quantity = i1.getQuantity();
                                    double price = i1.getPrice();
                                    String img = i1.getimgLink();
                        %>
                            
                            <div class="row">
                                <div class="form-group col-sm-3">
                                </div>
				<div class="form-group col-sm-3">
                                    <div class="panel-body"><img src="<%=i1.getimgLink()%>" class="img-responsive" style="width:100%" alt="Image"></div>
				</div>
				<div class="form-group col-sm-4">
                                    <h3 style="font-size:1.2vw; font-weight: bold; font-family: Verdana, Geneva, sans-serif;" ><a href="http://localhost:8080/GoodSportProject/ItemDisplayServlet?id=<%=id%>"><%=name%></a></h3>
                                    <h4 style="color: red">$<%=price%></h4>
                                    <p><a href="http://localhost:8080/GoodSportProject/RemoveCartServlet?id=<%=i1%>" data-toggle="tooltip">Remove</a></p>
				</div>
                            </div>
                        
                        <%
                                }
                             double finalcost = cost + (cost*0.06) + 10;
                             session.setAttribute("c", finalcost);
                             
                            }
                        %>
                            <div class="row">
                                <div class="form-group col-sm-3">
                                </div>
                                <div class="form-group col-sm-5" style="background-color: #ffffff; border-collapse: collapse; border-radius: 25px; border: 1px solid #999999;">
                                    <h2 style="font-size:1.6vw; text-align: center; font-family: 'Arial Black', Gadget, sans-serif; text-align: center">Order Summary</h2>
                                    <hr class="style1" style="border: 1px solid #999999;">
                                    <h2 style="font-size:1vw;">Order Subtotal: $<%=df.format(cost)%></h2>
                                    <h2 style="font-size:1vw;">Estimated Shipping: $<%=10%></h2>
                                    <h2 style="font-size:1vw;">Estimated Tax: $<%=df.format(cost*0.06)%></h2>
                                    <h3 style="font-weight: bold;">Estimated Order Total:<span style="color: red"> $<%=df.format(cost + (cost*0.06) + 10)%></span></h3>
                                    <br>
                                    <a href="http://localhost:8080/GoodSportProject/Pages/purchase.jsp"<button type="button" class="btn btn-primary btn-block">PROCEED TO CHECKOUT</a>
                                    <br>
                                </div>
                            </div>
		</div>
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
	</body>
</html>
