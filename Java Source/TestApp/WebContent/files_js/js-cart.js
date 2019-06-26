function generateCard(){
            return $('<article class = "center-block" style = "margin-bottom: 20px;"> <div class="panel panel-default panel-other right-panel fatherofall"> <div class="product-name panel-heading"><strong>NINTENDO 3DS</strong></div> <div class="panel-body" style = "padding: 5px;"> <img class = "product-img img-responsive" src = "./images/product_3ds.png" alt = "image to set"> </div> <div class="panel-footer target-footer" style = "padding-left: 10px; padding-right: 8px;"> <strong>Price: $<span class = "price-value">1000</span></strong> <div style = "margin: 0px 12px 0px 0px; padding: 0px 0px 0px 0px; display: inline-block"></div> <strong>Quantity: <span class = "quantity-value">1</span></strong> <div class = "btn-cont"> <button type="button" class="button-remove btn btn-default btn-xs">Remove from cart</button> </div> </div> </div> </article>')
        }

        function getQueryString(prod){
            var qStr="DoRemoveFromCart?prodId="+prod.prodId+"&number="+prod.number;
            return qStr;
        }
        
        $(document).ready(()=>{
            $.get("DoRetrieveCart",(data,status)=>{
                var cart=JSON.parse(data);
                
                if(cart.length>0){
                    var totPrice=cart.map(x=>x.price*x.number).reduce((a,b)=>a+b,0);
                    var latestShipment=cart.map(x=>x.shipment).reduce((a,b)=>(a>b)?a:b,0);
                    $("#span-price").html(totPrice.toFixed(2));
                    $("#span-date").html("<span>"+latestShipment +"</span> day/s");
                    for(let prod of cart){
                        $("#column").append(generateCard());
                    }
                    var index=0;
                    
                    
                    $(".fatherofall").each(function(){
                        var current=cart[index];
                        //alert($(this).find('div[class=panel-footer]').children().eq(3).children().eq(0).is('button'));
                        $(this).children().eq(0).children().eq(0).html(current.title);
                        $(this).find('div[class=panel-body]').children().eq(0).attr("src",current.imgPath);
                        $(this).find('div[class=panel-footer]').children().eq(0).children().eq(0).html(current.price);
                        $(this).find('div[class=panel-footer]').children().eq(2).children().eq(0).html(current.number);
                        $(this).find('div[class=panel-footer]').children().eq(3).children().eq(0).click(function(e){
                            var query=getQueryString(current);
                           
                            $.get(query,()=>{
                                location.reload(false);
                            })
                            
                        })
                        index++;
                    })
                    $("#btn-orderNow").removeClass("hide-btn");
                }
                else{
                    $("#span-price").html("");
                    $("#span-date").html("");
                    $("#ordTarg").html("<br>no order");
                    $("#dateTarg").html("<br>no item selected");
                    $("#rem").addClass("hideDisplay");
                }
                
            })
            
            $("#btn-orderNow").click(function(){
                var price=$("#span-price").html();
                var shipment=$("#span-date").children().eq(0).html();
                
                var url='DoBuyCartProducts?price='+price+'&shipment='+shipment;
                $.get(url,function(){
                    location.reload(false);
                })
                
            })
        })