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
<h2>Contacts</h2>

	<table>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Phone</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${contactForm.contacts}" var="contact">
			<tr id="tableContact_id${contact.id}">
				<td>${contact.id}</td>
				<td>${contact.name}</td>
				<td>${contact.phone}</td>
				<td> <a href="<%=application.getContextPath() %>/contact/edit.html?id=${contact.id}">Edit</a> </td>
				<td> <a href="<%=application.getContextPath() %>/contact/delete.html?id=${contact.id}">Delete</a> </td>
			</tr>
		</c:forEach>
	</table>
	
	<br/>
	
	<form:form action="${pageContext.servletContext.contextPath}/contact/add.html" method="get">
		<input type="submit" value="Add" />
	</form:form>
	
	<form:form action="${pageContext.servletContext.contextPath}/contact/listEdit.html" method="get">
		<input type="submit" value="List Edit" />
	</form:form>

</body>
</html>