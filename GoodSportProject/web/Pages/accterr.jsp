<%-- 
    Document   : index
    Created on : Jan 27, 2020, 3:31:36 PM
    Author     : mitho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BusinessObjects.*" %>
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
            if (null == session.getAttribute("c1")){
            %>
            <h2>Please Login to view your account.</h2>
            
            <%
            } else{
                Customer c1 = (Customer)request.getSession().getAttribute("c1");
                String name = c1.getFName()+c1.getLName();
                String email = c1.getEmail();
                String phone = c1.getPhone();
                String address = c1.getAddr();
                
                String[] addr = address.split(",");
                String addr1 = addr[0];
                String addr2 = addr[1];
                String city = addr[2];
                String state = addr[3];
                String zip = addr[4];

                
                
            %>
        
            
        <h1 class="center">Customer Account</h1>
        
        <h2 class="center">UPDATE ERROR! Make sure all fields are filled appropriately. (exception is address line 2)</h2>
        
        
        <table class="center" border="0">
            
            <tr>
                <td>Name: </td><td><%= name %></td>
            <tr>
                <td>Email:</td><td><%= email %></td>
            </tr>
            <tr>
                <td>Phone Number:</td><td><%= phone %></td>
            </tr>
            <tr>
                <td>Address:</td><td><%= addr1 %><br/>
                    <% 
                        if (addr2==null){
                            %>
                            <%= city+", "+state+" "+ zip %>
                            
                       <%     
                        }else{
                    %>
                    <%= addr2 %><br/>
                    <%= city+", "+state+" "+ zip %>
                    <% } %>
                
                </td>
            </tr>
            
            <tr>
          
                <td><a href="Pages/accountedit.jsp">(edit)</a></td
            </tr>
        </table>
        <% } %>
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
