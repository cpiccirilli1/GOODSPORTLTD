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
        <link href="http://localhost:8080/GoodSportProject/CSS/FrameCSS.css" rel="stylesheet">
        <link href="http://localhost:8080/GoodSportProject/CSS/accountCSS.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">     
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Good Sport</title>
    </head>
    <body>
        <%
            session = request.getSession();
            Customer c1 = (Customer)session.getAttribute("c1");
            String fName;
            if(null==session.getAttribute("c1")){
                fName = "My";
                
            }
            else{
                fName = c1.getFName()+"'s";
            }
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
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/SignIn.jsp"><span class="glyphicon glyphicon-user"></span> <%=fName%>Account</a></li>
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
        
       <div class="container">  
        <div class="row">
         <div class="col-sm-3"></div>  
        <div class="col-sm-6">
        <h1 style="font-size:2vw;" class="center">Customer Account</h1>
        <table class="table">
            <tr>
                <td style="font-weight: bold;">Name: </td><td><%= name %></td>
            <tr>
                <td style="font-weight: bold;">Email:</td><td><%= email %></td>
            </tr>
            <tr>
                <td style="font-weight: bold;">Phone Number:</td><td><%= phone %></td>
            </tr>
            <tr>
                <td style="font-weight: bold;">Address:</td><td><%= addr1 %>
                    <% 
                        if (addr2!=null){
                            %>
                            <br/><%= addr2 %> <br/> 
                       <%     
                        }
                    %>
                    <%= city+", "+state+" "+ zip %>
                
                </td>
            </tr>
            
            <tr>
                <td><a href="http://localhost:8080/GoodSportProject/Pages/accountedit.jsp">(edit)</a></td>
                <td><a href="http://localhost:8080/GoodSportProject/LogoutServlet">Logout</a></td>
            </tr>
        </table>
        </div>
        </div>
       </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
        <% } %>
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
