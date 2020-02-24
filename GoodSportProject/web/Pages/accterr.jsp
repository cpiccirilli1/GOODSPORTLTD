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
        <link href="../CSS/FrameCSS.css" rel="stylesheet">
    </head>
    <body>
        <%
            Customer cust = (Customer)request.getSession().getAttribute("ses1");
            String pass = cust.getPassword();
            String fname = cust.getFName();
            String lname = cust.getLName();
            String address = cust.getAddr();
            String email = cust.getEmail();
            String phone = cust.getPhone();
            
            String[] addressln = address.split(",");
            
            String add1 = addressln[0];
            String add2 = addressln[1];
            String city = addressln[2];
            String state = addressln[3];
            String zip = addressln[4];
            
            
            %>
        
        
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../index.jsp">Good Sport!</a>
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
                <form class="navbar-form navbar-left" action="/action_page.php">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
                     <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                </ul>
            </div>
        </nav>
        <h1 class="center">Customer Account</h1>
        
        <h2 class="center">An error occurred. Please Try again and make sure all fields are filled out.</h2>
        
        <table class="center" border="0">
            <tr>
                <td colspan="2"><image src="index.png" /></td>
            </tr>
            <tr>
                <td>Name/Company: </td><td><%= fname + " " + lname %></td>
            </tr>
          
            <tr>
                <td>Email:</td><td><%= email %></td>
            </tr>
            <tr>
                <td>Phone Number:</td><td><%= phone %></td>
            </tr>
            <tr>
                <td>Address:</td><td><%= add1 %><br />
                        <%
                            if(!add2.equals("")){ %>
                                <%= add2 %><br />
                        <%}                 %>
                        <%= city +", " + state + " "+ zip %>
                        
                        </td>
            </tr>
          
                <td><a href="accountedit.jsp">(edit)</a></td
            </tr>
        </table>

    </body>
    <footer>
        <ul style="list-style: none;"> 
            
            <li style="display:inline;"><a href ="account.jsp">My Account</a>  </li>

            <li style="display:inline;"><a href ="SignIn.jsp">Sign In</a>  </li>

            <li style="display:inline;"><a href ="ItemGrid.jsp">Item Grid</a>  </li>

            <li style="display:inline;"><a href ="../index.jsp">Home</a>  </li>

            <li style="display:inline;"><a href ="ItemDisplay.jsp">Item Display</a>  </li>

            <li style="display:inline;"><a href ="">page 6 </a>  </li>
        
        </ul>

    </footer>
</html>
