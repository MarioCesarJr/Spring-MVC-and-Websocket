<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:choose>
		<c:when test="${contact.id == null}">
			<h2>Add Contact</h2>
		</c:when>
		<c:when test="${contact.id != null}">
			<h2>Edit Contact</h2>
		</c:when>
	</c:choose>
	<form:form method="post" action="${pageContext.servletContext.contextPath}/contact/save.html" modelAttribute="contact">
		<input name="id" value="${contact.id}" hidden="true" />
		<label>First Name: </label>
		<input name="name" value="${contact.name}" />
		<br />
		<label>Phone: </label>
		<input name="phone" value="${contact.phone}" />
		<br />
		<br />
		<input type="submit" name="action" value="Save" />
		<input type="submit" name="action" value="Cancel" />
	</form:form>


</body>
</html>