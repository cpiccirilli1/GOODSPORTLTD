<%-- 
    Document   : ItemGrid
    Created on : Feb 10, 2020, 2:55:53 PM
    Author     : cgoswic1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Item Grid</title>
        <link rel="stylesheet" href="../CSS/ItemGridCSS.css" />
        <link rel="stylesheet" href="../CSS/FrameCSS.css" />
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../index.jsp">Good Sport!</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Page 1-1</a></li>
                            <li><a href="#">Page 1-2</a></li>
                            <li><a href="#">Page 1-3</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" action="/action_page.php">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
                     <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
             <h3 class="h3">shopping Demo-8 </h3>
             <div class="row">  
             <div class="col-md-4 col-sm-6">
                 <div class="product-grid8">
                     <div class="product-image8">
                         <a href="#"><img class="pic-1" src="../Media/BankJavaIII.png"></a>
                         <ul class="social">
                             <li><a href="" class="fa fa-search" ><img class="pic-0" src="../Media/search.png"></a></li>
                             <li><a href="" class="fa fa-shopping-bag"><img class="pic-0" src="../Media/search.png"></a></li>
                             <li><a href="" class="fa fa-shopping-cart"><img class="pic-0" src="../Media/search.png"></a></li>
                         </ul>
                         <span class="product-discount-label">-30%</span>
                     </div>
                     <div class="product-content">
                         <div class="price">£ 8.00<span>£ 10.00</span></div>
                         <span class="product-shipping">Free Shipping</span>
                         <h3 class="title"><a href="#">Women's Plain Top</a></h3>
                         <a class="all-deals" href="">See all deals <i class="fa fa-angle-right icon"></i></a>
                     </div>
                 </div>
             </div>

             <div class="col-md-4 col-sm-6">
                 <div class="product-grid8">
                     <div class="product-image8">
                         <a href="#"><img class="pic-1" src="../Media/BankJavaIII.png"></a>
                         <ul class="social">
                             <li><a href="" class="fa fa-search"></a></li>
                             <li><a href="" class="fa fa-shopping-bag"></a></li>
                             <li><a href="" class="fa fa-shopping-cart"></a></li>
                         </ul>
                         <span class="product-discount-label">-30%</span>
                     </div>
                     <div class="product-content">
                         <div class="price">£ 7.00<span>£ 10.00</span></div>
                         <span class="product-shipping">Free Shipping</span>
                         <h3 class="title"><a href="#">Women's Designer Top</a></h3>
                         <a class="all-deals" href="">See all deals <i class="fa fa-angle-right icon"></i></a>
                     </div>
                 </div>
             </div>

             <div class="col-md-4 col-sm-6">
                 <div class="product-grid8">
                     <div class="product-image8">
                         <a href="#"><img class="pic-1" src="../Media/BankJavaIII.png"></a>
                         <ul class="social">
                             <li><a href="" class="fa fa-search"></a></li>
                             <li><a href="" class="fa fa-shopping-bag"></a></li>
                             <li><a href="" class="fa fa-shopping-cart"></a></li>
                         </ul>
                         <span class="product-discount-label">-20%</span>
                     </div>
                     <div class="product-content">
                         <div class="price">£ 8.00<span>£ 10.00</span></div>
                         <span class="product-shipping">Free Shipping</span>
                         <h3 class="title"><a href="#">Women's Plain Top</a></h3>
                         <a class="all-deals" href="">See all deals <i class="fa fa-angle-right icon"></i></a>
                     </div>
                 </div>
             </div>
             </div>
             <br>
         </div>
    </body>
    <footer>
        <ul style="list-style: none;"> 
            
            <li style="display:inline;"><a href ="account.jsp">My Account</a>  </li>

            <li style="display:inline;"><a href ="SignIn.jsp">Sign In</a>  </li>

            <li style="display:inline;"><a href ="ItemGrid.jsp">Item Grid</a>  </li>

            <li style="display:inline;"><a href ="../index.jsp">Home</a>  </li>

            <li style="display:inline;"><a href ="ItemDisplay.jsp">Item Display</a>  </li>

            <li style="display:inline;"><a href ="">page 6 </a>  </li>
        
        </ul>

</footer>
</html>
