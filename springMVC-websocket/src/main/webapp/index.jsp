<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<center>
		<h2>Spring MVC</h2>
		<h4>
			<a href="<%=application.getContextPath() %>/hello/controller.html">Hello</a><br /> 
			<a href="<%=application.getContextPath() %>/contact.html">Contacts</a><br />
			<a href="<%=application.getContextPath() %>/hello/helloWS.html">Hello WebSocket</a> <br/>
			<a href="<%=application.getContextPath() %>/contact/listWS.html">Real time Contacts</a><br />
		</h4>
	</center>
</body>
</html>