<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giabby's Store - Product</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
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

    <!--HEADER - YOU MUST CHANGE THAT-->
    <header>
        <!--THIS DIV CONTAINS THE TITLE OF THE PRODUCT-->
        <div class = "container container-title" style = "width: 90%; padding: 5px; margin-top:50px;">
            <!--YOU MUST CHANGE HERE!-->
            <h2 style = "text-align: center;"><strong>Nintendo 3DS</strong></h2>
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
            <img src = "./images/product_3ds.png" class = "img-responsive img-rounded target-img" alt = "Product image">
        </section>
        <!--SECTION OF THE DETAILS-->
        <section class = "section-details center-block" style = "text-align: center;">
            
        </section>
    </section>
    

</body>
</html>