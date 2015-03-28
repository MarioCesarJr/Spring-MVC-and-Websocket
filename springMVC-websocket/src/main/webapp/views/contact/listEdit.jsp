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
	
	<form:form method="post" action="${pageContext.servletContext.contextPath}/contact/saveList.html" modelAttribute="contactForm">
		
		<table>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Phone</th>
			</tr>
			<c:forEach items="${contactForm.contacts}" var="contact" varStatus="status">
				<tr>
					<td><input name="contacts[${status.index}].id" value="${contact.id}" /></td>
					<td><input name="contacts[${status.index}].name" value="${contact.name}" /></td>
					<td><input name="contacts[${status.index}].phone" value="${contact.phone}" /></td>
				</tr>
			</c:forEach>
		</table>
		
		<input type="submit" name="action" value="Save" />
		<input type="submit" name="action" value="Cancel" />
	</form:form>
</body>
</html>