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
        <link href="CSSTest.css" rel="stylesheet">
    </head>
    <body>
        
        <%
            Customer cust = (Customer)request.getSession().getAttribute("sess1");
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
                    <a class="navbar-brand" href="index.jsp">Good Sport!</a>
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
        <h1 class="center">Update Customer Account</h1>
        <form method="post" action="#">
        <table class="center" border="0">
            <tr>
                <td colspan="2"><center><image src="index.png" /></center></td>
            </tr>
            <tr>
                <td>Update Avatar:</td>
                <td colspan="2"><input type="file"
                id="avatar" name="avatar"
                accept="image/png, image/jpeg"></td>
            </tr>
            <tr>
                <td>First Name</td><td><input type="text" name="firstname" value="<%= fname %>"></td>
            </tr>
            <tr>
                <td>Last Name: </td><td><input type="text" name="lastname" value="<%= lname %>"></td>
            </tr>
            <tr>
                <td>Email:</td><td><input type="text" name="email" value="<%= email %>"></td>
            </tr>
            <tr>
                <td>Phone Number:</td><td><input type="text" name="phonenum" value="<%= phone %>"></td>
            </tr>
            <tr>
                <td>Address:</td><td><input type="text" name="address1" value="<%= add1 %>"></td>
            </tr>
            
            <tr>
                <td>Address cont:</td><td><input type="text" name="address2" value="<%= add2 %>"></td>
            </tr>
            <tr>
                
                <td>City</td><td><input type="text" name="city" value="<%= city %>"></td>
                
            </tr>            
            <tr>
                <td>State</td><td><input type="text" name="state" value="<%= state %>"></td>
            </tr>
            <tr>
                <td>Zip Code:</td><td><input type="text" name="zip" value="<%= zip %>"></td>
            </tr>
            <tr>
                <td>Password Update:</td><td><input type="text" name="password" value="<%= pass %>"></td>
            </tr>
            
            <tr>
                <td></td><td><input type="submit" name="submit-btn">"></td>
        </table>
        </form>
        

    </body>
    <footer>
        <ul style="list-style: none;"> 
            
        <li style="display:inline;"><a href ="">page 1 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 2 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 3 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 4 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 5 </a>  </li>
        
        <li style="display:inline;"><a href ="">page 6 </a>  </li>
        
        </ul>

    </footer>
</html>
