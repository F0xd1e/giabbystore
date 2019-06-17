<!DOCTYPE HTML>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giabby's Store</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
        #stickyBar{
            top:0;
            position:sticky;
        }
    </style>

</head>
<body>
    
    <!--Navbar-->
    <nav id = "stickyBar" class = "navbar navbar-inverse">
        <div class = "container-fluid">
            <div class = "navbar-header">
                <a class="navbar-brand" href="./index.jsp">Giabby's Store</a>
            </div>
            <!--CATEGORIES-->
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Hard Disk</a></li>
                        <li><a href="#">Processors</a></li>
                        <li><a href="#">Video Cards</a></li>
                        <li><a href="#">Power Supplies</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">

                <!--
                    Attributi sessione:
                    "user" -> contiene l'username dell'utente
                -->
                <%!
                    String userSession = null;
                %>
                <%
                    userSession = (String)session.getAttribute("user");
                    if (userSession == null){
                %>
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                    <li><a href="./login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                <%
                    } else {
                %>
                	<li> Welcome, <%=userSession%></li>
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
                <%
                    }
                %>

            </ul>
        </div>
    </nav>
    <!--End of navbar-->


    <!--Footer-->
    

</body>
</html>