<%-- 
    Document   : empReorder
    Created on : Feb 10, 2020, 2:10:41 PM
    Author     : natha
--%>

<%@page import="BusinessObjects.EmpOrderList"%>
<%@page import="BusinessObjects.EmpOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="../CSS/empstylesheet.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Employee Portal</title>

    </head>
    <% EmpOrderList restock = new EmpOrderList();
    restock.findAllItems();
    %>
    
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">GoodSports</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="empPortal.jsp">Order Fulfillment</a></li>
                    <li><a href="empinventory.jsp">Check Inventory</a></li>
                    <li><a href="empReorder.jsp">Reorder Products</a></li>
                </ul>
            </div>
        </nav>
        <div class="mx-auto" style="width: 90%;">
            <h1>Inventory Reorder</h1>
            <br/>
            <div class="well">
                Refer to the ProductID that requires a restock with the desired quantity.
                
                <form method="post" action="http://localhost:8080/GoodSportProject/EmpOrderServlet">
                    <div class="form-group">
                        <label for="productID">ProductID:</label>
                        <input type="productNo" class="form-control" name="productID">
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity needed:</label>
                        <input type="count" class="form-control" name="quantity">
                    </div>

                    <button type="submit" class="btn btn-default">Submit order</button>
                </form> 
                
            </div>
            
             <h1>Reorder History</h1>
        <table class="table table-striped">
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
