<%-- 
    Document   : empinventory
    Created on : Feb 10, 2020, 4:02:41 PM
    Author     : natha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/empstylesheet.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Inventory</title>

    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">GoodSports</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="empPortal.jsp">Order Fulfillment</a></li>
                    <li class=active"><a href="empinventory.jsp">Check Inventory</a></li>
                    <li><a href="emporder.jsp">Reorder Products</a></li>
                </ul>
            </div>
        </nav>
        <div class="mx-auto" style="width: 90%;">
        <h1>Inventory</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ProductID</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Shelf Price</th>
                    <th scope="col">Quantity</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Product1</td>
                    <td>A short description about Product1</td>
                    <td>$30.99</td>
                    <td>30</td>
                    
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Product2</td>
                    <td>A short description about Product2</td>
                    <td>$10.99</td>
                    <td>10</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
            </tbody>
        </table>
        </div>
    </body>
</html>
