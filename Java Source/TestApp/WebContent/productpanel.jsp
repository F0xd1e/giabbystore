<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giabby's Store</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/error-things.css">
    <link rel="stylesheet" type="text/css" href="./files_css/product-style.css">

    <script src = "./files_js/js-productpanel.js"></script>

    <style>
        body{
            text-align: center;
        }
    </style>

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
    <header>
        <div class = "container" style = "width: 90%; padding: 5px; margin-top:50px;">
            <h2 style = "text-align: center;"><strong>ADD A NEW PRODUCT</strong></h2>
            <hr/>
        </div>
    </header>

    <section>
        <form id="form-add" action = "DoAddProduct" method = "POST">
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group" style = "margin-bottom:25px;">
                        <label>Title</label>
                        <input type="text" class="form-control ap-field" id="ap-title" name="title" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class = "form-group">
                        <label>Image path</label>
                        <input type="text" class="form-control ap-field" id="ap-imgPath" name="imgPath" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class = "form-group" style = "margin-bottom:25px;">
                        <label>Description</label>
                        <textarea type="text" class="form-control ap-desc" rows="5" id="ap-description" name="description" required></textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group">
                        <label>Tipology</label>
                        <input type="text" class="form-control ap-field" id="ap-tipology" name="tipology" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class = "form-group">
                        <label>Days of shipment</label>
                        <input type="number" class="form-control ap-field" id="ap-shipment" name="shipment" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group" style = "margin-bottom:30px;">
                        <label>Price</label>
                        <input type="text" class="form-control ap-field" id="ap-price" name="price" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class = "form-group" style = "margin-bottom:30px;">
                        <label>Availability</label>
                        <input type="number" class="form-control ap-field" id="ap-availability" name="availability" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group">
                        <button id = "btn-addProduct" style = "margin-bottom:10px;">
                            <p style = "padding: 8px 15px 8px 15px; margin-bottom: 0px;">Add a new product</p>
	                    </button>
                    </div>
                </div>
                <div class="col-sm-6">
                </div>
            </div>
        </form>

		<%
			if (request.getAttribute("success")!=null){
		%>
			<p style = "text-align:center;">
				<%= request.getAttribute("success") %>
			</p>
		<%
			}
		%>
    </section>

</body>
</html>