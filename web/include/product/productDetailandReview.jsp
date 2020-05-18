<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/17
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<style>
	a.selected
	{
		text-decoration:none;
		border: 1px solid #cfbfb1;
		color: rgba(255, 153, 155, 1);
		display: inline-block;
		font-size:13px;
		font-weight: bold;
		line-height: 46px;
		width: 130px;
		text-align: center;
		position: relative;
	}
	a.selected:before
	{
		content:"";
		display: block;
		border-width: 1px;
		border-color: rgba(255, 153, 155, 1);
		border-style: solid;
		width: 130px;
		height: 0;
		position: absolute;
		top: -1px;
		margin-left: -1px;
	}
	a.selected:after
	{
		content: "";
		display: block;
		border-color: rgba(255, 153, 155, 1) transparent transparent;
		border-style: solid;
		border-width: 5px;
		width: 0;
		height: 0;
		position: absolute;
		top: -1px;
		left: 50%;
		margin-left: -5px;
	}
	a.review
	{
		font-size:13px;
		padding:0px 20px;
		text-decoration:none;
		border-right: 1px dotted #D2D2D2;
		color: #333333;
	}
	a.details{
		padding:0px 20px;color:#333333;
		text-decoration:none;
	}
</style>
<script>
	$(function(){
		$("div.productReviewDiv").hide();
		$("a.review").click(function(){
			$("div.productReviewDiv").show();
			$("div.productDetailDiv").hide();
		});
		$("a.details").click(function(){
			$("div.productReviewDiv").hide();
			$("div.productDetailDiv").show();
		});

	})
</script>
<!--Details-->
<div class="productDetailDiv" style="margin:10px auto;width:800px;display: block;">
	<div style="border:1px solid #DFDFDF;border-left:none;margin:10px;">
		<a class="selected" href="#nowhere">Product Details</a>
		<a class="review" href="#nowhere">Reviews
			<span >${p.reviewCount}</span> </a>
	</div>

	<div style="margin:0px auto;width:800px;display: block;">
		<c:forEach items="${p.productDetailImages}" var="pi">
			<img src="img/productDetail/${pi.id}.jpg">
		</c:forEach>
	</div>
</div>
<!--Review-->
<div class="productReviewDiv" style="margin:10px auto;width:800px;display: block;">
	<div style="border:1px solid #DFDFDF;margin:10px;">
		<a class="details" href="#nowhere">Product Details</a>
		<a class="selected" href="#nowhere">Reviews
			<span >${p.reviewCount}</span> </a>
	</div>
	<div style="margin:10px">
		<c:forEach items="${reviews}" var="r">
			<div style="border-bottom:1px solid #E3E3E3;margin:10px 0px;">
				<div class="reviewContent">
					<div>
							${r.content}
					</div>
					<div style="margin: 15px 0px 0px 0px;color: #CCCCCC;"><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd"/></div>
				</div>
				<div style="color: #404040;margin: 5px 20px;padding: 10px 0;">
						<span style="color: #999999;">（Anonymous）</span>
				</div>
				<div style="clear:both"></div>
			</div>
		</c:forEach>
	</div>
</div>

