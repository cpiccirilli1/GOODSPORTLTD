<%-- 
    Document   : index
    Created on : Feb 10, 2020, 2:22:08 PM
    Author     : cgoswic1
--%>
<%@page import="BusinessObjects.ItemList"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Good Sport</title>
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
        
        <h1>Search Results</h1>
  
        <%
            ItemList il = (ItemList)request.getSession().getAttribute("arr");
            ArrayList<Item> iArr = il.getArray();
            int count = il.getCount();
            int rows = count / 3;
            int remainder = count % 3; 
            %>
        <table align="center">
        <%
            for(int i = 0; i < )
            for(Item i: iArr){
        %>
        <tr>
        <table align="center" border="1">
        <tr>
            <td>
                <h2><%= i.getProdName() %></h2>
            </td>
            
        </tr>
        <tr>
            <td>
                <%= i.getSport() %>
            </td>
            
        </tr>
        <tr>
            <td>
                <%= i.getPrice() %>
            </td>
            
        </tr>
        </table>
        </tr>
        <% } %>
        </table>
        
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
