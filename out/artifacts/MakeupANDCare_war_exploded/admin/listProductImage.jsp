

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
$(function(){
	$(".addFormSingle").submit(function(){
		if(checkEmpty("filepathSingle","ImageFile")){
			$("#filepathSingle").value("");
			return true;
		}
		return false;
	});
	$(".addFormDetail").submit(function(){
		if(checkEmpty("filepathDetail","ImageFile"))
			return true;
		return false;
	});
});

</script>

<title>Manage Product Image</title>


<div class="workingArea">
		<ol class="breadcrumb">
		  <li><a href="admin_category_list">All Categories</a></li>
		  <li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li>
		  <li class="active">${p.name}</li>
		  <li class="active">Manage Product Image</li>
		</ol>

	<table class="addPictureTable" align="center">
		<tr>
			<td class="addPictureTableTD">
			  <div>
				<div class="panel panel-warning addPictureDiv">
					<div class="panel-heading">Add new product<b class="text-primary"> single </b>image</div>
					  <div class="panel-body">
					    	<form method="post" class="addFormSingle" action="admin_productImage_add" enctype="multipart/form-data">
					    		<table class="addTable">
					    			<tr>
					    				<td>Please select local image(400*400 is best)</td>
					    			</tr>
					    			<tr>
					    				<td>
					    					<input id="filepathSingle" type="file" name="filepath" />
					    				</td>
					    			</tr>
					    			<tr class="submitTR">
					    				<td align="center">
					    					<input type="hidden" name="type" value="type_single" />
					    					<input type="hidden" name="pid" value="${p.id}" />
					    					<button type="submit" class="btn btn-success">Submit</button>
					    				</td>
					    			</tr>
					    		</table>
					    	</form>
					  </div>
				  </div>			  
			  	<table class="table table-striped table-bordered table-hover  table-condensed"> 
					<thead>
						<tr class="success">
							<th>ID</th>
							<th>Product single picture thumbnail</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pisSingle}" var="pi">
							<tr>
								<td>${pi.id}</td>
								<td>
								<a title="Click here to view original image" href="img/productSingle/${pi.id}.jpg"><img height="50px" src="img/productSingle/${pi.id}.jpg"></a>
								</td>
								<td><a deleteLink="true"
									href="admin_productImage_delete?id=${pi.id}"><span
										class=" 	glyphicon glyphicon-trash"></span></a></td>
		
							</tr>
						</c:forEach>
					</tbody>	  
				</table>	
						
			  </div>			
			</td>
			<td class="addPictureTableTD">
			  <div>
			  	
				<div class="panel panel-warning addPictureDiv">
					<div class="panel-heading">Add new product<b class="text-primary"> Product Detail </b>image</div>
					  <div class="panel-body">
					    	<form method="post" class="addFormDetail" action="admin_productImage_add" enctype="multipart/form-data">
					    		<table class="addTable">
					    			<tr>
					    				<td>Please select local image(width 790 is best)</td>
					    			</tr>
					    			<tr>
					    				<td>
					    					<input id="filepathDetail"  type="file" name="filepath" />
					    				</td>
					    			</tr>
					    			<tr class="submitTR">
					    				<td align="center">
					    					<input type="hidden" name="type" value="type_detail" />
					    					<input type="hidden" name="pid" value="${p.id}" />
					    					<button type="submit" class="btn btn-success">Submit</button>
					    				</td>
					    			</tr>
					    		</table>
					    	</form>
					  </div>
				  </div>
				  <table class="table table-striped table-bordered table-hover  table-condensed"> 
						<thead>
							<tr class="success">
								<th>ID</th>
								<th>Product detail picture thumbnail</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pisDetail}" var="pi">
								<tr>
									<td>${pi.id}</td>
									<td>
										<a title="Click here to view original image" href="img/productDetail/${pi.id}.jpg"><img height="50px" src="img/productDetail/${pi.id}.jpg"></a>
									</td>
									<td><a deleteLink="true"
										href="admin_productImage_delete?id=${pi.id}"><span
											class=" 	glyphicon glyphicon-trash"></span></a></td>
			
								</tr>
							</c:forEach>
						</tbody>	  
					</table>					  		
			  </div>			
			</td>
		</tr>
	</table>

	
	

	
</div>

<%@include file="../include/admin/adminFooter.jsp"%>
