<%-- 
    Document   : employeeFaq
    Created on : Apr 22, 2020, 3:19:42 PM
    Author     : natha
--%>

<%@page import="BusinessObjects.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/empstylesheet.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Employee FAQ</title>

    </head>
    <body>
         <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand"><b>GoodSport</b></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/empPortal.jsp">Order Fulfillment</a></li>
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/empinventory.jsp">Check Inventory</a></li>
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/empReorder.jsp">Reorder Products</a></li>
                    <li class="active"><a href="http://localhost:8080/GoodSportProject/Pages/employeeFaq.jsp">FAQ</a></li>
                </ul>
                  <ul class="nav navbar-nav navbar-right">
                      <% Employee e1 = new Employee();
                          e1 = (Employee)session.getAttribute("e1");
            String efname = e1.getFName();
            String elname = e1.getLName();
            %>
            <p class="navbar-text">Logged in as: <%=efname%> <%=elname%></p>
                      <li><a href="http://localhost:8080/GoodSportProject/LogoutServlet">Logout</a></li>
    </ul>
            </div>
        </nav>
            <div class="container">
        <h2 style="text-align:center"><b>Frequently Asked Questions</b></h2>
        <br>
        <ul class="list-unstyled">
            <li><h3>How do I fulfill a customer order?</h3>
      <ul>
        <li>Check the OrderID of the order that you want to fulfill and ship. Type the OrderID into the box and click Submit order. Once you do, the fulfilled order should show up in the Complete Orders tab.</li>
        <li><i>The servlet for the order fulfillment is responsible for changing the OrderStatus from "Open" to "Shipped".</i>
      </ul>
    </li>
     <li><h3>How do I reorder items that needs a restock?</h3>
      <ul>
        <li>Over in the Reorder Products tab, note the Product ID and determine the quantity needed in the text boxes. Press Submit order when done, and it should redirect you to the Inventory page to reflect the quantity update.</li>
        <li><i>The servlet for the reordering of products is responsible for listing the history of the request, as well as updating the quantity in the inventory.</i>
      </ul>
    </li>
          <li><h3>How do I update the products in the inventory?</h3>
      <ul>
        <li>If you need to update the item name, description, category, sport, or price, click on the link under Inventory and follow the form.</li>
        <li>First, type in the Product ID and click Find, it will automatically fill in the rest of the information so you can update the item. Click Update when you are done.</li>
        <li><i>The servlet for the update of products in the inventory is responsible for updating a part or whole listing of each product.</i>
      </ul>
    </li>
</div>
          </div>  
</body>
</html>

