<%-- 
    Document   : ItemGrid
    Created on : Feb 10, 2020, 2:55:53 PM
    Author     : cgoswic1
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="BusinessObjects.Customer"%>
<%@page import="BusinessObjects.ItemList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BusinessObjects.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Item Grid</title>
        <link rel="stylesheet" href="http://localhost:8080/GoodSportProject/CSS/ItemGridCSS.css" />
        <link href="http://localhost:8080/GoodSportProject/CSS/shoppingCartCSS.css" rel="stylesheet">
        
    </head>
    <body>
            <%
               session = request.getSession();
               ItemList il = new ItemList();
               il = (ItemList)session.getAttribute("il1");
               ArrayList<Item> iArr = (ArrayList<Item>)il.getArray();
               int iCount = iArr.size();
               int rows = (int)Math.ceil((float)iCount/3);
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
                            
       <main>
        <div class="container">   <!--product-information-->
            <h3 class="h3"></h3>
        <% for(int x=0;x<rows;x++){%>
             <div class="row">
                <%for(int x1=iCount-3;x1!=iCount;iCount--){ 
                    if(x1<0){x1=0;}
                    Item i = iArr.get(iCount-1);
                        int id = i.getId();
                        String name = i.getProdName();
                        String desc = i.getProdDesc();
                        String cat = i.getCategory();
                        String sport = i.getSport();
                        int quantity = i.getQuantity();
                        double price = i.getPrice();
                        String img = i.getimgLink();
                        double shipping = price*0.09245;
                        DecimalFormat df = new DecimalFormat("#.##");

                        
                   //     if(price > 100.00){shipping = "Free shipping on items over $100!";}
                %>
                    <div class="col-md-4 col-sm-6">
                        <div class="product-grid8">
                            <div class="product-image8">
                                <div class="itemimg itemimg-scaledown">
                                    <a href="http://localhost:8080/GoodSportProject/ItemDisplayServlet?id=<%=id%>"><img class="pic-1" style="width: 358px; height: 358px; box-shadow:0 0 10px rgba(0,0,0,.15); border:1px solid #e4e9ef; transition:all .3s ease 0s"  src="<%=img%>"></a>
                                </div>
                            </div>
                                <div class="product-content">
                                <div class="price">$<%= price%></div>
                                <span class="product-shipping">Shipping: $<%=df.format(shipping)%></span>
                                <h3 class="title"><a href="http://localhost:8080/GoodSportProject/ItemDisplayServlet?id=<%=id%>"><%=name%></a></h3>
                                <%
                                    if (quantity != 0){
                                    %>
                                <a class="all-deals" href="http://localhost:8080/GoodSportProject/CartServlet?itemNumber=<%=id%>&Quantity=<%=1%>">Add to cart <i class="fa fa-angle-right icon"></i></a>
                                <%
                                    }else {
                                    %>
                                Out of stock!
                                <%
                                    }
                                    %>
                                <br>
                            </div>
                        </div>
                    </div>
                <%}%>
             </div>
        <%}%>
             <br>
            
    
         </div>    
       </main>           <!--/product-information ends here-->
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
