<%!
	String userThing = null;
	String adminThing = null;
%>
<%
	userThing = (String)session.getAttribute("user");
	adminThing = (String)session.getAttribute("admin");
	if (userThing == null && adminThing == null) {
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
        <title>Giabby's Store - Ban Panel</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
        <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
        <link rel="stylesheet" type="text/css" href="./files_css/error-things.css">
        <link rel="stylesheet" type="text/css" href="./files_css/banpanel.css">
        <script src = "./files_js/js-banpanel.js"></script>

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
                <h2 style = "text-align: center;"><strong>BAN PANEL</strong></h2>
                <hr/>
            </div>
        </header>
        <section>
            <div class = "center-block" id = "cblock">
                <form id="banhammer" class="form-inline" action="DoUserBan" method="POST"> 
                    <div class="form-group" style = "width:100%;" id = "banform">
                        <input type="text" class="form-control" placeholder="Nickname" name="username" id = "ban-bar">
                        <button type="submit" class="btn btn-default" id = "ban-button">Ban</button>
                    </div>
                </form>
            </div>
            <%!
            	String sessionMsg = null;
            %>
            <%
            	sessionMsg = (String)session.getAttribute("msgConfirm");
            	if (sessionMsg != null) {
            %>
                <p class = "errorText" style = "margin-top:20px; margin-bottom: -5px; text-align:center;">
                    <%=sessionMsg%>
                </p>
            <%
            		session.removeAttribute("msgConfirm");
                }
            %>
            <p id = "errMsg" class = "notDisplayed errorText" style = "margin-top:20px; margin-bottom: -5px; text-align:center;">The field must not be empty.</p>
            <div class = "container" style = "width: 90%; padding: 5px;">
                <hr id="last-hr">
            </div>
        </section>
        
        <!--SECTION WITH USER-UNBAN DIVS-->
        <section id = "append-div">
            <!-- I DIV DEGLI UTENTI DEVONO ESSERE ACCODATI QUI,
                DOPO IL DIV CON CLASSE CONTAINER SOTTOSTANTE -->

            <div class = "container" style = "width: 90%; padding: 5px; margin-top:-25px;">
                <h3 style = "text-align: center;"><strong>Banned users</strong></h3>
            </div>

            <!-- PRESET DI UTENTE PER L'UNBAN -->

            <!-- You have to create a new row each time -->
            <!--
            <div class="row" style="margin-bottom: 15px;">
                <div class="col-sm-12 center-block" style = "padding-left:4px;padding-right:4px;">
                    
                    <div class = "container-fluid userDiv" style = "border: solid 2px #d1761d;">
                        
                        <div class = "userPreset-spanUsername" style = "width: 65%; margin: 0px 0px 0px 0px; float: left;">
                        
                            <p class = "username-text" style = "margin-top:7px;">Preset username</p>
                        </div>
                        <span class = "userPreset-spanButton" style="float:right;">
                            
                            <button class = "button-unban">
                            
                                <p class = "button-unban-text">Unban</p>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
            -->
            <!-- END OF THE PRESET -->

        </section>
<%@include file="./WEB-INF/jsp/footer.jsp"%>
    </body>
</html>