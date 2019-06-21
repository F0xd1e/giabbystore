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

    <script src = "./files_js/js-signup.js"></script>

    <style>
        body{
            background-color: rgb(43, 43, 43);
            color:rgb(229, 229, 229);
            text-align: center;
        }
        .error{
            border: solid red 2px;
        }
        .notDisplayed{
            display: none;
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
            <h2 style = "text-align: center;"><strong>SIGN UP</strong></h2>
            <hr/>
        </div>
    </header>
    <section>
        <div id = "divSignUp" class = "rounded">

            <form id="formcheck" action = "DoSignUp" method = "POST">

                <div class="row">
                    <div class="col-sm-6">
                        <div class = "form-group">
                            <label>Username</label>
                            <input type="text" class="form-control" id="username" name="username">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class = "form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class = "form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class = "form-group">
                            <label>Surname</label>
                            <input type="text" class="form-control" id="surname" name="surname">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class = "form-group">
                            <label>Nation</label>
                            <input type="text" class="form-control" id="nation" name="nation">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class = "form-group">
                            <label>City</label>
                            <input type="text" class="form-control" id="city" name="city">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class = "form-group">
                            <label>Zip or CAP</label>
                            <input type="text" class="form-control" id="cap" name="cap">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class = "form-group">
                            <label>Address</label>
                            <input type="text" class="form-control" id="address" name="address">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class = "form-group" style = "margin-bottom:20px;">
                            <label>Email</label>
                            <input type="text" class="form-control" id="email" name="email">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class = "form-group" style = "margin-bottom:20px;">
                            <label>Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone">
                        </div>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col-sm-12">
                        <p id = "errMsg" class = "notDisplayed" style = "margin-top:10px; margin-bottom:20px;">Password must contain at least a lowercase letter, an uppercase letter and a number</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <button type="submit" class="btn btn-default" id="btnSubmit">
                            <p style = "padding-right:10px;padding-left:10px;margin-bottom:0px;">Submit</p>
                        </button>
                    </div>
                    <div class="col-sm-6">
                        <button type="reset" class="btn btn-default" id="btnReset">
                            <p style = "padding-right:10px;padding-left:10px;margin-bottom:0px;">Reset</p>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <p>
        <%!
            String message = null;
        %>
        <%
            message = (String)request.getAttribute("greet");
            if (message != null) {
        %>
            <%=message%>
        <%
            }
        %>
    </p>

</body>
</html>