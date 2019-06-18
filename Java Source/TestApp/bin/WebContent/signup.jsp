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
    </style>

</head>
<body>
    <header>
        <div class = "container" style = "width: 90%; padding: 5px;">
            <h2 style = "text-align: center;"><strong>SIGN UP</strong></h2>
            <hr/>
        </div>
    </header>
    <section>
        <div id = "divSignUp" class = "rounded">
            <form action = "/DoSignUp" method = "POST">
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
            $("#name").focusout(function(){
                var myBool = checkWord($("#name").val());
                if (myBool == false){
                    $("#name").addClass("error");
                } else $("#name").removeClass("error");
            });
            $("#surname").focusout(function(){
                var myBool = checkWord($("#surname").val());
                if (myBool == false){
                    $("#surname").addClass("error");
                } else $("#surname").removeClass("error");
            });
            $("#nation").focusout(function(){
                var myBool = checkWord($("#nation").val());
                if (myBool == false){
                    $("#nation").addClass("error");
                } else $("#nation").removeClass("error");
            });
            $("#city").focusout(function(){
                var myBool = checkWord($("#city").val());
                if (myBool == false){
                    $("#city").addClass("error");
                } else $("#city").removeClass("error");
            });
            $("#address").focusout(function(){
                var myBool = checkAddress($("#address").val());
                if (myBool == false){
                    $("#address").addClass("error");
                } else $("#address").removeClass("error");
            });
            $("#email").focusout(function(){
                var myBool = checkEmail($("#email").val());
                if (myBool == false){
                    $("#email").addClass("error");
                } else $("#email").removeClass("error");
            });
            $("#phone").focusout(function(){
                var myBool = checkPhone($("#phone").val());
                if (myBool == false){
                    $("#phone").addClass("error");
                } else $("#phone").removeClass("error");
            });
            $("#cap").focusout(function(){
                var myBool = checkCAP($("#cap").val());
                if (myBool == false){
                    $("#cap").addClass("error");
                } else $("#cap").removeClass("error");
            });
        });
        function checkWord(myStr){
            var regex = /^[a-zA-Z]+$/;
            if (myStr.match(regex)!=null) return true;
            else return false;
        }
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
        function checkCAP(myStr){
            var regex = /^[0-9]{5}/;
            if (myStr.match(regex)!=null) return true;
            else return false;
        }
        function checkAddress(myStr){
            var regex = /^[A-Za-z0-9 ,]+$/;
            if (myStr.match(regex)!=null) return true;
            else return false;
        }
        function checkEmail(myStr){
            var regex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
            if (myStr.match(regex)!=null) return true;
            else return false;
        }
        function checkPhone(myStr){
            var regex = /^[0-9]/;
            if (myStr.match(regex)!=null) return true;
            else return false;
        }
    </script>

</body>
</html>