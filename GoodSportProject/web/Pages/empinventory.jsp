<%-- 
    Document   : empinventory
    Created on : Feb 10, 2020, 4:02:41 PM
    Author     : natha
--%>

<%@page import="BusinessObjects.Item"%>
<%@page import="BusinessObjects.ItemList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="../CSS/empstylesheet.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Inventory</title>
        
    </head>
    <% ItemList inventory = new ItemList();
    inventory.findAllItems();
    %>
    
    
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">GoodSports</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/empPortal.jsp">Order Fulfillment</a></li>
                    <li class="active"><a href="http://localhost:8080/GoodSportProject/Pages/empinventory.jsp">Check Inventory</a></li>
                    <li><a href="http://localhost:8080/GoodSportProject/Pages/empReorder.jsp">Reorder Products</a></li>
       <ul class="nav navbar-nav navbar-right">
                      <li><a href="http://localhost:8080/GoodSportProject/LogoutServlet">Logout</a></li>
    </ul>
            </div>
        </nav>
        <div class="mx-auto" style="width: 95%;">
        <h1>Inventory</h1>
        <h2><a href="http://localhost:8080/GoodSportProject/Pages/UpdateItemList.jsp">Update product listing here.</a></h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ProductID</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Category</th>
                    <th scope="col">Sport</th>
                    <th scope="col">Shelf Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Img Link</th>
                </tr>
            </thead>
            <tbody>
                <% for(int i = 0; i < inventory.iArr.size(); i++)
                {
                    Item i1 = new Item();
                    i1 = inventory.iArr.get(i);
                %>
                <tr>
                    <td><%=i1.getId()%></td>
                    <td><%=i1.getProdName()%></td>
                    <td><%=i1.getProdDesc()%></td>
                    <td><%=i1.getSport()%></td>
                    <td><%=i1.getCategory()%></td>
                    <td><%=i1.getPrice()%></td>
                    <td><%=i1.getQuantity()%></td>
                    <td><a href="<%=i1.getimgLink()%>"><%=i1.getimgLink()%></a></td>
                </tr>
                <% } %>
               
            </tbody>
        </table>
        </div>
            
    </body>
</html>
