<%-- 
    Document   : index
    Created on : Jan 27, 2020, 3:31:36 PM
    Author     : mitho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BusinessObjects.*" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
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
            DecimalFormat df = new DecimalFormat("#,###.##");
            session = request.getSession();
            String fName;
            Customer c1 = new Customer();
            c1 = (Customer)session.getAttribute("c1");
            payments p0 = new payments();
            try{
            p0 = (payments)session.getAttribute("payArr");
            }catch(Exception e){}
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
            if (null == session.getAttribute("c1")){
            %>
            <h2>Please Login to view your account.</h2>
            
            <%
            } else{
                String name = c1.getFName()+ " " + c1.getLName();
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
       <main>
       <div class="container">  
        <div class="row">
         <div class="col-sm-2"></div>  
        <div class="col-sm-7">
        <h1 style="font-size:2vw; font-weight: bold;" class="center">Customer Account</h1>
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
                <td><a href="http://localhost:8080/GoodSportProject/LogoutServlet">Logout</td>
            </tr>
        </table>
            <br/><br/>
           <h1 style="font-size:2vw; font-weight: bold;" class="center">Purchase History</h1>
           <span class="center">Most Recent is first: </span>
           <table class="table">
               <tr>
                   <th>Order Information: </th>
               <th>Delivered to:</th><th>Amount:</th>
               </tr>
               <%
                   try{
                   int count = 1;
                   ArrayList<payments> payARR = p0.reverseArrayList();
                   for(payments i : payARR){
                   %>
               <tr>
                   <td>Order ID: <%=i.getOrderID()%><br/>
                   Payment ID: <%=i.getPayId()%></td>
                   <td><%= addr1 %>
           <% 
               if (addr2!=null){
                   %>
                   <br/><%= addr2 %> <br/> 
              <%     
               }
           %>
           <%= city+", "+state+" "+ zip %>
                   </td>
                   <td>
                       $<%=df.format(i.getCurrency())%> 
                       <% count += 1; %>
                   </td>

               </tr>
               <% }}catch(Exception e){System.out.println(e);} %>
           </table>
        </div>
        </div>
       </div>
       </main>
        <% } %>
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
