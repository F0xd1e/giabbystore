$(document).ready(function(){
    $("#formcheck").submit(function(){
        var res=true;
        $("#formcheck").find('input[type!=submit]').each(function(){
            if($(this).attr("type")!='reset'){
                if($(this).val()==null || $(this).val()==""){
                    $(this).addClass("error");
                    res=false;
                }
                else{
                    $(this).removeClass("error");    
                }
            }
        })
        if(res==false){
            alert("you must fill all the fields.");
        }
        return res;
    })

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
        var myBool = checkCity($("#city").val());
        
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
function checkCity(myStr){
    var regex = /^[a-zA-Z ]+$/;
    if (myStr.match(regex)!=null) return true;
    else return false;
}
function checkUsername(myStr){
    var regex = /^[a-zA-Z0-9]+([a-zA-Z0-9](_|-| )[a-zA-Z0-9])*[a-zA-Z0-9]+$/;
    if (myStr.match(regex)!=null) return true;
    else return false;
}
function checkPassword(myStr){
    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,20}$/;
    if (myStr.match(regex)!=null) return true;
    else return false;
}
function checkCAP(myStr){
    var regex = /^[0-9]{5}$/;

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
    var regex = /^[0-9]+$/;
    if (myStr.match(regex)!=null) return true;
    else return false;
}