<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/16
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<title>SIGNUP</title>
<script>
    $(function () {

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility", "visible");
        </c:if>

        $(".registerForm").submit(function () {
            if ( $("#name").val().length==0) {
                $("span.errorMessage").html("Please Enter User Name");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            if ( $("#password").val().length==0) {
                $("span.errorMessage").html("Please Enter Password");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            if ($("#repeatpassword").val().length==0) {
                $("span.errorMessage").html("Please re-input Password");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            if ($("#password").val() != $("#repeatpassword").val()) {
                $("span.errorMessage").html("Twice Password is not the same");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            return true;
        });
    })
</script>

<style>
    body {
        font-size: 15px;
    }

    div.register {
        background-color: #F8F8FF;
        margin: 20px auto;
        height: 600px;
    }

    div.regForm
    {
        position:relative;
        top:30px;
        background-color:white;
        width:350px;
        height:500px;
        margin:0 auto;
        border:1px solid white;
        -moz-border-radius: 15px;
        -webkit-border-radius: 15px;
        border-radius:10px;
    }
    div.regForm input{
        border:1px solid #C3C3C3;
        border-radius:5px;
        margin:5px;
        margin-left:0px;
        outline:medium;
        padding:10px;
        width:305px;
        height:30px;
        font-size:12px;
    }
    div.regForm input:focus
    {
        border-style:solid;
        border-color: rgba(255, 153, 155, 1);
        box-shadow: 0 0 5px rgba(255, 153, 155, 1);
    }
    .glyphicon {
        color: rgba(255, 153, 155, 1);
        font-size: 6px;
        margin-left: 7px;
    }

    button {
        width: 300px;
        height: 36px;
        border-radius: 2px;
        color: white;
        background-color: rgba(255, 153, 155, 1);
        border-width: 0px;
    }

    button:hover {
        text-decoration: none;
        color: red;
    }
    div.registerErrorMessageDiv
    {
        width: 300px;
    }
</style>
<div class="register">
    <div class="regForm">
        <div class="registerErrorMessageDiv">
            <div class="alert alert-danger" >
                <span class="errorMessage"></span>
            </div>
        </div>
        <form method="post" action="foreregister" class="registerForm">
            <div style="padding:20px;">
                <div>
                    <p style="font-size:27px;font-weight:bold;">Create account</p>
                </div>
                <div style="height:10px;"></div>
                <div style="padding-left:2px; ">
                    <div style="font-weight:bold;">Your name</div>
                    <div>
                        <input type="text" placeholder="Email/Phone Number/Name" name="name" id="name">
                    </div>
                    <span class="glyphicon glyphicon-alert"></span></span>
                    <span style="font-size:12px;">Use for login.</span>
                </div>
                <div style="padding-left:2px;">
                    <div style="font-weight:bold;margin-top:10px">Password</div>
                    <div>
                        <input type="password" placeholder="Your password" name="password" id="password">
                    </div>
                    <span class="glyphicon glyphicon-alert"></span></span>
                    <span style="font-size:12px;">Passwords must be at least 6 characters.</span>
                </div>
                <div style="padding-left:2px;">
                    <div style="font-weight:bold;margin-top:10px">Re-enter password</div>
                    <div>
                        <input type="password" placeholder="Your password" name="repassword" id="repeatpassword">
                    </div>
                    <span class="glyphicon glyphicon-alert"></span></span>
                    <span style="font-size:12px;">Make sure you enter the same password twice.</span>
                </div>
                <div style="font-weight:bold;margin-top:20px;text-align:center;">
                    <a href="#nowhere">
                        <button>Create your account</button>
                    </a>
                </div>
                <div style="margin-top:10px;float:right">
                    <span>Already have an account?</span>
                    <span><a href="login.jsp">Login</a> </span>
                </div>
            </div>
        </form>
    </div>
</div>