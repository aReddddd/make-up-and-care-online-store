<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/17
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<title>Seaching Result</title>
<script>
	$(function(){
		$("input.sortBarPrice").keyup(function(){
			var num= $(this).val();
			if(num.length==0){
				$("div.productUnit").show();
				return;
			}

			num = parseInt(num);
			if(isNaN(num))
				num= 1;
			if(num<=0)
				num = 1;
			$(this).val(num);


			var begin = $("input.beginPrice").val();
			var end = $("input.endPrice").val();
			if(!isNaN(begin) && !isNaN(end)){
				console.log(begin);
				console.log(end);
				$("div.productUnit").hide();
				$("div.productUnit").each(function(){
					var price = $(this).attr("price");
					price = new Number(price);

					if(price<=end && price>=begin)
						$(this).show();
				});
			}

		});
	});
</script>
<div class="categorySortBar">
<table class="categorySortBarTable">
	<tr>
		<td style="width: 120px"><span>Sort By Price </span></td>
		<td><input class="sortBarPrice beginPrice" type="text" placeholder="Low"></td>
		<td class="grayColumn priceMiddleColumn">To</td>
		<td><input class="sortBarPrice endPrice" type="text" placeholder="High"></td>
	</tr>
</table>
</div>
<div class="searchProducts">
	<!--div width limitation make only 4 item in one column-->
	<c:forEach items="${ps}" var="p">
		<div class="productUnit" price="${p.promotePrice}">
			<div class="productUnitFrame">
				<a href="foreproduct?pid=${p.id}">
					<img class="productImage" src="img/productSingle_middle/${p.firstProductImage.id}.jpg">
				</a>
				<a class="productLink" href="foreproduct?pid=${p.id}">
						${fn:substring(p.name, 0, 50)}
				</a>
				<span class="productPrice">RM <fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/></span>
				<div class="show1 productInfo">
					<span class="monthDeal ">Sales <span class="productDealNumber">${p.saleCount}</span></span>
					<span class="productReview pull-right">Reviews <span class="productReviewNumber">${p.reviewCount}</span></span>

				</div>
			</div>
		</div>
	</c:forEach>
	<c:if test="${empty ps}">
		<div class="noMatch">No Search Result<div>
	</c:if>
	
		<div style="clear:both"></div>
</div>