<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/23
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<title>Pay Success</title>
<div class="payedDiv">
	<div class="payedTextDiv">
		<img src="img/site/paySuccess.png">
		<span>Pay Success!</span>
		
	</div>
	<div class="payedAddressInfo">
		<ul>
			<li>Adress：${o.address} ${o.receiver} ${o.mobile }</li>
			<li>Total: <span class="payedInfoPrice">
			RM <fmt:formatNumber type="number" value="${param.total}" minFractionDigits="2"/>
			</li>
		</ul>
				
		<div class="paedCheckLinkDiv">
			You can check
			<a class="payedCheckLink" href="forebought">My Order</a>
		</div>
			
	</div>

</div>