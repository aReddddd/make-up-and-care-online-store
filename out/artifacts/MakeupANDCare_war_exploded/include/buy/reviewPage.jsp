<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/23
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<title>Review</title>
<div class="reviewDiv">
	<div class="reviewProductInfoDiv">
		<div class="reviewProductInfoImg"><img width="400px" height="400px" src="img/productSingle/${p.firstProductImage.id}.jpg"></div>
		<div class="reviewProductInfoRightDiv">
			<div class="reviewProductInfoRightText">
				${p.name}
			</div>
			<table class="reviewProductInfoTable">
				<tr>
					<td width="75px">price:</td>
					<td><span class="reviewProductInfoTablePrice">RM <fmt:formatNumber type="number" value="${p.orignalPrice}" minFractionDigits="2"/></span> </td>
				</tr>
				<tr>
					<td>Sales:</td>
					<td><span class="reviewProductInfoTableSellNumber">${p.saleCount}</span> </td>
				</tr>
			</table>
			<c:if test="${param.showonly!=true}">
				<div class="makeReviewDiv">
					<form method="post" action="foredoreview">
						<table class="makeReviewTable">
							<tr>
								<td class="makeReviewTableFirstTD">Comment<span class="reviewStasticsNumber"> ${p.reviewCount}</span></td>
							</tr>
							<tr>
								<td><textarea name="content"></textarea></td>
							</tr>
						</table>
						<div class="makeReviewButtonDiv">
							<input type="hidden" name="oid" value="${o.id}">
							<input type="hidden" name="pid" value="${p.id}">
							<button style="width:100px;" type="submit">Submit</button>
						</div>
					</form>
				</div>
			</c:if>
		</div>
		<div style="clear:both"></div>
	</div>

	<c:if test="${param.showonly==true}">
		<div style="margin-top:20px;font-size: 20px">Review<span class="reviewStasticsNumber"> ${p.reviewCount}</span></div>
	<div class="reviewDivlistReviews">
		<c:forEach items="${reviews}" var="r">
			<div class="reviewDivlistReviewsEach">
				<div class="reviewDate"><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd"/></div>
				<div class="reviewContent">${r.content}</div>
				<div class="reviewUserInfo pull-right">${r.user.anonymousName}<span class="reviewUserInfoAnonymous">(Annoynomus)</span></div>
			</div>
		</c:forEach>
	</div>
	</c:if>

</div>