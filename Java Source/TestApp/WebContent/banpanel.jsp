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
    
    <style>
    	.button-unban {
    		margin: 3px -8px 3px 6px;
  			background-color: white;
  			color: black;
  			border: 2px solid #555555;
  			border-radius: 4px;
		}

		.button-unban:hover {
  			background-color: #d1761d;
  			color: white;
  			border-radius: 4px;
		}
		.button-unban-text {
			padding: 2px 4px 2px 4px;
			margin-bottom: 0px;
		}
		.username-text {
			margin-bottom: 0px;
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
    <!--HEADER-->
    <header>
        <div class = "container" style = "width: 90%; padding: 5px; margin-top:50px;">
            <h2 style = "text-align: center;"><strong>BAN PANEL</strong></h2>
            <hr/>
        </div>
    </header>
    <section>
        <div class = "center-block" id = "cblock">
            <form class="form-inline" action="DoUserBan" method="POST"> 
                <div class="form-group" style = "width:100%;" id = "banform">
                    <input type="text" class="form-control" placeholder="Nickname" name="username" id = "ban-bar">
                    <button type="submit" class="btn btn-default" id = "ban-button">Ban</button>
                </div>
            </form>
        </div>
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
        <div class="row" style="margin-bottom: 15px;">
            <div class="col-sm-12 center-block" style = "padding-left:4px;padding-right:4px;">
                <!-- The div that contains the datas of the user is userDiv [CLASS] -->
                <div class = "container-fluid userDiv" style = "border: solid 2px #d1761d;">
                    <!-- That span contains the username of the banned user -->
                    <div class = "userPreset-spanUsername" style = "width: 65%; margin: 0px 0px 0px 0px; float: left;">
                        <!-- That paragraph contains the username text -->
                        <!-- YOU MUST CHANGE THAT -->
                        <p class = "username-text" style = "margin-top:7px;">Preset username</p>
                    </div>
                    <span class = "userPreset-spanButton" style="float:right;">
                        <!-- That span contains the "unban" button -->
                        <button class = "button-unban">
                        	<!-- That paragraph contains the unban button text -->
                        	<!-- DO NOT CHANGE THAT! -->
                            <p class = "button-unban-text">Unban</p>
                        </button>
                    </span>
                </div>
            </div>
        </div>
        <!-- END OF THE PRESET -->

    </section>


</body>
</html>