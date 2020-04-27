<%-- 
    Document   : empReorder
    Created on : Feb 10, 2020, 2:10:41 PM
    Author     : natha
--%>

<%@page import="BusinessObjects.Employee"%>
<%@page import="BusinessObjects.EmpOrderList"%>
<%@page import="BusinessObjects.EmpOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="/CSS/empstylesheet.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Employee Portal</title>

    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><b>GoodSport</b></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/empPortal.jsp">Order Fulfillment</a></li>
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/empinventory.jsp">Check Inventory</a></li>
                    <li class="active"><a href=http://localhost:8080/GoodSportProject/Pages/empReorder.jsp">Reorder Products</a></li>
                     <li><a href="http://localhost:8080/GoodSportProject/Pages/employeeFaq.jsp">FAQ</a></li>
                </ul>
                       <ul class="nav navbar-nav navbar-right">
                              <% Employee e1 = new Employee();
                          e1 = (Employee)session.getAttribute("e1");
            String efname = e1.getFName();
            String elname = e1.getLName();
            %>
            <p class="navbar-text" class="active">Logged in as: <%=efname%> <%=elname%></p>
                      <li><a href="http://localhost:8080/GoodSportProject/LogoutServlet">Logout</a></li>
    </ul></div>
        </nav>
            <div class="container">
                <h2><b>Inventory Reorder</b></h2>
                <br>
            <div class="well">
                Refer to the ProductID that requires a restock with the desired quantity.
                <br>
                <br>
                <form method="post" action="http://localhost:8080/GoodSportProject/EmpOrderServlet">
                    <div class="form-group">
                        <label for="productID">ProductID:</label>
                        <input type="productNo" class="form-control" name="productID">
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity needed:</label>
                        <input type="count" class="form-control" name="quantity">
                    </div>

                    <button type="submit" name="action" value="addtoOrderList" class="btn btn-default">Submit order</button>

                </form> 
                
            </div>
            <br>
             <h2><b>Inventory Reorder History</b></h2>
        <table class="table table-striped">
            <% EmpOrderList restock = new EmpOrderList();
    restock.findAllItems();
    %>
            <thead>
                <tr>
                    <th scope="col">EmpOrderID</th>
                    <th scope="col">ProductID</th>
                    <th scope="col">Quantity needed</th>
                </tr>
            </thead>
            <tbody>
                <% for(int i = 0; i < restock.iArr.size(); i++)
                {
                    EmpOrder eOrder = new EmpOrder();
                    eOrder = restock.iArr.get(i);
                %>
                <tr>
                    <td><%=eOrder.getOrderID()%></td>
                    <td><%=eOrder.getProductID()%></td>
                    <td><%=eOrder.getQuantity()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        </div>
    </body>
</html>
