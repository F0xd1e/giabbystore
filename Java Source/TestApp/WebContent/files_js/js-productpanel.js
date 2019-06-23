$(document).ready(function(){
    $("#ap-price").focusout(function(){
        var myBool = checkPrice($("#ap-price").val());
        if (myBool == false){
            $("#ap-price").addClass("error");
        } else $("#ap-price").removeClass("error");
    });
    $("#form-add").submit(function(){
        var res=true;
        $("#form-add").find('input[id=ap-price]').each(function(){
            res = checkPrice(this.val());
        })
        return res;
    })
})
function checkPrice(myStr){
    var regex = /^\d+(.\d{1,2})?$/;
    if (myStr.match(regex)!=null) return true;
    else return false;
}