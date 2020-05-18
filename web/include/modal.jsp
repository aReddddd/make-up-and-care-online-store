<%--
  Created by IntelliJ IDEA.
  User: Kios
  Date: 2019/12/19
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!--Add tabindex=-1 to modal to switch the focus only in modal using the TAB key-->
<div class="modal " id="loginModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog loginModaldiv">
	        <div class="modal-content">
					<div class="loginDivInProductPage">
						<div class="loginErrorMessageDiv">
							<div class="alert alert-danger" >
								<span class="errorMessage"></span>
							</div>
						</div>
							
						<div class="LoginTitle">LOGIN</div>
						<div class="loginInput " >
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-user"></span>
							</span>
							<input id="name" name="name" placeholder="User Name" type="text">
						</div>
						
						<div class="loginInput " >
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-lock"></span>
							</span>
							<input id="password" name="password"  type="password" placeholder="Password" type="text">
						</div>
						<div>
							<a href="#nowhere" style="text-decoration:none">Forgot Password?</a>
							<span  style="float:right;"><span>New User? </span><a href="register.jsp"> Register</a></span>
						</div>
						<div style="margin-top:20px">
							<button class="btn btn-block redButton loginSubmitButton" type="submit">Login</button>
						</div>
					</div>	
	      </div>
	</div>
</div>

<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog deleteConfirmModalDiv">
       <div class="modal-content">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">Delete?</h4>
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
            <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">Confirm</button>
          </div>
        </div>
      </div>
	</div>
</div>