<%-- 
    Document   : UpdateItemList
    Created on : Mar 16, 2020, 11:21:32 AM
    Author     : natha
--%>

<%@page import="BusinessObjects.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/empstylesheet.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Update Item List</title>
    </head>
    <body>
        <h1>Update Product Listing</h1>
                <div class="well">
                Please enter the product ID that you want to edit the listing for.
                Find ProductID first, then make necessary changes.
                
                <form method="post" action="http://localhost:8080/GoodSportProject/UpdateItemListServlet">
                    <%
                        HttpSession ses1 = request.getSession();
                        Item i5 = new Item();
                        i5 = (Item)ses1.getAttribute("i5");
                    %>
                    <div class="form-group">
                        <label for="productID">ProductID:</label>
                        <input type="productNo" class="form-control" name="productID" id="prodID">
                    </div>
                     <div class="form-group">
                        <label for="name">Product Name:</label>
                        <input type="name" class="form-control" name="productName" id="prodName">
                    </div>
                     <div class="form-group">
                        <label for="">Description:</label>
                        <textarea class="form-control" rows="5" id="description"></textarea>
                    </div>
                     <div class="form-group">
                        <label for="">Category:</label>
                        <input type="cat" class="form-control" name="category" id="categ" >
                    </div>
                     <div class="form-group">
                        <label for="">Sport:</label>
                        <input type="sport" class="form-control" name="sport" id="spor">
                    </div>
                     <div class="form-group">
                        <label for="">Price:</label>
                        <input type="pri" class="form-control" name="price" id="pric" >
                    </div>
                     <div class="form-group">
                        <label for="">Image Link:</label>
                        <input type="imglink" class="form-control" name="img" id="link" >
                    </div>
                    <button type="submit" name="action" value="search" class="btn btn-default">Find</button>
                    <button type="submit" name="action" value="update" class="btn btn-default">Update</button>
                </form>
                    <script>
                        document.getElementById("prodID").value = "<%= i5.getId()%>";
                        document.getElementById("prodName").value = "<%= i5.getProdName()%>";
                        document.getElementById("description").value = "<%= i5.getProdDesc()%>";
                        document.getElementById("categ").value = "<%= i5.getCategory()%>";
                        document.getElementById("spor").value = "<%= i5.getSport()%>";
                        document.getElementById("pric").value = "<%= i5.getPrice()%>";
                        document.getElementById("link").value = "<%= i5.getimgLink()%>";
                  
                    </script>
                </div>
    </body>
</html>
