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
        .errorText{
            color: red;
        }
    </style>

</head>
<body>
    <header>
        <div class = "container" style = "width: 90%; padding: 5px;">
            <h2 style = "text-align: center;"><strong>LOGIN</strong></h2>
            <hr/>
        </div>
    </header>
    <section>
        <div id = "divLogin" class = "rounded">
            <form action = "DoLogin" method = "POST">
                <div class = "form-group">
                    <label>Username</label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>
                <div class = "form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                    <p id = "errMsg" class = "notDisplayed" style = "margin-top:12px;">Password must contain at least a lowercase letter, an uppercase letter, a number and at least 8 keys.</p>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <p class = "errorText" style = "margin-top:20px;">
            	<%
            		if (request.getAttribute("errms") != null){
            	%>
            	<%=request.getAttribute("errms") %>
            	<%
            		}
            	%>
            </p>
        </div>
    </section>

    <script>
        $(document).ready(function(){
            $("#username").focusout(function(){
                var myBool = checkUsername($("#username").val());
                if (myBool == false){
                    $("#username").addClass("error");
                } else $("#username").removeClass("error");
            });
            $("#password").focusout(function(){
                var myBool = checkPassword($("#password").val());
                if (myBool == false){
                    $("#password").addClass("error");
                    $("#errMsg").removeClass("notDisplayed");
                } else {
                    $("#password").removeClass("error");
                    $("#errMsg").addClass("notDisplayed");
                }
            });
        });
        function checkUsername(myStr){
            var regex = /^[a-zA-Z0-9]+([a-zA-Z0-9](_|-| )[a-zA-Z0-9])*[a-zA-Z0-9]+$/;
            if (myStr.match(regex)!=null) return true;
            else return false;
        }
        function checkPassword(myStr){
            var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,20}$/g;
            if (myStr.match(regex)!=null) return true;
            else return false;
        }
    </script>

</body>
</html>