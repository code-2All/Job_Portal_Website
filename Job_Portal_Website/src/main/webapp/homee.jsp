<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.jobDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.jobs"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<%@include file="/all_components/all_css.jsp"%>
<body style="background-color: #f0f1f2;">

	
<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>



	<%@include file="/all_components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>


				<c:if test="${not empty succMsg}">
					<h4 class="text-center text-danger">${succMsg}</h4>
					<c:remove var="succMsg" />
				</c:if>


				<div class="card">
					<div class="card-body">

						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form_group col-md-5  mt-1">
								<h5>Location</h5>
							</div>

							<div class="form-group  col-md-4  mt1">

								<h5>Category</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="loc" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option selected value="lo">choose....</option>
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

							<div class="form-group col-md-5">
								<select name="cat" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option selected value="ca">Choose...</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Teacher">Teacher</option>
									<option value="Sales">Sales</option>
								</select>
							</div>


							<button class="btn btn-success">Submit</button>
						</form>

					</div>
				</div>


				<%
				jobDAO dao = new jobDAO(DBConnect.getConn());
				List<jobs> list = dao.getAllJobsForUser();
				for (jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>


						<h6><%=j.getTitle()%></h6>

						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
						%>
						<p><%=j.getDescription()%></p>
						<%
						} else {
						%>

						<p><%=j.getDescription().substring(1, 120)%>...
						</p>
						<%
						}
						%>
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


							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">View_More</a>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>
</body>
</html>