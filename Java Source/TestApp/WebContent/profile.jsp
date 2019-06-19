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
    <%
        } else {
    %>
        <!-- ADMIN PANEL -->
    <%
        }
    %>

</body>
</html>