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

</head>
<body>
    
    <%!
        String userSession = null;
        String adminSession = null;
    %>
    <%
        userSession = (String)session.getAttribute("user");
        adminSession = (String)session.getAttribute("admin");
        if (userSession == null && adminSession == null) {
    %>
        <header>
            <div class = "container" style = "width: 90%; padding: 5px;">
                <h2 style = "text-align: center; color: white;"><strong>YOU HAVE TO LOGIN TO GAIN ACCESS TO THIS PAGE</strong></h2>
                <hr/>
            </div>
        </header>
        <section>
            <div class = "container">
                <button type="button" class="btn btn-default"><p style = "margin-bottom: 0px; margin-right: 20px; margin-left: 20px;">Home</p></button>
            </div>
        </section>
    <%
        } else {
    %>
        
    <%
        }
    %>

</body>
</html>