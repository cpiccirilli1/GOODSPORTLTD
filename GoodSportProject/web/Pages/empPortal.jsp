<%-- 
    Document   : empPortal
    Created on : Feb 10, 2020, 2:10:41 PM
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
                    <li><a href="#">Reorder Products</a></li>
                </ul>
            </div>
        </nav>
        <div class="mx-auto" style="width: 90%;">
        <h1>Order Fulfillment</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">CustID</th>
                    <th scope="col">First Name</th>
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
                    <th scope="row">1</th>
                    <td>John</td>
                    <td>Doe</td>
                    <td>123 Street Ave. New York, NY, 12345</td>
                    <td>1234567890</td>
                    <td>johndoe1@mail.com</td>
                    <td>Yes</td>
                    <td>Ordered</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>placeholder</td>
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
