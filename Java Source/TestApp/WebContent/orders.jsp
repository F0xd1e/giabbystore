<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Giabby's Store - Orders</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
        <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
        <link rel="stylesheet" type="text/css" href="./files_css/product-style.css">

    </head>
    <body>

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
                <h2 style = "text-align: center;"><strong>ORDERS</strong></h2>
                <hr/>
            </div>
        </header>

        <!-- START OF COPY -->
        <section class = "center-block" style = "width: 80%; margin-bottom: 15px;">
            <!-- ORDER PANEL -->
            <div class="panel panel-default panel-other" style = "margin: -1px -1px -1px -1px;">
                
                <!-- CHANGE ORDER CODE USING THE CLASS panel-orderCode -->
                <div class="panel-heading"><strong>ORDER CODE: <span class = "panel-orderCode">CHANGE HERE!</span></strong></div>
                
                <!--YOU CAN APPEND ALL PRODUCTS TO THE CLASS panel-appendOrders-->
                <div class="panel-body panel-appendOrders" style = "padding: 5px 8px 5px 6px;">
                    
                    <!--ALL PRODUCTS ARE HERE!-->
                    <!--START OF THE PRODUCT LIST-->

                    <!-- START OF COPY FOR THE SINGLE ORDER -->
                    <div class = "panel panel-default panel-other-reverted">
                        <div class = "panel panel-body" style = "padding: 3px 3px 3px 3px;">
                            <!--CHANGE THE IMAGE WITH THE CLASS panel-imageToChange-->
                            <img class = "panel-imageToChange img-rounded" src = "./images/product_3ds.png">
                            <!--CHANGE THE TITLE OF THE PRODUCT WITH THE CLASS panel-productTitle-->
                            <p class = "panel-productTitle middleTxt">
                                TELEVISIONVERYGOOD
                            </p>
                            <p class = "panel-myContainer middleTxt" style = "float: right; margin-top: -20px; padding-right: 4px;">
                            	Qt. <!-- EDIT HERE WITH THE CLASS panel-productQuantity -->
                            		<span class = "panel-productQuantity">
                            			10
                            		</span>
                            	&nbsp &nbsp $
                            		<!-- EDIT HERE WITH THE CLASS panel-productPrice -->
                            		<span class = "panel-productPrice">
                            			25
                            		</span>
                            	each
                            </p>
                        </div>
                    </div>
                    <!-- END OF COPY FOR THE SINGLE ORDER -->

                    <!-- APPEND HERE -->

                    <!--END OF THE PRODUCT LIST-->

                </div>

                <!-- EDIT ALSO THERE BY CLASS LIKE footer-THINGS -->
                <div class="panel-footer">
                    <p style = "padding: 3px 3px 3px 3px; margin: 0px 0px 0px 0px;">
                        <!-- LIKE HERE! -->
                        Order date: <span class = "footer-orderDate">13/11/1998</span><br/>
                        Shipment date: <span class = "footer-shipmentDate">16/11/1998</span><br/>
                        Total price: $<span class = "footer-totalPrice">150</span><br/>
                        Payment code: <span class = "footer-paymentCode">ABBYWISHSTOLER</span><br/>
                    </p>
                </div>

            </div>
            <!-- END OF ORDER PANEL -->
        </section>
        <!-- END OF COPY -->

    </body>
</html>