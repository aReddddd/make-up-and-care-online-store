<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/19
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>

<title>Shopping Cart</title>
<script>
	var deleteOrderItem = false;
	var deleteOrderItemid = 0;
	$(function(){

		$("a.deleteOrderItem").click(function(){
			deleteOrderItem = false;
			var oiid = $(this).attr("oiid")
			deleteOrderItemid = oiid;
			$("#deleteConfirmModal").modal('show');
		});
		$("button.deleteConfirmButton").click(function(){
			deleteOrderItem = true;
			$("#deleteConfirmModal").modal('hide');
		});

		$('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
			if(deleteOrderItem){
				var page="foredeleteOrderItem";
				$.post(
						page,
						{"oiid":deleteOrderItemid},
						function(result){
							if("success"==result){
								$("tr.productItem[oiid="+deleteOrderItemid+"]").hide();
							}
							else{
								location.href="login.jsp";
							}
						}
				);

			}
		})

		$("img.cartProductItemIfSelected").click(function(){
			var selectit = $(this).attr("selectit")
			if("selectit"==selectit){
				$(this).attr("src","img/site/cartNotSelected.png");
				$(this).attr("selectit","false")
				$(this).parents("tr.productItem").css("background-color","#fff");
			}
			else{
				$(this).attr("src","img/site/cartSelected.png");
				$(this).attr("selectit","selectit")
				$(this).parents("tr.productItem").css("background-color","#FFF8E1");
			}
			syncSelect();
			syncCreateOrderButton();
			calcCartSumPriceAndNumber();
		});
		$("img.selectAllItem").click(function(){
			var selectit = $(this).attr("selectit")
			if("selectit"==selectit){
				$("img.selectAllItem").attr("src","img/site/cartNotSelected.png");
				$("img.selectAllItem").attr("selectit","false")
				$(".cartProductItemIfSelected").each(function(){
					$(this).attr("src","img/site/cartNotSelected.png");
					$(this).attr("selectit","false");
					$(this).parents("tr.productItem").css("background-color","#ffffff");
				});
			}
			else{
				$("img.selectAllItem").attr("src","img/site/cartSelected.png");
				$("img.selectAllItem").attr("selectit","selectit")
				$(".cartProductItemIfSelected").each(function(){
					$(this).attr("src","img/site/cartSelected.png");
					$(this).attr("selectit","selectit");
					$(this).parents("tr.productItem").css("background-color","#FFF8E1");
				});
			}
			syncCreateOrderButton();
			calcCartSumPriceAndNumber();


		});

		$(".orderItemNumberSetting").keyup(function(){
			var pid=$(this).attr("pid");
			var stock= $("span.orderItemStock[pid="+pid+"]").text();
			var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();

			var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
			num = parseInt(num);
			if(isNaN(num))
				num= 1;
			if(num<=0)
				num = 1;
			if(num>stock)
				num = stock;
			syncPrice(pid,num,price);
		});

		$(".numberPlus").click(function(){

			var pid=$(this).attr("pid");
			var stock= $("span.orderItemStock[pid="+pid+"]").text();
			var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
			var num= $(".orderItemNumberSetting[pid="+pid+"]").val();

			num++;
			if(num>stock)
				num = stock;
			syncPrice(pid,num,price);
		});
		$(".numberMinus").click(function(){
			var pid=$(this).attr("pid");
			var stock= $("span.orderItemStock[pid="+pid+"]").text();
			var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();

			var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
			--num;
			if(num<=0)
				num=1;
			syncPrice(pid,num,price);
		});

		$("button.createOrderButton").click(function(){
			var params = "";
			$(".cartProductItemIfSelected").each(function(){
				if("selectit"==$(this).attr("selectit")){
					var oiid = $(this).attr("oiid");
					params += "&oiid="+oiid;
				}
			});
			params = params.substring(1);
			location.href="forebuy?"+params;
		});

	})
	//Formatting the amount in thousands, such as 123456, will display as 123,456
	function formatMoney(num){
		num = num.toString().replace(/\$|\,/g,'');
		if(isNaN(num))
			num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num*100+0.50000000001);
		cents = num%100;
		num = Math.floor(num/100).toString();
		if(cents<10)
			cents = "0" + cents;
		for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
			num = num.substring(0,num.length-(4*i+3))+','+
					num.substring(num.length-(4*i+3));
		return (((sign)?'':'-') + num + '.' + cents);
	}
	//Determine if any items have been selected
	function syncCreateOrderButton(){
		var selectAny = false;
		$(".cartProductItemIfSelected").each(function(){
			if("selectit"==$(this).attr("selectit")){
				selectAny = true;
			}
		});
		if(selectAny){
			$("button.createOrderButton").css("background-color","rgba(255, 153, 155, 1)");
			$("button.createOrderButton").removeAttr("disabled");
		}
		else{
			$("button.createOrderButton").css("background-color","#CCCCCC");
			$("button.createOrderButton").attr("disabled","disabled");
		}
	}
	//Check select all,As long as any one of them is not selected,
	// then it's not all selected and then you can switch images to show
	// whether it's all selected or not
	function syncSelect(){
		var selectAll = true;
		$(".cartProductItemIfSelected").each(function(){
			if("false"==$(this).attr("selectit")){
				selectAll = false;
			}
		});
		if(selectAll)
			$("img.selectAllItem").attr("src","img/site/cartSelected.png");
		else
			$("img.selectAllItem").attr("src","img/site/cartNotSelected.png");
	}

	//Displays the total number of items selected and the total price
	function calcCartSumPriceAndNumber(){
		var sum = 0;
		var totalNumber = 0;
		$("img.cartProductItemIfSelected[selectit='selectit']").each(function(){
			var oiid = $(this).attr("oiid");
			var price =$(".cartProductItemSmallSumPrice[oiid="+oiid+"]").text();
			price = price.replace(/,/g, "");
			price = price.replace(/RM /g, "");
			sum += new Number(price);
			var num =$(".orderItemNumberSetting[oiid="+oiid+"]").val();
			totalNumber += new Number(num);
		});
		$("span.cartSumPrice").html("RM "+formatMoney(sum));
		$("span.cartTitlePrice").html("RM "+formatMoney(sum));
		$("span.cartSumNumber").html(totalNumber);
	}

	//According to item quantity and price, calculate subtotal price
	function syncPrice(pid,num,price){
		$(".orderItemNumberSetting[pid="+pid+"]").val(num);
		var cartProductItemSmallSumPrice = formatMoney(num*price);
		$(".cartProductItemSmallSumPrice[pid="+pid+"]").html("RM "+cartProductItemSmallSumPrice);
		calcCartSumPriceAndNumber();
		var page = "forechangeOrderItem";
		$.post(
				page,
				{"pid":pid,"number":num},
				function(result){
					if("success"!=result){
						location.href="login.jsp";
					}
				}
		);
	}

</script>
<style>
	div.cart
	{
		width:1100px;
		margin:10px auto;
		color: black;
	}
	div.cart button
	{
		background-color:#CBCBCB;
		border:0px solid #CBCBCB;
		color:white;
		width:270px;
		height:50px;
		font-size:18px;
		text-align:center;
		margin-left:5px;
		border-radius: 5px;
	}
	div.cartFoot
	{
		background-color: white;
		letter-spacing:0.5px;
		margin:20px 0;
		padding-left:20px;
		border:0.5px solid #CCCCCC;
		line-height:49px;
		border-radius: 8px;
	}

	tr.productItem
	{
		border:1px solid #CCCCCC;
	}
	td
	{
		padding:20px 20px;
	}
	th{
		padding:20px 20px;
	}
	div.productNum a
	{
		width: 14px;
		display: inline-block;
		text-align: center;
		color: black;
		text-decoration: none;
	}
	div.productNum input
	{
		border: solid 1px #CBCBCB;
		width: 42px;
		display: inline-block;
		text-align:center;
	}
</style>
<title>Cart</title>
<div class="cart">

	<div>
		<table class="cartProductTable" style="width:100%;font-size:15px;">
			<thead>
			<tr style="background-color:#E5E5E5;border-bottom: 2px solid black;">
				<th class="selectAndImage">
					<img selectit="false" class="selectAllItem" src="img/site/cartNotSelected.png">
					Select all
				</th>
				<th style="text-align:center;">Item infomation</th>
				<th>Price</th>
				<th>Quality</th>
				<th width="150px">Subtotal</th>
				<th width="30px">Operation</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${ois}" var="oi">
				<tr oiid="${oi.id}" class="productItem">
					<td>
						<img selectit="false" oiid="${oi.id}" class="cartProductItemIfSelected" src="img/site/cartNotSelected.png">
						<a style="display:none" href="#nowhere"><img src="img/site/cartSelected.png"></a>
						<img class="cartProductImg"  src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg">
					</td>
					<td>
						<div class="cartProductLinkOutDiv">
							<a href="foreproduct?pid=${oi.product.id}" class="cartProductLink">${oi.product.name}</a>
						</div>
					</td>
					<td>
						<span  class="cartProductItemPromotionPrice">RM ${oi.product.promotePrice}</span>

					</td>
					<td>

						<div class="cartProductChangeNumberDiv">
							<span class="hidden orderItemStock " pid="${oi.product.id}">${oi.product.stock}</span>
							<span class="hidden orderItemPromotePrice " pid="${oi.product.id}">${oi.product.promotePrice}</span>
							<a  pid="${oi.product.id}" class="numberMinus" href="#nowhere">-</a>
							<input pid="${oi.product.id}" oiid="${oi.id}" class="orderItemNumberSetting" autocomplete="off" value="${oi.number}">
							<a  stock="${oi.product.stock}" pid="${oi.product.id}" class="numberPlus" href="#nowhere">+</a>
						</div>

					</td>
					<td >
							<span class="cartProductItemSmallSumPrice" oiid="${oi.id}" pid="${oi.product.id}" >
							RM <fmt:formatNumber type="number" value="${oi.product.promotePrice*oi.number}" minFractionDigits="2"/>
							</span>

					</td>
					<td>
						<a class="deleteOrderItem" oiid="${oi.id}"  href="#nowhere">Delete</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>

		</table>
	</div>

	<div class="cartFoot">
		<img selectit="false" class="selectAllItem" src="img/site/cartNotSelected.png">
		<span style="font-size:15px;">Select all</span>

		<div class="pull-right">
			</span>
			<span style="font-size:15px;">Total (
				<span class="cartSumNumber" style="color:red;font-weight:bold;font-size:17px">0</span> items) :
			</span>
			<span class="cartSumPrice" style="color:red;font-weight:bold;font-size:22px">RM0.00</span>
			<button class="createOrderButton" disabled="disabled" >PROCEED TO CHECKOUT</button>
		</div>

	</div>

</div>