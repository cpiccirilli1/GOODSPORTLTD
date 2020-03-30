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
            <h2 style="font-size:2.5vw;">Getting Your Order Ready</h2>
            <hr class="style2">
            <h3 style="font-size:2vw;">Shipping Information</h3>
            <div class="row">
                <form action="http://localhost:8080/GoodSportProject/CustOrderServlet" method="post" novalidate="novalidate" class="needs-validation">
                    <div class="form-group col-sm-4">
                        <label for="name">First Name</label>
                        <input type="name" class="form-control" id="fname" name="fname">
                        <br>
                        <label for="name">Last Name</label>
                        <input type="name" class="form-control" id="lname" name="lname">
                        <br>
                        <label for="name">Address</label>
                        <input type="address" class="form-control" id="addr" name="addr">
                        <br>
                        <label for="name"></label>
                        <input type="address" class="form-control" placeholder="Apt #, Suite, Floor (optional)" id="addr" name="addr">
                        <br>
                        <label for="state">State</label>
                        <input type="state" class="form-control" id="state" name="state">
                        <br>
                        <label for="zip">Zip Code</label>
                        <input type="zip" class="form-control" id="zip" name="zip">
                        <br>
                        <br>
                        <h2>Contact Info</h2>
                          <label for="email">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email">
                        <br>
                        <label for="phone">Phone Number</label>
                        <input type="phone" class="form-control" id="phone" name="phone">
                        <hr>
                        
                        
                        <script type="text/javascript" >  
    
     function disableMyText(){  
          if(document.getElementById("checkMe").checked ==== true){  
              document.getElementById("myText").disabled = true;  
          }else{
            document.getElementById("myText").disabled = false;
          }  
     }  
     </script> 
                        <h2>Billing Info</h2>
                        <label>Same as shipping address</label>
                        <input type="checkbox" id="checkMe" name="checkMe" onclick="disableMyText()">
                        <hr>
                        <label for="name">First Name</label>
                        <input type="name" class="form-control" id="myText" name="firstname2">
                        <br>
                        <label for="lastname">Last Name</label>
                        <input type="name" class="form-control" id="myText" name="lastname2">
                        <br>
                        <label for="address">Address</label>
                        <input type="address" class="form-control" id="myText" name="addr2">
                        <br>
                        <label for="address"></label>
                        <input type="address" class="form-control" placeholder="Apt #, Suite, Floor (optional)" id="myText" name="addr2">
                        <br>
                        <label for="state">State</label>
                        <input type="state" class="form-control" id="myText" name="state2">
                        <br>
                        <label for="zip">Zip Code</label>
                        <input type="zip" class="form-control" id="myText" name="zip2">
                        <br>
                    </div>
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-3">
                    </div>
                    <div class="form-group col-sm-3">
                        <h3 style="font-size:1.8vw;">Order Summary</h3>
                        <%
                            ItemList cart = new ItemList();
                            DecimalFormat df = new DecimalFormat("#,###.##");
                            try {
                                Customer c1 = (Customer) session.getAttribute("c1");
                                cart.populateCart(c1.getCart().split(","));
                            } catch (NullPointerException e) {
                                try {
                                    cart = (ItemList) session.getAttribute("cart");
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

                            for (int i = 0; i < cart.iArr.size(); i++) {
                                Item i1 = cart.iArr.get(i);
                                cost += i1.getPrice();
                        %>

                        <div class="row">
                            <br>
                        <br>
                        <br>
                        <br>
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
                        <h3 style="font-size:1vw;">Estimated Tax: $<%=df.format(cost * 0.06)%></h3>
                        <h3 style="font-size:1.5vw;">Estimated Order Total: $<%=df.format(cost + (cost * 0.06) + 10)%></h3>
                        <br>
                        <br>
                        <button type="submit" class="btn btn-primary btn-block">CONTINUE TO PAYMENT</button>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="form-group col-sm-1">
                        <div class="form-group">
                            <label for="sel1">Qty</label>
                            <select class="form-control" id="sel1" name="sellist1">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </div>
                        <p><a href="#" data-toggle="tooltip">Remove</a></p>
                    </div>
                </form>
            </div>
        </div>
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



