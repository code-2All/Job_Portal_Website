<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<%@include file="/all_components/all_css.jsp"%>

</head>
<body style="background-color: #f0f1f2">
	<%@include file="/all_components/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center  text-white bg-custom">
					<i class="fa-solid fa-user fa-3x"></i><h4>Registration</h4></div>
					
					
					<%---- Here is apply the logic for the the signup pages  --%>
					<c:if test="${ not empty succMsg }">
					<h4 class="text-center text-success">${succMsg}</h4>
					<c:remove var="succMsg"/>
					</c:if>
					
					
					
					<div class="card-body"> 
						<form action="RegisterServlet" method="post">
						<label>Enter Full Name </label>
						<div class="form-group">
							 <input
									type="text" required = "required" class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" placeholder="Enter Name" name="name">
								
							</div>
							
							<label>Enter Email </label>
							<div class="form-group">
							 <input
									type="email" required = "required" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" name="email">
								
							</div>
							
							
							<label>Enter qualification</label>
							<div class="form-group">
							 <input
									type="text" required = "required"  class="form-control" id="exampleInputQualification"
									 placeholder="Enter email" name="qualification">
								
							</div>
							
							<label>Enter Password </label>
							
							<div class="form-group">
								<input
									type="password" required = "required"  class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>
							
							
									<button type="submit" class="btn btn-primary badge-pill btn-block">Submit</button>
							
							
						
						</form>
</div>
					</div>
				</div>


			</div>
		</div>


	
<%@include file="all_components/footer.jsp"%>

</body>
</html>