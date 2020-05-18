<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/19
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Buy</title>
<html>

<head>
	<style>
		.buyPageDiv
		{
			margin:20px auto;
			max-width:1200px;
			min-height: 500px;
		}
		div.sumPageDiv
		{
			float:right;
			background-color:white;
			border:1px solid #cccccc;
			margin-left:20px;
			width:380px;
			height:430px;
			padding:25px;
		}
		table.productListTable
		{
			width:750px;
			font-size:13px;
		}
		table.productListTable th
		{
			font-weight:normal;
			font-size: 12px;
			text-align: center;
			padding:5px;
		}
		table.productListTable tr.rowborder td
		{
			background-color: white;
			height: 10px;
		}
		table.productListTable tr.rowheader
		{
			background-color: #EAEAEA;
			line-height:20px;
		}
		tbody.productListTableTbody td
		{
			text-align: center;
		}
		tr.orderItemTR td{
			border-bottom: 1px solid #E5E5E5;
			padding: 10px 0px;
		}
		img.orderItemImg{
			width: 50px;
			height: 50px;
			border: 1px solid #E9E9E9;
		}
		a.orderItemProductLink
		{
			color:black;
			font-size:15px;
		}
		span.orderItemSubtotal
		{
			color:red;
			font-weight:bold;
		}
		span.orderItemTotalSumSpan
		{
			color:red;
			font-size:18px;
			font-weight:bold;
		}
		button.submitOrderButton
		{
			border: 1px solid rgba(255, 153, 155, 1);
			background-color: rgba(255, 153, 155, 1);
			border-radius:3px;
			text-align: center;
			font-size: 16px;
			font-weight: 700;
			color: white;
			width:330px;
			height: 40px;
		}
		button.submitOrderButton:hover
		{
			color:red;
		}
		div.address
		{
			font-size:22px;
			font-weight:bold;
			margin-bottom:25px;
		}
		table.addressTable
		{
			font-size:12px;
		}
		table.addressTable td
		{
			vertical-align:top;
			height:30px;
			padding-right:5px;

		}
		table.addressTable textarea
		{
			height:50px;
			margin-bottom:15px;
			width:180px;
		}
		table.addressTable input
		{

			width:180px;
		}
		div.orderItemProductInfo a:hover
		{
			color: red;
		}
	</style>
</head>

<div class="buyPageDiv">
	<form action="forecreateOrder" method="post">
		<div>
			<div class="sumPageDiv" style="	font-size: 14px;">
				<div style="margin-bottom:15px;">
					<div class="address">Receiving Information</div>
					<div>
						<table class="addressTable">
							<tbody>
							<tr>
								<td class="firstColumn"><span class="glyphicon glyphicon-envelope "> Address</span>
									<span class="redStar">*</span>
								</td>
								<td><textarea placeholder="Please enter a detailed address." name="address"></textarea></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-globe"> Zip Code</span></td>
								<td><input type="text" placeholder="Fill in 000000, if you are not sure " name="post" >
								</td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-user"> Receiver</span>
									<span class="redStar">*</span>
								</td>
								<td><input type="text" placeholder="Please enter your receiver name" name="receiver"></td>
							</tr>
							<tr>
								<td ><span class="glyphicon glyphicon-phone"> Phone Number</span>
									<span class="redStar">*</span>
								</td>
								<td><input type="text" placeholder="Please enter your phone number" name="mobile"></td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="orderItemTotalSumDiv">
					<div style="font-size:22px;font-weight:bold;margin-bottom:25px;">Order Summary</div>
					<div style="margin-bottom:15px;">
						<span style="font-size:18px;">Total:</span>
						<span class="pull-right orderItemTotalSumSpan">RM
                        <fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/>
                    </span>
					</div>
				</div>
				<div class="submitOrderDiv">
					<button class="submitOrderButton" type="submit">
						Place Order</button>
				</div>
			</div>
			<table class="productListTable">
				<thead>
				<tr class="rowheader">
					<th class="productListTableFirstColumn" colspan="2">
						ITEMS</a>
					</th>
					<th>PRICE</th>
					<th>QUANTITY</th>
					<th>SUBTOTAL</th>
				</tr>
				<tr class="rowborder">
					<td colspan="2"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				</thead>
				<tbody class="productListTableTbody">
				<c:forEach items="${ois}" var="oi" varStatus="s">
					<tr class="orderItemTR">
						<td class="orderItemFirstTD"><img class="orderItemImg" src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
						<td class="orderItemProductInfo">
							<a  href="foreproduct?pid=${oi.product.id}" class="orderItemProductLink">
									${oi.product.name}
							</a>
						</td>
						<td>
							<span class="orderItemProductPrice">RM <fmt:formatNumber type="number" value="${oi.product.promotePrice}" minFractionDigits="2"/></span>
						</td>
						<td>
							<span class="orderItemProductNumber">${oi.number}</span>
						</td>
						<td><span class="orderItemSubtotal">
                        RM <fmt:formatNumber type="number" value="${oi.number*oi.product.promotePrice}" minFractionDigits="2"/>
                    </span></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</div>
<div style="clear:both;"></div>

