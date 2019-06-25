<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Giabby's Store - Admin Panel</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
        <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
        <link rel="stylesheet" type="text/css" href="./files_css/error-things.css">
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
                <h2 style = "text-align: center;"><strong>ADD OR REMOVE AN ADMIN</strong></h2>
                <hr/>
            </div>
        </header>

        <section class = "center-block">

            <div class = "center-block" style = "width:80%;">
                <div class="row center-block">
                    <div id="spacingSection" class="col-sm-6 center-block">
                        <h3 style = "text-align: center; margin: 0px 0px 15px 0px;">Add a new admin</h3>
                        <form action = "DoSetAdminPrivilege" method = "POST">
                            <div class="form-group center-block">
                                <label style = "text-align:center;" class = "center-block">Username</label>
                                <input type="text" class="form-control adm-input" name = "username">
                                <button class = "br-style-btn center-block" style = "margin-bottom:10px;">
                                    <p style = "padding: 3px 15px 3px 15px; margin-bottom: 0px;">Confirm</p>
	                            </button>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-6 center-block">
                        <h3 style = "text-align: center; margin: 0px 0px 15px 0px;">Remove an admin</h3>
                        <form action = "DoRemoveAdminPrivilege" method = "POST">
                            <div class="form-group center-block">
                                <label style = "text-align:center;" class = "center-block">Username</label>
                                <input type="text" class="form-control adm-input" name = "username">
                                <button class = "br-style-btn center-block" style = "margin-bottom:10px;">
                                    <p style = "padding: 3px 15px 3px 15px; margin-bottom: 0px;">Confirm</p>
	                            </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row center-block">

					<%!
						String msg = null;
					%>

                    <%
                    	msg = (String)session.getAttribute("msgConfirm");
                    	if (msg != null) {
                    %>
                    		<p style = "text-align: center;">
                    			<%= msg %>
                    		</p>
                    <%
                    	}
                    %>

                </div>
            </div>

        </section>

    </body>
</html>