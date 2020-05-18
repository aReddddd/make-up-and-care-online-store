<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/21
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!--param get categorycount from the url and use them directly in the page-->
<c:if test="${empty param.categorycount}">
	<c:set var="categorycount" scope="page" value="100"/>
</c:if>
	
<div class="categoryProducts">
	<!--div width limitation make only 4 item in one column-->
	<c:forEach items="${c.products}" var="p" varStatus="stc">
		<c:if test="${stc.count<=categorycount}">
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
		</c:if>
	</c:forEach>
		<div style="clear:both"></div>
</div>