<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/17
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 
<script>
 
$(function(){
    var stock = ${p.stock};
    $(".productNumberSetting").keyup(function(){
        var num= $(".productNumberSetting").val();
        num = parseInt(num);
        if(isNaN(num))
            num= 1;
        if(num<=0)
            num = 1;
        if(num>stock)
            num = stock;
        $(".productNumberSetting").val(num);
    });
     
    $(".increaseNumber").click(function(){
        var num= $(".productNumberSetting").val();
        num++;
        if(num>stock)
            num = stock;
        $(".productNumberSetting").val(num);
    });
    $(".decreaseNumber").click(function(){
        var num= $(".productNumberSetting").val();
        --num;
        if(num<=0)
            num=1;
        $(".productNumberSetting").val(num);
    });
     
    $(".addCartButton").removeAttr("disabled");
    $(".addCartLink").click(function(){
        var page = "forecheckLogin";
        $.get(
                page,
                function(result){
                    if("success"==result){
                        var pid = ${p.id};
                        var num= $(".productNumberSetting").val();
                        var addCartpage = "foreaddCart";
                        $.get(
                                addCartpage,
                                {"pid":pid,"num":num},
                                function(result){
                                    if("success"==result){
                                        $(".addCartButton").html("Added Successful");
                                        $(".addCartButton").attr("disabled","disabled");
                                        $(".addCartButton").css("background-color","lightgray")
                                        $(".addCartButton").css("border-color","lightgray")
                                        $(".addCartButton").css("color","black")
                                    }
                                    else{
                                         
                                    }
                                }
                        );                          
                    }
                    //ask user to login
                    else{
                        $("#loginModal").modal('show');                     
                    }
                }
        );      
        return false;
    });
    $(".buyLink").click(function(){
        var page = "forecheckLogin";
        $.get(
                page,
                function(result){
                    if("success"==result){
                        var num = $(".productNumberSetting").val();
                        location.href= $(".buyLink").attr("href")+"&num="+num;
                    }
                    //ask user to login
                    else{
                        $("#loginModal").modal('show');                     
                    }
                }
        );      
        return false;
    });
     
    $("button.loginSubmitButton").click(function(){
        var name = $("#name").val();
        var password = $("#password").val();
         
        if(0==name.length||0==password.length){
            $("span.errorMessage").html("Please enter the user name and password");
            $("div.loginErrorMessageDiv").show();           
            return false;
        }
         
        var page = "foreloginAjax";
        $.get(
                page,
                {"name":name,"password":password},
                function(result){
                    if("success"==result){
                        location.reload();
                    }
                    else{
                        $("span.errorMessage").html("Erro user name or password");
                        $("div.loginErrorMessageDiv").show();                       
                    }
                }
        );          
         
        return true;
    });
     
    $("img.smallImage").mouseenter(function(){
        var bigImageURL = $(this).attr("bigImageURL");
        $("img.bigImg").attr("src",bigImageURL);
    });
     
    $("img.bigImg").load(
        function(){
            $("img.smallImage").each(function(){
                var bigImageURL = $(this).attr("bigImageURL");
                img = new Image();
                img.src = bigImageURL;
                 
                img.onload = function(){
                    $("div.img4load").append($(img));
                };
            });     
        }
    );

});
 
</script>
 <style>
     button.all
     {
         display: inline-block;
         margin: 0px 10px;
         width: 180px;
     }
     button.buyButton
     {
         border: 1px solid #FFEDED;
         background-color: #FFEDED;
         text-align: center;
         line-height: 40px;
         font-size: 16px;
         color: red;
     }
     button.addCartButton
     {
         border: 1px solid rgba(255, 153, 155, 1);
         background-color: rgba(255, 153, 155, 1);
         text-align: center;
         line-height: 40px;
         font-size: 16px;
         color: white;
     }
 </style>
<div class="imgAndInfo">
 
    <div class="imgInimgAndInfo">
        <img src="img/productSingle/${p.firstProductImage.id}.jpg" class="bigImg">
        <div class="smallImageDiv">
            <c:forEach items="${p.productSingleImages}" var="pi">
                <img src="img/productSingle_small/${pi.id}.jpg" bigImageURL="img/productSingle/${pi.id}.jpg" class="smallImage">
            </c:forEach>
        </div>
        <div class="img4load hidden" ></div>
    </div>
     
    <div class="infoInimgAndInfo">
         
        <div class="productTitle">
            ${p.name}
        </div>

         
        <div class="productPrice">
            <div class="productPriceDiv">
            <div style="margin-top:15px">
                <span style="display:inline-block;width:110px">Original Price:</span>
                <span class="originalPrice">
                        <!--set the price at least 2 decimalss-->
                        RM  <fmt:formatNumber type="number" value="${p.orignalPrice}" minFractionDigits="2"/>
                    </span>
            </div>
                <div>
                    <span class="promotion">Promotion Price: </span>
                    <span class="promotionPrice">
                        RM <fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/>
                    </span>
                </div>
            </div>
        </div>
        <div class="productSaleAndReviewNumber">
            <div>Sales <span class="redColor boldWord"> ${p.saleCount }</span></div>
            <div>Reviews <span class="redColor boldWord"> ${p.reviewCount}</span></div>
        </div>
        <div class="productNumber">
            <span style="font-size:15px;margin-right:20px">Quantity</span>
            <span>
                 <a class="decreaseNumber" href="#nowhere">
                <span style="margin-right:10px">
                     <img src="img/site/jian.png">
                </span>
                </a>
                <span class="productNumberSettingSpan">
                <input class="productNumberSetting" type="text" value="1">
                </span>
                <a class="increaseNumber" href="#nowhere">
                <span style="margin-left:10px">
                   <img src="img/site/jia.png">
                </span>
                 </a>
                     
            </span>
        </div>
         
        <div class="buyDiv">
            <a class="buyLink" href="forebuyone?pid=${p.id}"><button class="all buyButton">Buy Now</button></a>
            <a href="#nowhere" class="addCartLink"><button class="all addCartButton">Add to Cart</button></a>
        </div>
    </div>
     
    <div style="clear:both"></div>
     
</div>