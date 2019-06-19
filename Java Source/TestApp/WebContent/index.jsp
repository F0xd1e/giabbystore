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
          
            <!-- Wrapper for slides -->
            <div id = "myCarousel-body" class="carousel-inner">
                
                <div class="item active myCarousel-item">
                    <img src="./images/#" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="./images/#" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="./images/#" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="./images/#" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="./images/#" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="./images/#" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="./images/#" style="width:100%;">
                </div>

                <div class="item myCarousel-item">
                    <img src="./images/#" style="width:100%;">
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
                        <img class = "img-responsive target-img" src = "./images/#" alt = "image to set">
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
                        <img class = "img-responsive target-img" src = "./images/#" alt = "image to set">
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
                        <img class = "img-responsive target-img" src = "./images/#" alt = "image to set">
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
                        <img class = "img-responsive target-img" src = "./images/#" alt = "image to set">
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
                        <img class = "img-responsive target-img" src = "./images/#" alt = "image to set">
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
                        <img class = "img-responsive target-img" src = "./images/#" alt = "image to set">
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
                        <img class = "img-responsive target-img" src = "./images/#" alt = "image to set">
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
                        <img class = "img-responsive target-img" src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--
        div -> target
        title -> item-header
        img -> target-img
        price -> item-footer
    -->
    <!--Script-->
    <script>
        $(document).ready(function(){
            $.get("HomeSuggestions",function(data, status){
                var suggestions = JSON.parse(data);
                var index = 0;
                $(".target").each(function(){
                    var title = suggestions[index].title, path = suggestions[index].imgPath, price = suggestions[index].price;
                    
                    //CARDS
                    $(this).find("div[class=item-header]").html(title);
                    $(this).find("div[class=item-img-field]").children().eq(0).attr("src", path);
                    $(this).find("div[class=item-footer]").html(price.toString());

                    index++;
                });
                index = 0;
                $(".myCarousel-item").each(function(){
                    var path = suggestions[index].imgPath;

                    //CAROUSEL
                    $(this).children().eq(0).attr("src", path);

                    index++;
                });
            });
            $("#spanLogOut").click(function(){
                $.get("DoLogout",function(data, status){
                    alert(status);
                    window.location.reload(false);
                    return;
                });
            });
        });
    </script>

</body>
</html>