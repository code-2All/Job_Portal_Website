<%@page import="com.dao.jobDAO" %>
<%@page import="java.sql.Connection" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.jobs"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit jobs</title>
</head>
<style type="text/css">
.btn-btn-success{
background-color: green;
color: white;
border-radius: 5px;

}
</style>
<%@include file="all_components/all_css.jsp"%>
<body style="background-color: #f0f1f2">

<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

	<%@include file="all_components/navbar.jsp"%>
	
	

	<div class="container p-5">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						
						jobDAO dao = new jobDAO(DBConnect.getConn());
						jobs j = dao.getJobById(id);
						%>
						
						
						
						<h4>Edit Jobs</h4>
					</div>

					<%-- --%>

					<form action="update" method="post">
					<input type="hidden" value="<%=j.getId() %>" name="id">
					
					
					
						<div class="form-group">
							<label>Enter Title</label> <input type="text" required
								class="form-control" name="title"  value=<%=j.getTitle()%>>

						</div>


						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label><select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getLocation() %>"><%= j.getLocation()%></option>
									<option value="Odisha">Odisha</option>
									<option value="Banglore">Banglore</option>
									<option value="Pune">Pune</option>
									<option value="Gujurat">Gujurat</option>
									<option value="Chennai">Chennai</option>
									<option value="Delhi">Delhi</option>
									<option value="Noida">Noida</option>
									<option value="Bihar">Bihar</option>
								</select>
							</div>


							<div class="form-group col-md-4">
								<label>Category</label><select name="category"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Teacher">Teacher</option>
									<option value="Sales">Sales</option>
								</select>
							</div>



							<div class="form-group col-md-4">
								<label>Status</label><select name="status"
									class="form-control"> 
										<option class="Active" value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
									<option class="Active" value="Active">Active</option>
									<option class="InActive" value="InActive">InActive</option>
								</select>
							</div>
							</div>
							
							<div class="form-group">
								<label>Enter Description</label>
								<textarea required rows="6" cols="" name="desc" class="form-control"><%=j.getDescription() %></textarea>
							</div>
						
							<button
								class="btn-btn-success">Update Job</button>
					</form>


				</div>

			</div>
		</div>
	</div>



</body>
</html>