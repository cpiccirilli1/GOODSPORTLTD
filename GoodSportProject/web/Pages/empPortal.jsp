<%-- 
    Document   : empPortal
    Created on : Feb 10, 2020, 2:10:41 PM
    Author     : natha
--%>
<%@page import="BusinessObjects.Employee"%>
<%@page import="BusinessObjects.CustOrder"%>
<%@page import="BusinessObjects.ShippedOrderList"%>
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
        order.findOpenItems();
    %> 

    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand"><b>GoodSport</b></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="http://localhost:8080/GoodSportProject/Pages/empPortal.jsp">Order Fulfillment</a></li>
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/empinventory.jsp">Check Inventory</a></li>
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/empReorder.jsp">Reorder Products</a></li> 
                     <li><a href="http://localhost:8080/GoodSportProject/Pages/employeeFaq.jsp">FAQ</a></li>
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
                <h2><b>View Customer Orders</b></h2>
                <p>Open orders will need to be fulfilled first. All completed orders will be shown on the Completed Orders tabs for viewing/deleting.</p>
                <p>Please enter the OrderID that needs to be shipped.</p>
                
                         <form class="form-inline" method="post" action="http://localhost:8080/GoodSportProject/ShipCustOrderServlet">
                    <div class="form-group">
                        <label for="order">OrderID:</label>
                        <input type="text" class="form-control" name="order" id="orderNo">
                    </div>
                    <button type="submit" name="action" value="changeToShipped" class="btn btn-default">Submit order</button>
                </form> 
                <br>

                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#open">Open Orders</a></li>
                    <li><a data-toggle="tab" href="#shipped">Completed Orders</a></li>
                </ul>

                <div class="tab-content">
                    <div id="open" class="tab-pane fade in active">
                        <h2><b>Open Orders</b></h2>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">OrderID</th>
                                    <th scope="col">CustID</th>
                                    <th scope="col">First Name</th>
                                    <th scope="col">Last Name</th>
                                    <th scope="col">Billing Address</th>
                                    <th scope="col">Shipping Address</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">In Cart</th>
                                    <th scope="col">Order Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (int i = 0; i < order.iArr.size(); i++) {
                                        CustOrder co = new CustOrder();
                                        co = order.iArr.get(i);
                                %>
                                <tr>
                                   <td><%=co.getOrderId()%></td>
                                   <td><%=co.getCustId()%></td>
                                    <td><%=co.getFname()%></td>
                                    <td><%=co.getLname()%></td>
                                    <td><%=co.getbillingAddress()%></td>
                                    <td><%=co.getAddress()%></td>
                                    <td><%=co.getPhone()%></td>
                                    <td><%=co.getEmail()%></td>
                                    <td><%=co.getItemList()%></td>
                                    <td><%=co.getStatus()%></td>                    
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                        
                    </div>
                    <div id="shipped" class="tab-pane fade">
                        <h2><b>Shipped Orders</b></h2>
                                <table class="table table-striped">
                                    <%
                                        ShippedOrderList shippedOrder = new ShippedOrderList();
                                        shippedOrder.findShippedItems();
                                    %>
                                    <thead>
                                        <tr>
                                            <th scope="col">OrderID</th>
                                            <th scope="col">CustID</th>
                                            <th scope="col">First Name</th>
                                            <th scope="col">Last Name</th>
                                            <th scope="col">Billing Address</th>
                                            <th scope="col">Shipping Address</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">In Cart</th>
                                            <th scope="col">Order Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < shippedOrder.iArr.size(); i++) {
                                                CustOrder co2 = new CustOrder();
                                                co2 = shippedOrder.iArr.get(i);
                                        %>
                                        <tr>
                                            <td><%=co2.getOrderId()%></td>
                                            <td><%=co2.getCustId()%></td>
                                            <td><%=co2.getFname()%></td>
                                            <td><%=co2.getLname()%></td>
                                            <td><%=co2.getbillingAddress()%></td>
                                            <td><%=co2.getAddress()%></td>
                                            <td><%=co2.getPhone()%></td>
                                            <td><%=co2.getEmail()%></td>
                                            <td><%=co2.getItemList()%></td>
                                            <td><%=co2.getStatus()%></td>

                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                    </div>
                </div>

            </div>
</body>
</html>
