<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Giabby's Store - Account</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
        <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
        <link rel="stylesheet" type="text/css" href="./files_css/account.css">

        <%@ page import="JavaBeans.UserBean" %>

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
                <h2 style = "text-align: center;"><strong>ACCOUNT</strong></h2>
                <hr/>
            </div>
        </header>

        <%!
            UserBean myUser = null;
        %>
        <%
        	myUser = (UserBean)session.getAttribute("userBean");
        %>

        <section class = "center-block">

            <div class = "center-block" style = "width:80%;">
                <h3 style = "text-align: center; margin: 0px 0px 15px 0px;">Account informations</h3>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>Username</label>
                    </div>
                    <div class="col-sm-6 dataCol">
                        <%= myUser.getUsername() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>Email</label>
                    </div>
                    <div class="col-sm-6 dataCol">
                        <%= myUser.getEmail() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>Reputation</label>
                    </div>
                    <div class="col-sm-6 dataCol" style = "margin-bottom:20px;">
                        <% if (myUser.isCanAccess() == true) { %>
                        		Your account have a good reputation!
                        <% } else { %>
                        		You are banned
                       	<% } %>
                    </div>
                </div>
            </div>
            <div class = "center-block" style = "width:80%;">
                <h3 style = "text-align: center; margin: 0px 0px 15px 0px;">Personal informations</h3>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>Name</label>
                    </div>
                    <div class="col-sm-6 dataCol">
                        <%= myUser.getName() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>Surname</label>
                    </div>
                    <div class="col-sm-6 dataCol">
                        <%= myUser.getSurname() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>Address</label>
                    </div>
                    <div class="col-sm-6 dataCol">
                        <%= myUser.getAddress() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>City</label>
                    </div>
                    <div class="col-sm-6 dataCol">
                        <%= myUser.getCity() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>CAP</label>
                    </div>
                    <div class="col-sm-6 dataCol">
                        <%= myUser.getCap() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>Nation</label>
                    </div>
                    <div class="col-sm-6 dataCol">
                        <%= myUser.getNation() %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 labelCol">
                        <label>Phone</label>
                    </div>
                    <div class="col-sm-6 dataCol">
                        <%= myUser.getPhone() %>
                    </div>
                </div>
            </div>

        </section>

    </body>
</html>