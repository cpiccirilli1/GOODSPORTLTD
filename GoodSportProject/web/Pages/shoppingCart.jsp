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
        <link href="http://localhost:8080/GoodSportProject/CSS/shoppingCartCSS.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <title>Your Cart</title>
    </head>
    <body style="background-color: #f2f2f2;">
        <%
            session = request.getSession();
            String fName;
            Customer c1 = new Customer();
            if(null==session.getAttribute("c1")){
                fName = "My";
                
            }
            else{
                c1 = (Customer)session.getAttribute("c1");
                fName = c1.getFName()+"'s";
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
        <br>
        <br>
        <main>
        <div class="container">	
			<h2 style="font-size:2.5vw; font-weight: bold; text-align: center; font-family: 'Arial Black', Gadget, sans-serif;">Your Cart</h2>
                        <hr class="style1" style="border: 1px solid #999999;">
                        <%
                            double shipping= 0.0;
                            ItemList cart = new ItemList();
                            DecimalFormat df = new DecimalFormat("#,###.##");
                            boolean emptyCart = false;
                        try {
                              cart = (ItemList)session.getAttribute("cart");
                              cart.getArray();
                          } catch (NullPointerException npe) {
                              cart = new ItemList();
                                emptyCart = true;
                                
                          }
                            
                            double cost = 0;
                            if (cart.iArr.size() == 0 || emptyCart == true) {
                                %>
                                <h3>No items in cart</h3>
                                <%
                            } else {
                                String[] quantities = cart.quantities.split(",");
                                for(int i = 0; i < cart.iArr.size(); i++)
                                {
                                    Item i1 = cart.iArr.get(i);
                                    int id = i1.getId();
                                    String name = i1.getProdName();
                                    String desc = i1.getProdDesc();
                                    String cat = i1.getCategory();
                                    String sport = i1.getSport();
                                    int quantity = i1.getQuantity();
                                    double price = i1.getPrice();
                                    String img = i1.getimgLink();
                                    cost += (i1.getPrice() * Double.parseDouble(quantities[i]));
                                    shipping = cost*0.09245;
                        %>
                            
                            <div class="row">
                                <div class="form-group col-sm-3">
                                </div>
				<div class="form-group col-sm-3">
                                    <div class="product-grid8">
                                        <div class="itemimg itemimg-scaledown">
                                            <img src="<%=i1.getimgLink()%>" style="background-color: #ffffff; width:250px; height: 250px; box-shadow:0 0 10px rgba(0,0,0,.15); border:1px solid #e4e9ef; transition:all .3s ease 0s">
                                        </div>
                                    </div>
                                </div>
                                <form action="http://localhost:8080/GoodSportProject/ChangeQuantServlet?id=<%=i%>" method="post">
                                    <div class="form-group col-sm-4">
                                        <h3 style="font-size:1.2vw; font-weight: bold; font-family: Verdana, Geneva, sans-serif;" ><a href="http://localhost:8080/GoodSportProject/ItemDisplayServlet?id=<%=id%>"><%=name%></a></h3>
                                        <h4 style="color: red">$<%=price%></h4>
                                        <h4>Quantity : <input type="number" min="1" max="<%=quantity%>" id="Quantity" name="Quantity" value="<%=quantities[i]%>"><input type="Submit" value="Change"></h4>
                                        <p><a href="http://localhost:8080/GoodSportProject/RemoveCartServlet?id=<%=i%>" data-toggle="tooltip">Remove</a></p>
                                    </div>
                                </form>
                            </div>
                        <%
                                }
                             double finalcost = cost + (cost*0.06) + shipping;
                             session.setAttribute("c", finalcost);
                             
                            }
                        %>
                            <div class="row">
                                <div class="form-group col-sm-3">
                                </div>
                                <div class="form-group col-sm-5" style="background-color: #ffffff; box-shadow:0 0 10px rgba(0,0,0,.15); border-collapse: collapse; border-radius: 25px; border: 1px solid #999999;">
                                    <h2 style="font-size:1.6vw; text-align: center; font-family: 'Arial Black', Gadget, sans-serif; text-align: center">Order Summary</h2>
                                    <hr class="style1" style="border: 1px solid #999999;">
                                    <h2 style="font-size:1vw;">Order Subtotal: $<%=df.format(cost)%></h2>
                                    <h2 style="font-size:1vw;">Estimated Shipping: $<%=df.format(shipping)%></h2>
                                    <h2 style="font-size:1vw;">Estimated Tax: $<%=df.format(cost*0.06)%></h2>
                                    <h3 style="font-weight: bold;">Estimated Order Total:<span style="color: red"> $<%=df.format(cost + (cost*0.06) + shipping)%></span></h3>
                                    <br>
                                    <a href="http://localhost:8080/GoodSportProject/Pages/purchase.jsp"><button class="btn btn-primary btn-block"<% if (cart.iArr.size() == 0) {%>disabled<%}%>>PROCEED TO CHECKOUT</button></a>
                                    <br>
                                </div>
                            </div>
		</div>
        </main>
                
                <footer>									<!-- footer begins here -->
                    <div class="footer">
                        <div class="signature container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h2 style="text-align: center; font-family: Impact, Charcoal, sans-serif; font-size: 50px;"><a href="http://localhost:8080/GoodSportProject/index.jsp">Good Sport</a></h2>
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
