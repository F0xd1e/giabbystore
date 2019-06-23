<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giabby's Store - Cart</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/product-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">

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
                                Name
                            </span>
                            <span id = "span-surname"> <!--LIKE HERE lol-->
                                Surname
                            </span>
                            <span id = "span-address"> <!--LIKE HERE lol-->
                                <br/>Address
                            </span>
                            <span><br/>Total of the order: $</span>
                            <span id = "span-price"> <!--LIKE HERE lol-->
                            	100
                            </span>
                            <div style = "padding: 0px 0px 0px 0px; margin: 10px -16px -10px -16px; border: solid 1px #d1761d;"></div>
                            <span><br/>The products will arrive on </span>
                            <span id = "span-date"> <!--LIKE HERE lol-->
                                13/11/1998
                            </span>
                        </div>
                    </div>
                </section>
                <!-- BUTTON ID: btn-orderNow -->
                <button id = "btn-orderNow" class = "button-buy" style = "margin-top:-10px;">
                    <p class = "button-buy-text">Order now</p>
                </button>
                <!--END OF PANEL WITH DETAILS-->
            </div>
            <div id="column" class="col-sm-8">

                <!--ARTICLE CONTAINS A PRODUCT-->
                <!--YOU HAVE TO COPY AND PASTE THE ARTICLES-->
                <!--FOR EACH ARTICLE IS NECESSARY TO CREATE THE LINK WITH THE PRODUCT PAGE-->

                <!-- START OF COPY AND PASTE -->
                <!--
                <article class = "center-block" style = "margin-bottom: 20px;">
                   <div class="panel panel-default panel-other right-panel target">
                        <!- - CHANGE HERE BY ID: product-name - ->
                        <div id = "product-name" class="panel-heading"><strong>NINTENDO 3DS</strong></div>
                        <!- - CHANGE HERE BY ID: product-img - ->
                        <div class="panel-body" style = "padding: 5px;">
                            <img id = "product-img" class = "img-responsive" src = "./images/product_3ds.png" alt = "image to set">
                        </div>
                        <!- - CHANGE HERE THE FOOTER - ->
                        <div class="panel-footer" style = "padding-left: 10px; padding-right: 8px;">
                            <!- - CHANGE HERE BY ID price-value - ->
                            <strong>Price: $<span id = "price-value">1000</span></strong>
                            <!- - DIV FOR SPACING, IGNORE IT - ->
                            <div style = "margin: 0px 12px 0px 0px; padding: 0px 0px 0px 0px; display: inline-block"></div>
                            <!- - CHANGE HERE BY ID quantity-value - ->
                            <strong>Quantity: <span id = "quantity-value">1</span></strong>
                            <div style = "margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px; float: right;">
                               <button type="button" id = "button-remove" class="btn btn-default btn-xs">Remove from cart</button>
                            </div>
                        </div>
                    </div>
                </article>
                -->

                <!-- END OF COPY AND PASTE -->

            </div>
        </div>


        
    </section>
    <script>
        function generateCard(){
            return $('<article class = "center-block" style = "margin-bottom: 20px;"> <div class="panel panel-default panel-other right-panel target"> <!-- CHANGE HERE BY ID: product-name --> <div id = "product-name" class="panel-heading"><strong>NINTENDO 3DS</strong></div> <!-- CHANGE HERE BY ID: product-img --> <div class="panel-body" style = "padding: 5px;"> <img id = "product-img" class = "img-responsive" src = "./images/product_3ds.png" alt = "image to set"> </div> <!-- CHANGE HERE THE FOOTER --> <div class="panel-footer" style = "padding-left: 10px; padding-right: 8px;"> <!-- CHANGE HERE BY ID price-value --> <strong>Price: $<span id = "price-value">1000</span></strong> <!-- DIV FOR SPACING, IGNORE IT --> <div style = "margin: 0px 12px 0px 0px; padding: 0px 0px 0px 0px; display: inline-block"></div> <!-- CHANGE HERE BY ID quantity-value --> <strong>Quantity: <span id = "quantity-value">1</span></strong> <div style = "margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px; float: right;"> <button type="button" id = "button-remove" class="btn btn-default btn-xs">Remove from cart</button> </div> </div> </div> </article>');
        }
        $(document).ready(()=>{
            $.get("DoRetrieveCart",(data,status)=>{
                var cart=JSON.parse(data);
                alert(data);
            })
            /*
            for(let ind of [1,2,3]){
                $("#column").append(generateCard());
            }
            */
        })
    </script>
</body>
</html>