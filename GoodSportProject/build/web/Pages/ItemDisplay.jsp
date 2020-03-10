<%-- 
    Document   : ItemGrid
    Created on : Feb 10, 2020, 2:55:53 PM
    Author     : cgoswic1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BusinessObjects.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Item Grid</title>
        <link rel="stylesheet" href="http://localhost:8080/GoodSportProject/CSS/ItemGridCSS.css" />
        <link rel="stylesheet" href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" />
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
            %>
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
        <br>
        <img src= "<%=img%>" alt="testpic" height="160" width="240" id = "floatright"/>
        <div class="container" >
            <div class=""><!--/product-information-->
                <form>
                    <h2><%= name %></h2>
                    <input type="hidden" value="<%= id %>" name="itemNumber">
                    <p>Prod id: <%= id %></p>
                            <p>Price: <%= price %></p>
                            <label for="lname"> Quantity: <%= quant %></label>
                            <input type="text" id="lname" name="Quantity" value="1" />

                            <%
                                if (quant > 0){
                                    avail = "In Stock";

                                %>
                                <br/><a href="http://localhost:8080/GoodSportProject/CartServlet?itemNumber=<%=id%>">Add to Cart</a>
                            <% } else{ %>
                            Out of stock!
                            <% } %>
                    <p><b>Availability:</b> <%= avail %></p>
                </form>
                    <p><b>Condition:</b> New</p>
                    <p><b>Description:</b> <%=desc%></p>
                    <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
            </div><!--/product-information-->
        </div>
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