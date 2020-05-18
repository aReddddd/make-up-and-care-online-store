<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/23
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<div class="PayPageDiv">
	
	<div>
		<span class="confirmMoneyText">Please Pay (RM)</span>
		<span class="confirmMoney">
		RM <fmt:formatNumber type="number" value="${param.total}" minFractionDigits="2"/></span>
		
	</div>
	
	<div>
		<a href="forepayed?oid=${param.oid}&total=${param.total}"><button class="confirmPay">Confirm</button></a>
	</div>

</div>