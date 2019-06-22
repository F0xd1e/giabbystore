$(document).ready(function(){

	function generateUserCard(){

    	var outerDiv=$('<div>').attr("class","row").attr("style","margin-bottom: 15px;");
        var medianDiv=$('<div>').attr("class","col-sm-12 center-block").attr("style","padding-left:4px;padding-right:4px;");
        var innerDiv=$('<div>').attr("class","container-fluid userDiv").attr("style","border: solid 2px #d1761d;");
        var nameContainer=$('<div>').attr("class","userPreset-spanUsername").attr("style","width: 65%; margin: 0px 0px 0px 0px; float: left;");
        var nameWrapper=$('<p>').attr("class","username-text").attr("style","margin-top:7px;").html("trial");
        var buttonContainer=$('<span>').attr("class","userPreset-spanButton").attr("style","float:right;");
        var button=$('<button>').attr("class","button-unban targbtn");
        var buttonName=$('<p>').attr("class","button-unban-text").html("Unban");

        button.append(buttonName);
        buttonContainer.append(button);
        nameContainer.append(nameWrapper);
        innerDiv.append(nameContainer);
        innerDiv.append(buttonContainer);
        medianDiv.append(innerDiv);
        outerDiv.append(medianDiv);

        return outerDiv;
	}

	$('#banhammer').submit(function() {
	    var res = true;
	    var usr = $('#ban-bar').val();
	    // alert(usr);
	    if (usr == null || usr == '') {
	        $("#errMsg").removeClass("notDisplayed");
	        res = false;
	    } else {
	        $("#errMsg").addClass("notDisplayed");
	    }
	    return res;
	})

	$.get("DoGetBannedUsers", function(data, status) {
	var bannedUsers = JSON.parse(data);
	// alert(bannedUsers);
	for (let user of bannedUsers) {
	    $("body").append(generateUserCard());
	}

	/*
	 * for(let n of [1,2,3]){
	 * $("body").append(generateUserCard()); }
	 */
	var index = 0;
	$('.username-text').each(function() {
	    $(this).html(bannedUsers[index]);
	    index++;
	})

	$(".targbtn").click(function(e) {
	    e.preventDefault();
	    var btn = $(e.target);
	    if (btn.is('p')) {
	        btn = btn.parent();
	    }

	    var userName = btn.parent().prev().children().eq(0).html();

	    $.get("UndoUserBan?username=" + userName + "", function(data, status) {
	        // alert(data);
	        location.reload(false);
	    })

	})
	})

})