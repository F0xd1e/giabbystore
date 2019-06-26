<%@page import="java.text.DecimalFormat"%>
<%!
	String userThing = null;
%>
<%
	userThing = (String)session.getAttribute("user");
	if (userThing == null) {
		response.sendRedirect("index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giabby's Store - Cart</title>
	
	<%@ page import="JavaBeans.*" %>
	<%@ page import="java.util.*" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/product-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">

</head>
<body>
	
	<%
    UserBean usr=(UserBean)request.getSession().getAttribute("userBean");
	String name=usr.getName();
	String surname=usr.getSurname();
    String addr=usr.getAddress();
    ArrayList<ProductInfo> products=(ArrayList<ProductInfo>)session.getAttribute("cart");
    DecimalFormat numberFormat=new DecimalFormat("#.00");
	%>
	
	<%!
	private double getMaxPrice(ArrayList<ProductInfo> products){
		return products.stream().map(x->(x.getProduct().getPrice()*x.getQuantity())).reduce(0D,(a,b)->a+b);
	}
	private int getLatestShipment(ArrayList<ProductInfo> products){
		return products.stream().map(x->x.getProduct().getShipment()).reduce(0,(a,b)->(a>b)?a:b);
	}
	%>
    <!--NAV WITH BUTTON TO RETURN TO INDEX-->
    <nav class="navbar navbar-inverse navbar-fixed-top" >
        <div class="container-fluid">
            <div class="navbar-header">
                <a style = "padding-left:10px;" class="navbar-brand" href="./index.jsp">Return to index</a>
            </div>
        </div>
    </nav>
    <!--HEADER-->
    <header>
        <div class = "container" style = "width: 90%; padding: 5px; margin-top:50px;">
            <h2 style = "text-align: center;"><strong>CART</strong></h2>
            <hr/>
        </div>
    </header>

    <section class = "center-block" style = "width:100%">
        <div class="row">
            <div class="col-sm-4 center-block">
                <!--TEMPLATE OF DETAILS - YOU MUST EDIT THAT!-->
                <!--PANEL WITH DETAILS-->
                <section id = "cart-details" class = "center-block">
                    <div class="panel panel-default panel-other">
                        <div class="panel-heading">
                            Cart informations
                        </div>
                        <!--YOU MUST CHANGE THE CART DETAILS BY
                            EDITING THE CLASS target-other-content-->
                        <div class="panel-body target-other-content">
                            <!--YOU MUST EDIT span-NAME-->
                            <span id = "span-name"> <!--LIKE HERE lol-->
                                <%= name %>
                            </span>
                            <span id = "span-surname"> <!--LIKE HERE lol-->
                                <%= surname %>
                            </span>
                            <span id = "span-address"> <!--LIKE HERE lol-->
                                <br/><%= addr %>
                            </span>
                            <span id="ordTarg"><br/>Total of the order: $</span>
                            <span id = "span-price"> <!--LIKE HERE lol-->
                            	<%=numberFormat.format(getMaxPrice(products)) %>
                            </span>
                            <div style = "padding: 0px 0px 0px 0px; margin: 10px -16px -10px -16px; border: solid 1px #d1761d;"></div>
                            <span id="dateTarg"><br/>The products will arrive in </span>
                            <span id = "span-date"> <!--LIKE HERE lol-->
                                <%=getLatestShipment(products) %>
                            </span>
                        </div>
                    </div>
                </section>
                <%
                if(products !=null){
                %>
                <!-- BUTTON ID: btn-orderNow -->
                <div id = "rem" style = "margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;">
                	<form action="DoBuyCartProducts" method="GET">
                		<input style="display:none;" name="price" value="<%=getMaxPrice(products) %>">
                		<input style="display:none;" name="shipment" value=" <%=getLatestShipment(products) %>">
	                    <button id = "btn-orderNow" class = "button-buy" style = "margin-top:-10px;">
	                        <p class = "button-buy-text">Order now</p>
	                    </button>
                    </form>
                </div>
                <%
                	} 
                %>
                <!--END OF PANEL WITH DETAILS-->
            </div>
            <div id="column" class="col-sm-8">

                <!--ARTICLE CONTAINS A PRODUCT-->
                <!--YOU HAVE TO COPY AND PASTE THE ARTICLES-->
                <!--FOR EACH ARTICLE IS NECESSARY TO CREATE THE LINK WITH THE PRODUCT PAGE-->

				
                <!-- START OF COPY AND PASTE -->
                <%
                	for(ProductInfo pInfo : products){
                		
                	
                %>
                <article class = "center-block" style = "margin-bottom: 20px;">
                    <div class="panel panel-default panel-other right-panel target">
                        
                        <div class="product-name panel-heading"><strong><%= pInfo.getProduct().getTitle()%></strong></div>
                        
                        <div class="panel-body" style = "padding: 5px;">
                            <img class = "product-img img-responsive" src ="<%=pInfo.getProduct().getImgPath() %>" alt = "image to set">
                        </div>
                     
                        <div class="panel-footer target-footer" style = "padding-left: 10px; padding-right: 8px;">
                            
                            <strong>Price: $<span class = "price-value"><%= pInfo.getProduct().getPrice()%></span></strong>
                            
                            <div style = "margin: 0px 12px 0px 0px; padding: 0px 0px 0px 0px; display: inline-block"></div>
                            
                            <strong>Quantity: <span class = "quantity-value"><%= pInfo.getQuantity()%></span></strong>
                            <div style = "margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px; float: right;">
                               	<form action="DoRemoveFromCart" method="GET">
                               		<input style="display:none;" type="text" name="prodId" value="<%=pInfo.getProduct().getProductCode()%>">
                               		<input style="display:none;" type="text" name="number" value="<%=pInfo.getQuantity()%>">
                             		<button  class="button-remove btn btn-default btn-xs">Remove from cart</button>
                             	</form>
                            </div>
                        </div>
                    </div>
                </article>
                <%
                	}
                %>
                
                <!-- END OF COPY AND PASTE -->

            </div>
        </div>

    </section>
    
</body>
</html>