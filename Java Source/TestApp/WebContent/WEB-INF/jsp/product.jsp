<!DOCTYPE html>
<html>
<head>
	<%@ page import="JavaBeans.ProductBean" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giabby's Store - Product</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/product-style.css">

</head>
<body>
	<%
		ProductBean bean=(ProductBean)request.getAttribute("product");
		String description=bean.getDescription(),typology=bean.getTipology(),imgPath=bean.getImgPath(),title=bean.getTitle();
		double price=bean.getPrice();
		int availability=bean.getAvailability(),shipment=bean.getShipment();
	%>
    <!--NAV WITH BUTTON TO RETURN TO INDEX-->
    <nav class="navbar navbar-inverse navbar-fixed-top" >
        <div class="container-fluid">
            <div class="navbar-header">
                <a style = "padding-left:10px;" class="navbar-brand" href="./index.jsp">Return to index</a>
            </div>
        </div>
    </nav>

    <!--HEADER - YOU MUST CHANGE THAT-->
    <header>
        <!--THIS DIV CONTAINS THE TITLE OF THE PRODUCT-->
        <div class = "container container-title" style = "width: 90%; padding: 5px; margin-top:50px;">
            <!--YOU MUST CHANGE HERE!-->
            <h2 style = "text-align: center;"><strong><%= title%></strong></h2>
            <hr/>
        </div>
    </header>
    <!--END OF THE HEADER-->

    <!--SECTION - THERE ARE ALL DETAILS OF THE PRODUCT-->
    <section class = "section-product center-block">
        <!--SECTION OF THE IMAGE-->
        <section class = "section-img center-block">
            <!--YOU MUST CHANGE THE SRC OF THE IMAGE WITH THE REAL IMAGE PATH OF THE PRODUCT-->
                <!--BY TEST, WE'LL INSERT THE IMAGE OF A 3DS-->
            <!--YOU HAVE TO CHANGE THE IMAGE BY THE CLASS target-img-->
            <img src = "<%= imgPath%>" class = "img-responsive img-rounded target-img" alt = "Product image">
        </section>
        <!--SECTION OF THE DETAILS-->
        <section class = "section-details center-block" style = "text-align: center;">
            <br/>
            <!--PANEL FOR OTHER DETAILS OF THE PRODUCT-->
            <div class="panel panel-default panel-other">
                <div class="panel-heading">
                    Details
                </div>
                <!--YOU MUST CHANGE THE OTHER DETAILS OF THE PRODUCT BY
                    EDITING THE CLASS target-other-content-->
                <div class="panel-body target-other-content">
                    <!--YOU MUST EDIT span-NAME-->
                    <span>Category: </span>
                    <span class = "span-category"> <!--LIKE HERE lol-->
                       <%=typology %>
                    </span>
                    <span><br/>Price: $</span>
                    <span class = "span-price">
                    	<%=price %>
                    </span>
                    <span><br/>Availability: </span>
                    <span class = "span-availability">
                            <%= availability%>
                    </span>
                    <span><br/>Shipment: </span>
                    <span class = "span-shipment">
                            <%= shipment%>
                    </span>
                    <span> days</span>
                </div>
            </div>
            <!--PANEL FOR THE DESCRIPTION OF THE PRODUCT-->
            <div class="panel panel-default panel-desc">
                <div class="panel-heading">
                    Description
                </div>
                <!--YOU MUST CHANGE THE DESCRIPTION OF THE PRODUCT BY
                    EDITING THE CLASS target-description-content-->
                <div class="panel-body target-description-content">
                    <%= description%>
                </div>
            </div>
            
        </section>

        <!--SECTION FOR THE BUTTON-->
        <%!
            String userSession = null;
            String adminSession = null;
        %>
        <%
            userSession = (String)session.getAttribute("user");
            adminSession = (String)session.getAttribute("admin");
            if ((userSession != null) || (adminSession != null)) {
        %>
                    
            <section>
                <div class="row">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <!-- BUTTON ID: btn-cart -->
                        <button id = "btn-cart" class = "button-buy" style = "margin-bottom:30px;">
                            <p class = "button-buy-text"><span class="glyphicon glyphicon-shopping-cart" class = "gl-resize" style="display:inline-block; padding-right:8px;"></span>Add to cart</p>
                        </button>
                    </div>
                </div>
            </section>
                
        <%
            }
        %>

    </section>
    

</body>
</html>