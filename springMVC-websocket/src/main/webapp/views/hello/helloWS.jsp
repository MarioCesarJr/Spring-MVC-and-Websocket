<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="../../js/hellows.js"></script>
</head>
<body>
	<h2 style="text-align: center;">Hello WebSocket Client</h2>
	<br>
	<div style="text-align: center;">
		<form action="">
			<input onclick="sendMessage()" value="Send" type="button"> 
			<input id="textID" name="message" value="Hello WebSocket!" type="text">
			<br>
		</form>
	</div>
	<div id="output"></div>
</body>
</html>