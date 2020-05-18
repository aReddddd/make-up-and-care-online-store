<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/22
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

	<style>

		body {
			font-size: 14px;
			font-family: Arial;
			min-width:1024px;
		}
		a {
			color: #999;
		}
		a:hover {
			text-decoration: none;
			color: rgba(255, 153, 155, 1);
		}


		div.categoryWithCarousel {
			width: 100%;
			position:relative;
		}

		div.carouselBackgroundDiv{
			width:100%;
			height:510px;
			background-color: rgba(239, 200, 207, 1);
			position: absolute;
			top:36px;
			z-index:-1;
		}

		div.categoryWithCarousel div.headbar {
			background-color: rgba(255, 153, 155, 1);
		}


		div.carousel-inner div.item img{

		}

		div.categoryWithCarousel div.categoryMenu {
			width: 200px;
			background-color: #e2e2e3;
			margin-left: 20px;
			position: absolute;
			left: 0;
			top: 0;
			z-index: 1;
		}



		div.categoryWithCarousel div.eachCategory:hover {
			background-color: white;
		}

		div.categoryWithCarousel div.eachCategory span {
			margin-right: 10px;
			margin-bottom:30px;
		}

		div.categoryWithCarousel div.eachCategory {

			line-height: 30px;
			padding-left: 10px;
			background-color:rgba(182, 221, 246, 0.75);
			font-size: 16px;
		}

		div.categoryWithCarousel div.rightMenu {
			display: inline-block;
		}

		div.categoryWithCarousel div.rightMenu img {
			height: 30px;
		}

		div.categoryWithCarousel div.rightMenu span {
			margin: 0px 20px 0px 20px;
		}

		div.categoryWithCarousel div.rightMenu a {
			font-size: 16px;
			color: white;
		}

		div.categoryWithCarousel div.head {
			margin-left: 250px;
			width: 200px;
			background-color: rgba(6, 173, 219, 1);
			height: 36px;
			line-height: 36px;
			font-size: 16px;
			font-weight: bold;
			color: white;
			margin-left: 20px;
			display: inline-block;
		}

		div.productsAsideCategorys a {
			color: #000;
			font-size: 14px;
			margin: 8px;
		}

		div.productsAsideCategorys a:hover {
			color: #C40000;
			text-decoration: none;
		}



		div.categoryMenu a {
			color: #000;
		}

		div.categoryMenu a:hover {
			color: lightskyblue;
			text-decoration: none;
		}

		div.homepageDiv{
			position:relative;
		}



		div.productItem img {
			width: 187px;
			height: 190px;
		}

		div.productItem  img:hover {
			opacity: 0.7;
			filter: alpha(opacity = 70);
		}




	</style>

<div class="homepageDiv">

	<script>
		$(function(){
			//change color
			$("div.eachCategory").mouseenter(function(){
				var cid = $(this).attr("cid");
				$("div.eachCategory[cid="+cid+"]").css("background-color","rgb(135, 206, 250)");
				$("div.eachCategory[cid="+cid+"] a").css("color","white");
			});
			$("div.eachCategory").mouseleave(function(){
				var cid = $(this).attr("cid");
				$("div.eachCategory[cid="+cid+"]").css("background-color","rgba(182, 221, 246, 0.75)");
				$("div.eachCategory[cid="+cid+"] a").css("color","black");

			});

			//change the position of the top bar
			var left = $("div#carousel-of-product").offset().left;
			$("div.categoryMenu").css("left",left-20);
			$("div.categoryWithCarousel div.head").css("margin-left",left);
			$("div.productsAsideCategorys").css("left",left-20);

		});
		//show the list and hide
		function blockAndHidden() {
			var elementById = document.getElementById("categoryMenu");
			if(elementById.style.display === "none"){
				$("#categoryMenu").show();
			}else{
				$("#categoryMenu").hide();
			}
		}

	</script>
<body>

<title>Make Up And Care</title>
	
<div class="categoryWithCarousel">


<div class="headbar show1">
	<div class="head " >
	
		<span style="margin-left:10px" class="glyphicon glyphicon-th-list"></span>
		<span style="margin-left:10px" onclick="blockAndHidden()">Category</span>
		
	</div>
	
	<div class="rightMenu">

		<c:forEach items="${cs}" var="c" varStatus="st">
			<c:if test="${st.count<=4}">
				<span>
				<a href="forecategory?cid=${c.id}">
					${c.name}
				</a></span>			
			</c:if>
		</c:forEach>
	</div>
	
</div>

<div style="position: relative" id="classOverElement">
	<div class="categoryMenu" id="categoryMenu" style="display:none" onfocus="blockAndHidden()">
		<c:forEach items="${cs}" var="c">
			<div cid="${c.id}" class="eachCategory" style="height: 33px">
				<a href="forecategory?cid=${c.id}">
						${c.name}
				</a>
			</div>
		</c:forEach>
	</div>
</div>





<%@include file="carousel.jsp" %>

<div class="carouselBackgroundDiv">
</div>

</div>





