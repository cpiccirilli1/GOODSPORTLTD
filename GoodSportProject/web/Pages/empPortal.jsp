<%-- 
    Document   : empPortal
    Created on : Feb 10, 2020, 2:10:41 PM
    Author     : natha
--%>
<%@page import="BusinessObjects.CustOrder"%>
<%@page import="BusinessObjects.OrderList"%>

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
    <% OrderList order = new OrderList();
       order.findAllItems();
    %>
    
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">GoodSports</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/Pages/empPortal.jsp">Order Fulfillment</a></li>
                    <li><a href="/Pages/empinventory.jsp">Check Inventory</a></li>
                    <li><a href="/Pages/empReorder.jsp">Reorder Products</a></li>
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
                   <%-- <th scope="col">Payment Complete?</th>
                    <th scope="col">Order Status</th> --%>
                </tr>
            </thead>
            <tbody>
                <% for(int i = 0; i < order.iArr.size(); i++)
                {
                 CustOrder co = new CustOrder();
                 co = order.iArr.get(i);
                %>
                <tr>
                    <td><%=co.getOrder()%></td>
                    <td><%=co.getFname()%></td>
                    <td><%=co.getLname()%></td>
                    <td><%=co.getAddress()%></td>
                    <td><%=co.getPhone()%></td>
                    <td><%=co.getEmail()%></td>
                    
                </tr>
                <% } %>
            </tbody>
        </table>
        </div>
    </body>
</html>
