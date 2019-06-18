<!DOCTYPE HTML>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giabby's Store</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/index-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
    
</head>
<body>
    
    <!--Navbar-->
    <nav id = "stickyBar" class = "navbar navbar-inverse navbar-fixed-top" style = "margin-bottom: 15px;">
        <div class = "container-fluid">
            <div class = "navbar-header changeColor" id = "nb-header">
                <a class="navbar-brand" href="./index.jsp">Giabby's Store</a>
            </div>
            <!--CATEGORIES-->
            <ul class="nav navbar-nav">
                <li class="dropdown changeColor"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret" style = "margin-left:6px;"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Hard Disk</a></li>
                        <li><a href="#">Processors</a></li>
                        <li><a href="#">Video Cards</a></li>
                        <li><a href="#">Power Supplies</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">

                <!--
                    Attributi sessione:
                    "user" -> contiene l'username dell'utente
                -->
                <%!
                    String userSession = null;
                    String adminSession = null;
                %>
                <%
                    userSession = (String)session.getAttribute("user");
                    adminSession = (String)session.getAttribute("admin");
                    if (adminSession != null) {
                        userSession = adminSession;
                    }
                    if (userSession == null) {
                %>
                    <li class = "changeColor"><a href="./signup.jsp"><span class="glyphicon glyphicon-user" style = "margin-right: 5px;"></span> Sign Up</a></li>
                    <li class = "changeColor"><a href="./login.jsp"><span class="glyphicon glyphicon-log-in" style = "margin-right: 5px;"></span> Login</a></li>
                <%
                    } else {
                %>
                	<li class = "changeColor"><a href="#"> <span class="glyphicon glyphicon-user" style = "margin-right: 5px;"></span> Welcome, <%=userSession%></a></li>
                    <li class = "changeColor"><a href="#"><span class="glyphicon glyphicon-shopping-cart" class = "gl-resize"></span> <span class = "hide-resize">Cart</span></a></li>
                    <li class = "changeColor"><a href="" id="spanLogOut"><span class="glyphicon glyphicon-log-out" class = "gl-resize" style = "margin-right: 3px;"></span> <span class = "hide-resize-d">Logout</span></a></li>
                <%
                    }
                %>

            </ul>
        </div>
    </nav>
    <!--End of navbar-->

    <!--Slideshow-->
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
          
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="./images/toDelete.jpg" alt="My Lambo" style="width:100%;">
                </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <!--Section with products-->
    <div id = "productSection" class = "container-fluid">
        <div class="row">
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        Nintendo 3DS
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive" src = "./images/product_3ds.png" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        $80,00
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Script-->
    <script>
        $(document).ready(function(){
            $("#spanLogOut").click(function(){
                $.get("DoLogout",function(data, status){
                    window.location.reload(false);
                    return;
                });
            });
        });
    </script>

</body>
</html>