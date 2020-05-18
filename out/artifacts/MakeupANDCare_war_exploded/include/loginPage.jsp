<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/16
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<title>Login</title>>
<script>
$(function(){
	
	<c:if test="${!empty msg}">
	$("span.errorMessage").html("${msg}");
	$("div.loginErrorMessageDiv").show();		
	</c:if>
	
	$("form.loginForm").submit(function(){
		if($("#name").val().length==0||$("#password").val().length==0){
			$("span.errorMessage").html("Please Input user name and password");
			$("div.loginErrorMessageDiv").show();			
			return false;
		}
		return true;
	});
	
	$("form.loginForm input").keyup(function(){
		$("div.loginErrorMessageDiv").hide();	
	});

})
</script>

<style>
	body{
		font-size:13px;
		font-family:Arial;
	}
	#loginDiv
	{
		background-color:#F8F8FF;
		height:500px;
		margin-top:50px;
	}
	div.login
	{
		position:relative;
		top:50px;
		background-color:white;
		margin:40px auto;
		width:400px;
		height:400px;
		padding:60px 25px 80px 25px;
		border:1px solid white;
		-moz-border-radius: 15px;
		-webkit-border-radius: 15px;
		border-radius:10px;
	}
	div.loginInput
	{
		border:1px solid #CBCBCB;
		margin:20px 0px;
		width:340px;
		border-radius:3px;
	}
	span.inputIconuser
	{
		background-color:#CBCBCB;
		width:40px;
		height:40px;
		display:inline-block;
		border-radius:3px;
		position:relative;
		top:-1px;
	}
	span.inputIconlock
	{
		background-color:#CBCBCB;
		width:40px;
		height:40px;
		display:inline-block;
		border-radius:3px;
		position:relative;
		top:-0.5px;
	}
	span.inputIconuser span.glyphicon
	{
		position:relative;
		font-size:23px;
		position:relative;
		left:9px;
		top:9px;
	}
	span.inputIconlock span.glyphicon
	{
		position:relative;
		font-size:23px;
		position:relative;
		left:9px;
		top:9px;
	}
	div.loginInput input
	{
		position:relative;
		display:inline-block;
		border:none;
		width:290px;
		height:38px;
		outline:medium;
	}
	input:focus
	{
		border-style:solid;
		border-color: rgba(255, 153, 155, 1);
		box-shadow: 0 0 5px rgba(255, 153, 155, 1);
	}
	a:hover{
		text-decoration:none;
		color:#C40000;
	}
	button{
		font-size:18px;
		background-color: rgba(255, 153, 155, 1);
		color:white;
		font-weight:bold;
		border-radius:10px;
	}
</style>
<div id="loginDiv" style="position: relative">

	<form class="loginForm" action="forelogin" method="post">
		<div id="login" class="login">
			<div class="loginErrorMessageDiv">
				<div class="alert alert-danger" >
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
				  	<span class="errorMessage"></span>
				</div>
			</div>
			<div style="font-size:28px;font-weight:bold;">Login</div>
			<div class="loginInput ">
                <span class="inputIconuser ">
                    <span class=" glyphicon glyphicon-user"></span>
                </span>
				<input type="text" outline="none" placeholder="Phone Number/Email" name="name" id="name">
			</div>
			
			<div class="loginInput " >
				<span class="inputIconlock ">
                    <span class=" glyphicon glyphicon-lock"></span>
                </span>
				<input type="password" placeholder="Password" name="password" id="password">
			</div>

			<div>
				<a href="#nowhere" style="text-decoration:none">Forgot Password?</a>
				<span  style="float:right;"><span>New User? </span><a href="register.jsp"> Register</a></span>
			</div>
			<div style="margin-top:20px">
				<button type="submit" class="btn btn-block">Login</button>
			</div>
		</div>	
	</form>


</div>	