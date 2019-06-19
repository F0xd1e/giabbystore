<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giabby's Store - Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/profile-style.css">
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
    
    <%!
        String userSession = null;
        String adminSession = null;
    %>
    <%
        userSession = (String)session.getAttribute("user");
        adminSession = (String)session.getAttribute("admin");
        if (userSession != null && adminSession == null) {
    %>
        <!-- USER PANEL -->
        <div class = "container" style = "width: 90%; padding: 5px;">
            <h2 style = "text-align: center;"><strong>WELCOME, <%=userSession%></strong></h2>
            <hr/>
            <h4>Display your orders</h4>
            <h4>Display your cart</h4>
            <h4>Display your details</h4>
            <h4>Display your payment methods</h4>
        </div>
    <%
        } else {
    %>
        <!-- ADMIN PANEL -->
    <%
        }
    %>

</body>
</html>