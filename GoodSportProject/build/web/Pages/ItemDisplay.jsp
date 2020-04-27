<%-- 
    Document   : ItemGrid
    Created on : Feb 10, 2020, 2:55:53 PM
    Author     : cgoswic1
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BusinessObjects.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://localhost:8080/GoodSportProject/CSS/ItemDisplay.css" />
        <link rel="stylesheet" href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Item Grid</title>
        <link rel="stylesheet" href="http://localhost:8080/GoodSportProject/CSS/ItemGridCSS.css" />
    </head>
    <body>
        <%
            Item item1 = (Item)request.getSession().getAttribute("i1");
            int id = item1.getId();
            String name = item1.getProdName();
            double price = item1.getPrice();
            String desc = item1.getProdDesc();
            int quant = item1.getQuantity();
            String img = item1.getimgLink();
            String avail = "Out of stock";
            double shipping = price*0.09245;
            DecimalFormat df = new DecimalFormat("#.##");
            %>
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
        <main>
        <div class="container">
            <div class="row">
                
                <div class="col-md-6 col-sm-6">
                        <div class="product-grid8">
                            <div class="itemimg itemimg-scaledown">
                               <img src= "<%=img%>" alt="<%=name%>">
                            </div>
                        </div>
                    </div>
            <div class="col-sm-6" style="background-color: #f2f2f2; border-collapse: collapse; border-radius: 25px; border: 2px solid #999999;"><!--/product-information-->
                <form action="http://localhost:8080/GoodSportProject/CartServlet?itemNumber=<%=id%>">
                    <h2 style="font-family: Tahoma, Geneva, sans-serif; font-weight: bold; text-align: center"><%= name %></h2>
                    <hr class="style1" style="border: 1px solid #999999;">
                    <input type="hidden" value="<%= id %>" name="itemNumber">
                    <h3 style="font-size:1.4vw; font-family: Tahoma, Geneva, sans-serif; font-weight: bold;">Price: $<%= price %></h3>
                    <span class="product-shipping">Shipping: $<%=df.format(shipping)%></span>
                            <div class="row">
                            <div class="col-sm-3">
                                <label for="" style="font-family: Tahoma, Geneva, sans-serif;">In Stock: <%=quant%></label>
                                <input type="number" min="1" max="<%=quant%>" class="form-control" id="lname" name="Quantity" value="1" />
                            </div>
                            </div>
                            <%
                                if (quant > 0){
                                    avail = "In Stock";

                                %>
                                <br/><input type="Submit" value="Add to Cart"/>
                                <br>
                            <% } else{ %>
                            Out of stock!
                            <% } %>
                            <br>
                            <p style="font-family: Verdana, Geneva, sans-serif;"><b>Availability:</b> <%= avail %></p>
                </form>
                    <p style="font-family: Verdana, Geneva, sans-serif;"><b>Condition:</b> New</p>
                    <p style="font-family: Verdana, Geneva, sans-serif;"><b>Description:</b> <%=desc%></p>
                    <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                    <br>
                    <br>
            </div>
            </div>
                    <br>
            </div>
        </main><!--/product-information-->
           
        <footer>									<!-- footer begins here -->
            <div class="footer">
                    <div class="signature container">
                        <div class="row">
                            <div class="col-sm-12">
                                <h2 style="text-align: center; font-family: Impact, Charcoal, sans-serif; font-size: 50px;"><a href="index.jsp">Good Sport</a></h2>
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