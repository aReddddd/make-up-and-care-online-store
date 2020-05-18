<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/19
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<%@include file="modal.jsp" %>

<style>
	body{
		font-size: 14px;
	}
	a{
		color:black;
	}
	a:hover{
		text-decoration:none;
		color:rgba(255, 153, 155, 1);
	}

	.pinkColor{
		color: rgba(255, 153, 155, 1) !important;
	}
	div.footer{
		margin: 20px auto;
		border-top-style: solid;
		border-top-width: 1px;
		border-top-color: #e7e7e7;
	}

	div.footer_desc{
		border-top-style: solid;
		border-top-width: 1px;
		border-top-color: #e7e7e7;
		padding-top: 30px;
		margin: 0px 20px;
		padding-left: 100px;

	}
	div.footer_desc div.descColumn{
		width: 20%;
		float: left;
		padding-left: 60px;
	}
	div.footer_desc div.descColumn span.descColumnTitle{
		color: #646464;
		font-weight: bold;
		font-size: 16px;
	}
	div.footer_desc a{
		display: block;
		padding-top: 3px;
	}


</style>

<div style="display: block;" class="footer" id="footer">

	<div id="footer_desc" class="footer_desc">
		<div class="descColumn">
			<span class="descColumnTitle">Shopping Guide</span>
			<a href="register.jsp" >Free Register</a>
			<a href="login.jsp" >Login</a>
		</div>
		<div class="descColumn">
			<span class="descColumnTitle">Garantee Platform</span>
			<a href="#nowhere" >Invoice Garantee</a>
			<a href="#nowhere" >After sale service rules</a>
			<a href="#nowhere" >Compensate</a>
		</div>
		<div class="descColumn">
			<span class="descColumnTitle">Payment Method</span>
			<a href="#nowhere" >Fast Payment</a>
			<a href="#nowhere" >Credit card</a>
			<a href="#nowhere" >Alipay</a>
			<a href="#nowhere" >pay on delivery</a>
		</div>

		<div class="descColumn" style="width:25%">
			<span class="descColumnTitle">Mobile "Makeup & Care" website</span>
			<a style="text-align:center" href="#nowhere" ><img src="img/site/ma.png"></a>
		</div>

	</div>
	<div style="clear:both"></div>
</div>
</body>
</html>