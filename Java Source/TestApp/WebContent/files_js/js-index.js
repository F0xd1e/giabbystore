$(document).ready(function(){
            
    $.get("DoGetCategories",function(data,status){
        //alert(data);
        var dropD=$('#dropcateg');
        var catVec=JSON.parse(data);
        for(let cat of catVec){
            var element=$('<li>');
            var link=$('<a>');
            link.attr("href","DoRetrieveByCategory?category="+cat);
            link.html(cat);
            element.append(link);
            dropD.append(element);
        }
    })
    
    /*
    function getFormlessForm(productCode){
        var sp=$('<form>').attr("style","display:none");
        var inp=$("<input>").attr("name","productId");
        inp.attr("type","text");
        inp.attr("value",""+productCode);
        sp.attr("action","DoRetrieveProductBean");
        sp.attr("method","GET");
        sp.append(inp);
        return sp;
    }
    */

    function getProductLink(productId){
        var string="DoRetrieveProductBean?productId="+productId;
        return string;
    }

    $.get("HomeSuggestions",function(data, status){
        var suggestions = JSON.parse(data);
        var index = 0;

        

        $(".target").each(function(){
            var title = suggestions[index].title, path = suggestions[index].imgPath, price = suggestions[index].price, productCode=suggestions[index].productCode;
            
            //CARDS
            $(this).parent().attr("href",getProductLink(productCode));
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
        /*
        $(".imageselector").each(function(){
            $(this).click(function(e){
                var form=$(e.target).parent().prev()[0];
                form.submit();
            })
        })
        */
    });
    $("#spanLogOut").click(function(){
        $.get("DoLogout",function(data, status){
            window.location.reload(false);
            return;
        });
    });
});