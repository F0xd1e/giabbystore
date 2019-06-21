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

    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/index-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">

    <script src = "./files_js/js-index.js"></script>
    
</head>
<body>
    
    <!--Navbar-->
    <nav id = "stickyBar" class = "navbar navbar-inverse navbar-fixed-top" style = "margin-bottom: 40px;">
        <div class = "container-fluid">
            <div class = "navbar-header changeColor" id = "nb-header">
                <a class="navbar-brand" href="./index.jsp">Giabby's Store</a>
            </div>
            <!--CATEGORIES-->
            <ul class="nav navbar-nav">
                <li class="dropdown changeColor"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret" style = "margin-left:6px;"></span></a>
                    <ul id="dropcateg"class="dropdown-menu">
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <form class="form-inline" action="DoSearch" method="GET"> 
                        <div class="form-group">
                        	<input type="text" class="form-control" placeholder="Search a product" name="searchBar" id = "search-field">
                            <button type="submit" class="btn btn-default" id = "search-button"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                    </form>
                </li>
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
                    //syserr command for debug
                    System.err.println("USER: " + userSession + " | ADMIN: " + adminSession);
                    if ((userSession == null) && (adminSession == null)) {
                %>
                    
                    <!--NO USER IS LOGGED-->
                    <li class = "changeColor"><a href="./signup.jsp"><span class="glyphicon glyphicon-user" style = "margin-right: 5px;"></span> Sign Up</a></li>
                    <li class = "changeColor"><a href="./login.jsp"><span class="glyphicon glyphicon-log-in" style = "margin-right: 5px;"></span> Login</a></li>
                
                <%
                    } else if ((userSession != null) && (adminSession == null)) {
                %>

                    <!--NORMAL USER SECTION-->    
                    <li class="dropdown changeColor">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user" style = "margin-right: 5px;"></span> Welcome, <%=userSession%><span class="caret" style = "margin-left:6px;"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Go to your orders</a></li>
                            <li><a href="#">Go to your account</a></li>
                        </ul>
                    </li>
                    <li class = "changeColor"><a href="#"><span class="glyphicon glyphicon-shopping-cart" class = "gl-resize"></span> <span class = "hide-resize">Cart</span></a></li>
                    <li class = "changeColor"><a href="" id="spanLogOut"><span class="glyphicon glyphicon-log-out" class = "gl-resize" style = "margin-right: 3px;"></span> <span class = "hide-resize-d">Logout</span></a></li>

                <%
                    } else {
                %>
                
                    <!--ADMIN USER SECTION-->
                    <li class="dropdown changeColor">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user" style = "margin-right: 5px;"></span> Welcome, <%=adminSession%><span class="caret" style = "margin-left:6px;"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Display an user</a></li>
                            <li><a href="#">Ban/Unban an user</a></li>
                            <li><a href="#">Add a new product</a></li>
                            <li><a href="#">Remove a product</a></li>
                            <li><a href="#">Go to your account</a></li>
                        </ul>
                    </li>
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
          
            <!-- Wrapper for slides -->
            <div id = "myCarousel-body" class="carousel-inner">
                
                <div class="item active myCarousel-item">
                    <img src="" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="" style="width:100%;">
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

    <section>
        <div class = "container" style = "width: 90%; padding: 5px; margin-top:20px;">
            <hr/>
            <h2 style = "text-align: center; color: white;"><strong>SUGGESTED PRODUCTS</strong></h2>
            <hr/>
        </div>
    </section>

    <!--
        div -> target
        title -> item-header
        img -> target-img
        price -> item-footer
    -->
    <div id = "productSection" class = "container-fluid">
        <div class="row">
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>