<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/23
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>

<title>My Order</title>>
<script>
	var deleteOrder = false;
	var deleteOrderid = 0;

	$(function() {
		//getAttribute orderStatus
		$("a[orderStatus]").click(function () {

			//getAttribute orderStatus
			var orderStatus = $(this).attr("orderStatus");
			if ('all' == orderStatus) {
				$("table[orderStatus]").show();
			} else {
				$("table[orderStatus]").hide();
				$("table[orderStatus=" + orderStatus + "]").show();
			}

			$("div.orderType div").removeClass("selectedOrderType");
			$(this).parent("div").addClass("selectedOrderType");
		});

		$("a.deleteOrderLink").click(function () {
			deleteOrderid = $(this).attr("oid");
			deleteOrder = false;
			$("#deleteConfirmModal").modal("show");
		});

		$("button.deleteConfirmButton").click(function () {
			deleteOrder = true;
			$("#deleteConfirmModal").modal('hide');
		});

		$('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
			if (deleteOrder) {
				var page = "foredeleteOrder";
				$.post(
						page,
						{"oid": deleteOrderid},
						function (result) {
							if ("success" == result) {
								$("table.orderListItemTable[oid=" + deleteOrderid + "]").hide();
							} else {
								location.href = "login.jsp";
							}
						}
				)

			}
		})

	})

</script>

<div class="boughtDiv">
	<div class="orderType">
		<div class="selectedOrderType"><a orderStatus="all" href="#nowhere">All Order</a></div>
		<div><a  orderStatus="waitPay" href="#nowhere">Not Pay</a></div>
		<div><a  orderStatus="waitDelivery" href="#nowhere">Not Deliver</a></div>
		<div><a  orderStatus="waitConfirm" href="#nowhere">Not Comfirm</a></div>
		<div><a  orderStatus="waitReview" href="#nowhere" class="noRightborder">Not Review</a></div>
	</div>
	<div style="clear:both"></div>
	<div class="orderListTitle">
		<table class="orderListTitleTable">
			<tr>
				<td width="450px;">ITEM</td>
				<td width="110px">PRICE</td>
				<td width="100px">QUANTITY</td>
				<td width="110px">TOTAL</td>
				<td width="150px">OPERATION</td>
			</tr>
		</table>

	</div>

	<div class="orderListItem">
		<c:forEach items="${os}" var="o">
			<table class="orderListItemTable" orderStatus="${o.status}" oid="${o.id}">
				<tr class="orderListItemFirstTR">
					<td colspan="2">
						<b><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></b>
						<span>Order Number:  ${o.orderCode}</span>
					</td>
					<td  colspan="2"></td>
					<td colspan="1">
					</td>
					<td class="pull-right orderItemDeleteTD">
						<a class="deleteOrderLink" oid="${o.id}" href="#nowhere">
							<span  class="orderListItemDelete glyphicon glyphicon-trash"></span>
						</a>

					</td>
				</tr>
				<c:forEach items="${o.orderItems}" var="oi" varStatus="st">
					<tr class="orderItemProductInfoPartTR" >
						<td class="orderItemProductInfoPartTD">
							<img width="80" height="80" src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg">
						</td>
						<td class="orderItemProductInfoPartTD">
							<div class="orderListItemProductLinkOutDiv" >
								<a href="foreproduct?pid=${oi.product.id}">${oi.product.name}</a>
							</div>
						</td>
						<td  class="orderItemProductInfoPartTD" width="100px">

							<div class="orderListItemProductOriginalPrice">RM <fmt:formatNumber type="number" value="${oi.product.orignalPrice}" minFractionDigits="2"/></div>
							<div class="orderListItemProductPrice">RM <fmt:formatNumber type="number" value="${oi.product.promotePrice}" minFractionDigits="2"/></div>


						</td>
						<!--It only needs to be executed once -->
						<c:if test="${st.count==1}">

							<td valign="center" rowspan="${fn:length(o.orderItems)}" class="orderListItemNumberTD orderItemOrderInfoPartTD" width="100px">
								<span class="orderListItemNumber">${o.totalNumber}</span>
							</td>
							<td valign="center" rowspan="${fn:length(o.orderItems)}" width="120px" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD">
								<div class="orderListItemProductRealPrice">RM <fmt:formatNumber  minFractionDigits="2"  maxFractionDigits="2" type="number" value="${o.total}"/></div>
							</td>
							<td valign="center" rowspan="${fn:length(o.orderItems)}" class="orderListItemButtonTD orderItemOrderInfoPartTD" width="100px">
								<c:if test="${o.status=='waitConfirm' }">
									<a href="foreconfirmPay?oid=${o.id}">
										<button class="orderListItem">Comfirm</button>
									</a>
								</c:if>
								<c:if test="${o.status=='waitPay' }">
									<a href="forepay?oid=${o.id}&total=${o.total}">
										<button class="orderListItem">Pay</button>
									</a>
								</c:if>

								<c:if test="${o.status=='waitDelivery' }">
									<span>Wait for Delevery</span>
								</c:if>

								<c:if test="${o.status=='waitReview' }">
									<a href="forereview?oid=${o.id}">
										<button  class="orderListItem">Review</button>
									</a>
								</c:if>
							</td>
						</c:if>
					</tr>
				</c:forEach>

			</table>
		</c:forEach>

	</div>

</div>