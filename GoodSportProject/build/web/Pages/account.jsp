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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Good Sport</title>
        <link href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" rel="stylesheet">
    </head>
    <body>
        <nav class="">
            <div class="container-fluid navbar-custom">
                <div class="navbar-header">
                    <div class="logo_wrapper">
                        <a href="http://localhost:8080/GoodSportProject/index.jsp"><img class="logo" src="http://localhost:8080/GoodSportProject/Media/Logo.png"/></a>
                    </div>
                </div>
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Page 1-1</a></li>
                            <li><a href="#">Page 1-2</a></li>
                            <li><a href="#">Page 1-3</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" action="http://localhost:8080/GoodSportProject/Servlets/Search.java">
                    <div class="form-group search-bar-wrapper">
                        <input type="text" class="search-bar" placeholder="Search" name="search">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/SignIn.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
                     <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
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
    </body>
    <footer>
        <ul style="list-style: none;"> 
            
            <li style="display:inline;"><a href ="http://localhost:8080/GoodSportProject/Pages/account.jsp">My Account</a>  </li>

            <li style="display:inline;"><a href ="http://localhost:8080/GoodSportProject/Pages/SignIn.jsp">Sign In</a>  </li>

            <li style="display:inline;"><a href ="http://localhost:8080/GoodSportProject/Pages/ItemGrid.jsp">Item Grid</a>  </li>

            <li style="display:inline;"><a href ="http://localhost:8080/GoodSportProject/index.jsp">Home</a>  </li>

            <li style="display:inline;"><a href ="http://localhost:8080/GoodSportProject/Pages/ItemDisplay.jsp">Item Display</a>  </li>

            <li style="display:inline;"><a href ="">page 6 </a>  </li>
        
        </ul>

    </footer>
</html>
