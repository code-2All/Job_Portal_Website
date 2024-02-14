<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="/all_components/all_css.jsp"%>

</head>
<body style="background-color: #f0f1f2">
<%@include file="/all_components/navbar.jsp" %>

<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center  text-white bg-custom">
					<i class="fa-solid fa-user fa-3x"></i><h4>Login Page</h4></div>
					<div class="card-body">
					
					
					
					<c:if test="${not empty succMsg }">
					<h4 class="text-center text-danger">${succMsg }</h4>
					<c:remove var="succMsg"/>
					</c:if>
					
					
					
						<form action="login" method="post">
						
							<label>Enter Email </label>
							<div class="form-group">
							 <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" name="email">
								
							</div>
							
							<label>Enter Password </label>
							
							<div class="form-group">
								<input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>
							
							
									<button type="submit" class="btn btn-primary badge-pill btn-block">Login Page</button>
							
							
						
						</form>

					</div>
				</div>


			</div>
		</div>
	</div>


<%@include file="/all_components/footer.jsp" %>

</body>
</html>