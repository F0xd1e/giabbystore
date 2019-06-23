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
                            <span class = "span-name"> <!--LIKE HERE lol-->
                                Name
                            </span>
                            <span class = "span-surname">
                                Surname
                            </span>
                            <span class = "span-address"> <!--LIKE HERE lol-->
                                <br/>Address
                            </span>
                            <span><br/>Total of the order: $</span>
                            <span class = "span-price">
                            	100
                            </span>
                            <div style = "padding: 0px 0px 0px 0px; margin: 10px -16px -10px -16px; border: solid 1px #d1761d;"></div>
                            <span><br/>The products will arrive on </span>
                            <span class = "span-date">
                                13/11/1998
                            </span>
                        </div>
                    </div>
                </section>
                <!--END OF PANEL WITH DETAILS-->
            </div>
            <div class="col-sm-8">

            </div>
        </div>


        
    </section>

</body>
</html>