<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/22
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<title>Comfirm Receiving</title>
<div class="confirmPayPageDiv">

	<div class="confirmPayOrderItemDiv">
		<table class="confirmPayOrderItemTable">
			<thead>
				<th colspan="2">Item</th>
				<th width="120px">Quality</th>
				<th width="200px">Price </th>
			</thead>
			<c:forEach items="${o.orderItems}" var="oi">
				<tr>
					<td><img width="50px" src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
					<td class="confirmPayOrderItemProductLink">
						<a href="#nowhere">${oi.product.name}</a>
					</td>
					<td>${oi.number}</td>
					<td><span class="conformPayProductPrice">RM <fmt:formatNumber type="number" value="${oi.product.promotePrice}" minFractionDigits="2"/></span></td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="confirmPayOrderItemText pull-right">
			Total： <span class="confirmPayOrderItemSumPrice">RM <fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/></span>
		</div>
		
		
	</div>
	<div class="confirmPayButtonDiv">
		<a href="foreorderConfirmed?oid=${o.id}"><button class=" confirmPayButton">Confirm </button></a>
	</div>
</div>