<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin Page</title>
<style type="text/css">
.back-img{
	background: url("img/p4.jpg");
	width: 100%;
	height: 82vh;
	background-repeat: no-repeat;
	background-size: cover;
	background:
}
</style>
</head>
<%@include file="all_components/all_css.jsp" %>
<body>

<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>


<%@include file="all_components/navbar.jsp" %>
<div class="container-fluid back-img">

</div>

<%@include file="all_components/footer.jsp" %>
</body>
</html>