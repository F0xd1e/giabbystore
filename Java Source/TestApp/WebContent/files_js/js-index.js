$(document).ready(function(){
            
    $.get("DoGetCategories",function(data,status){
        //alert(data);
        var dropD=$('#dropcateg');
        var catVec=JSON.parse(data);
        for(let cat of catVec){
            var element=$('<li>');
            var link=$('<a>');
            link.html(cat);
            element.append(link);
            dropD.append(element);
        }
    })
    
    $.get("HomeSuggestions",function(data, status){
        var suggestions = JSON.parse(data);
        var index = 0;
        $(".target").each(function(){
            var title = suggestions[index].title, path = suggestions[index].imgPath, price = suggestions[index].price;
            
            //CARDS
            $(this).find("div[class=item-header]").html(title);
            $(this).find("div[class=item-img-field]").children().eq(0).attr("src", path);
            $(this).find("div[class=item-footer]").html("$" + price.toString());

            index++;
        });
        index = 0;
        $(".myCarousel-item").each(function(){
            var path = suggestions[index].imgPath;

            //CAROUSEL
            $(this).children().eq(0).attr("src", path);

            index++;
        });
    });
    $("#spanLogOut").click(function(){
        $.get("DoLogout",function(data, status){
            window.location.reload(false);
            return;
        });
    });
});