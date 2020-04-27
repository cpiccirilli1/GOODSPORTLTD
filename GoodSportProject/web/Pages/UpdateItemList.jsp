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
        <div class="container">
        <h1 style="text-align:center"><b>Update Product Listing</b></h1>
                <div class="well">
                Please enter the product ID that you want to edit the listing for.
                Find ProductID first, then make necessary changes.
                
                <form method="post" action="http://localhost:8080/GoodSportProject/UpdateItemListServlet">
                    <%
                        Item i3 = new Item();
                        String prodId = "";
                        String prodName = "";
                        String prodDesc = "";
                        String prodCat = "";
                        String prodSport = "";
                        String prodPrice = "";
                        String prodImg = "";
                        try{
                            i3 = (Item)session.getAttribute("i3");
                            prodId = String.valueOf(i3.getId());
                            prodName = i3.getProdName();
                            prodDesc = i3.getProdDesc();
                            prodCat = i3.getCategory();
                            prodSport = i3.getSport();
                            prodPrice = String.valueOf(i3.getPrice());
                            prodImg = i3.getimgLink();
                        } catch(Exception e) {
                            prodId = "";
                            prodName = "";
                            prodDesc = "";
                            prodCat = "";
                            prodSport = "";
                            prodPrice = "";
                            prodImg = "";
                        }
                        System.out.println(prodDesc);
                        %>
                    <div class="form-group">
                        <label for="productID">ProductID:</label>
                        <input type="productNo" class="form-control" name="productID" id="prodID" value="<%=prodId%>" required>
                    </div>
                     <div class="form-group">
                        <label for="name">Product Name:</label>
                        <input type="name" class="form-control" name="productName" id="prodName" value="<%=prodName%>">
                    </div>
                     <div class="form-group">
                        <label for="">Description:</label>
                        <textarea class="form-control" rows="5" id="description" name="description"><%=prodDesc%></textarea>
                    </div>
                     <div class="form-group">
                        <label for="">Category:</label>
                        <input type="cat" class="form-control" name="category" id="categ" value="<%=prodCat%>">
                    </div>
                     <div class="form-group">
                        <label for="">Sport:</label>
                        <input type="sport" class="form-control" name="sport" id="spor" value="<%=prodSport%>">
                    </div>
                     <div class="form-group">
                        <label for="">Price:</label>
                        <input type="pri" class="form-control" name="price" id="pric" value="<%=prodPrice%>">
                    </div>
                     <div class="form-group">
                        <label for="">Image Link:</label>
                        <input type="imglink" class="form-control" name="img" id="link" value="<%=prodImg%>">
                    </div>
                    <button type="submit" name="action" value="search" class="btn btn-default">Find</button>
                    <button type="submit" name="action" value="update" class="btn btn-default">Update</button>
                    <a href="http://localhost:8080/GoodSportProject/Pages/empinventory.jsp"><b>  Cancel</b></a>
                </form>
                </div>
        </div>
    </body>
</html>
