<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.jobDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.jobs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View_Job</title>
</head>
<%@include file="all_components/all_css.jsp"%>
<body style="background-color: #f0f1f2">


	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"/>
	</c:if>
	<%@include file="all_components/navbar.jsp"%>



	<div class="container">
		<div class="row">
			<div class="col-md-12">




				<%
				int id = Integer.parseInt(request.getParameter("id"));
				jobDAO dao = new jobDAO(DBConnect.getConn());
				jobs j = dao.getJobById(id);
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>


						<h5><%=j.getTitle()%></h5>
						<p><%=j.getDescription()%>
						</p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location:<%=j.getLocation()%>" readonly>
							</div>


							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category:<%=j.getCategory()%>" readonly>
							</div>
						</div>
						<h6>
							Publish Date:
							<%=j.getPdate().toString()%></h6>
						<div class="text-center">
							<a href="edit.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a> <a
								href="delete?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">Delete</a>
						</div>


					</div>
				</div>


			</div>
		</div>
	</div>
</body>

</html>