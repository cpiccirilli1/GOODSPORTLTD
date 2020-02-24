<%-- 
    Document   : empReorder
    Created on : Feb 10, 2020, 2:10:41 PM
    Author     : natha
--%>

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
                
                <form action="http://localhost:8080/GoodSportProject/Servlets/Search.java">
                    <div class="form-group">
                        <label for="productID">ProductID:</label>
                        <input type="productNo" class="form-control" id="productID">
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity needed:</label>
                        <input type="count" class="form-control" id="quantity">
                    </div>

                    <button type="submit" class="btn btn-default">Submit order</button>
                </form> 
                
            </div>
            
             <h1>Order Fulfillment</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ProductID</th>
                    <th scope="col">Quantity needed</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Street</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Email</th>
                    <th scope="col">Payment Complete?</th>
                    <th scope="col">Order Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    
                </tr>
                
            </tbody>
        </table>
        </div>
    </body>
</html>
