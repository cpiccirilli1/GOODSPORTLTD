<%-- 
    Document   : orderConfirmation
    Created on : Mar 7, 2020, 3:48:57 PM
    Author     : rikam
--%>

<%@page import="BusinessObjects.payments"%>
<%@page import="BusinessObjects.Item"%>
<%@page import="BusinessObjects.Customer"%>
<%@page import="BusinessObjects.ItemList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="BusinessObjects.ItemList"%>
<%@page import="BusinessObjects.CustOrder"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="http://localhost:8080/GoodSportProject/CSS/purchaseCSS.css">
        <title>Order Complete!</title>
    </head>
    <body style="background-color: #f2f2f2;">
        <script>
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;
            }
        </script>
        
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
            <%
                try {
                    c1 = (Customer)session.getAttribute("c1");
                    c1.getCustId();
                } catch (Exception e) {
                    c1 = new Customer();
                    c1.Customer("", "", "", "", " , , , , ", "", "", "");
                }
                CustOrder cust1 = (CustOrder)session.getAttribute("cust1");
                payments p1 = (payments)session.getAttribute("p1");
                
            %>
       <main>
        <div id="printableArea" class="container">
            <div class="text-center">
                <h3 style="font-size:2.5vw; font-family: 'Arial Black', Gadget, sans-serif;">Thank you for your order!</h3>
                <hr class="style1" style="border: 1px solid #999999;">
                <br>
            </div>
            <div class="row">
                <div class="col-sm-5" style="border-collapse: collapse; background-color: #ffffff; border: 1px solid #999999;">
                    <div class="col-sm-7">
                        <h3 style="font-family: 'Arial Black', Gadget, sans-serif;">Order Details:</h3>
                        <hr class="style1" style="border: 1px solid #999999;">
                        <p>We are currently processing your order. You will receive and email when we have shipped your order.</p>
                        <p>It is recommended that you save your order confirmation. You can print this page by pressing the button below.</p>
                        <button class="btn btn-block btn-primary" onclick="printDiv('printableArea')">Print this page</button>
                        <br>
                        <b>Payment Number: <%=p1.getPayId()%></b>
                        <br>
                        <b>Order number: <%=cust1.getOrderId()%></b>
                        <br>
                        <h3 style="font-family: 'Arial Black', Gadget, sans-serif;">Delivery Details:</h3>
                        <hr class="style2" style="border: 1px solid #999999;">
                        <h4><strong>Delivery for:</strong></h4>
                        <%cust1.getFname();%> <%cust1.getLname();%>
                        <%out.println(cust1.getFname());%> <%out.println(cust1.getLname());%>
                        <br>
                        <h4><strong>Delivering To:</strong></h4>
                        <%out.println(cust1.getAddress());%>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
                <div class="col-sm-1">
                </div>
			<div class="form-group col-sm-6" style="background-color:#ffffff; box-shadow:0 0 10px rgba(0,0,0,.15); border-collapse: collapse; border-radius: 25px; border: 1px solid #999999;">
			<h3 style="font-size:1.8vw; text-align: center; font-family: 'Arial Black', Gadget, sans-serif; text-align: center">Order Summary</h3>
                        <hr class="style1" style="border: 1px solid #999999;">
			 <%
                            double shipping = 0.0;
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
                            session.removeAttribute("cart");
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
				<div class="form-group col-sm-4">
                                    <div class="product-grid8">
                                    <div class="itemimg itemimg-scaledown">
                                    <div class="panel-body"><img src="<%=i1.getimgLink()%>" style="width:120px; height: 120px; box-shadow:0 0 10px rgba(0,0,0,.15); border:1px solid #e4e9ef; transition:all .3s ease 0s" alt="Image"></div>
                                    </div>
				    </div>
                                </div>
				<div class="form-group col-sm-5">
                                    <h3 style="font-size:1.2vw; font-weight: bold; font-family: Verdana, Geneva, sans-serif;" ><a href="http://localhost:8080/GoodSportProject/ItemDisplayServlet?id=<%=id%>"><%=name%></a></h3>
                                    <h4>Quantity : <%=quantities[i]%></h4>
                                    <h4 style="color: red">$<%=price%></h4>
				</div>
                            </div>
                        <%
                                }
                            }
                        %>
			 <h3 style="font-size:1vw;">Order Subtotal: $<%=df.format(cost)%></h3>
                            <h3 style="font-size:1vw;">Shipping: $<%=df.format(shipping)%></h3>
                            <h3 style="font-size:1vw;">Tax: $<%=df.format(cost*0.06)%></h3>
                            <h3 style="font-size:1.5vw; font-weight: bold;">Order Total: <span style="color: red">$<%=df.format(cost + (cost*0.06) + shipping)%></span></h3>
				<br>
                                <br>
                                <br>
			</div>
            </div>
            <br>
            <br>
        </div>
       </main>
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
