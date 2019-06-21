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