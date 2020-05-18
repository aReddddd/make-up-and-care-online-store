<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/19
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>

<head>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/fore/forestyle.css" rel="stylesheet">
</head>
<style>
    body {
        font-size: 14px;
        font-family: Arial;
        min-width: 1024px;
    }

    a {
        color: #999;
    }

    .pinkColor {
        color: rgba(255, 153, 155, 1) !important;
    }

    nav.top span, nav.top a {
        color: #999;
        margin: 0px 8px 0px 8px;
        font-size: 14px;

    }

    nav.top a:hover {
        color: rgba(255, 153, 155, 1);
    }


    div.searchDiv input {
        width: 350px;
        border: 1px solid transparent;
        height: 36px;
        margin: 1px;
        outline: none;
    }

    div.searchDiv button {
        width: 130px;
        border: 1px solid transparent;
        background-color: rgba(255, 153, 155, 1);
        color: white;
        font-size: 20px;
        font-weight: bold;
    }

    div.searchDiv button:hover {
        background-color: rgb(153, 222, 255);
    }


    a:hover {
        text-decoration: none;
        color: rgba(255, 153, 155, 1);
    }
    img.logo {
        position: absolute;
        left: 200px;
        top: 30px;
        width:200px;
        height: 160px;
    }

</style>
<script>

    function formatMoney(num){
        num = num.toString().replace(/\$|\,/g,'');
        if(isNaN(num))
            num = "0";
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num*100+0.50000000001);
        cents = num%100;
        num = Math.floor(num/100).toString();
        if(cents<10)
            cents = "0" + cents;
        for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
            num = num.substring(0,num.length-(4*i+3))+','+
                num.substring(num.length-(4*i+3));
        return (((sign)?'':'-') + num + '.' + cents);
    }
    function checkEmpty(id, name){
        var value = $("#"+id).val();
        if(value.length==0){

            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }



</script>
<nav class="top ">
    <div>
    <a href="#${contextPath}">
        <span class="glyphicon glyphicon glyphicon-home pinkColor"></span>
        <a href="forehome">HOME</a>
    </a>
    <c:if test="${!empty user}">
        <a href="login.jsp">${user.name}</a>
        <a href="forelogout">EXIT</a>
    </c:if>
    <c:if test="${empty user}">
        <a href="login.jsp"> LOGIN</a>
        <a href="register.jsp">SIGNUP</a>
    </c:if>
			<a href="forebought">MY ORDER</a>
	<a href="forecart">
			<span class=" glyphicon glyphicon-shopping-cart pinkColor"></span>
	<strong>${cartTotalItemNumber}</strong></a>
	</div>

</nav>







