<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

    var wsUri = "ws://" + document.location.host + "/springMVC-websocket/ws/contact";
	var webSocket = new WebSocket(wsUri);

	webSocket.onmessage = function(evt) {
		onMessage(evt)
	};

	function onMessage(evt) {
		var jsonObj = JSON.parse(evt.data);
		var id = jsonObj.contact.id;
		var name = jsonObj.contact.name;
		var phone = jsonObj.contact.phone;

		if (jsonObj.action == "ADD") {
			addContact(id, name, phone);

			} else if (jsonObj.action == "EDIT") {
			editContact(id, name, phone);

			} else if (jsonObj.action == "DELETE") {
			deleteContact(id);

			} else {
			alert("Option \"" + jsonObj.action + "\" not available!");
		}
	}

	function addContact(id, name, phone) {
		var contactTable = document.getElementById("contactTable");
		var rowCount = contactTable.rows.length;
		var row = contactTable.insertRow(rowCount);
		row.id = "contactTable_id" + id;
		var cellId = row.insertCell(0);
		cellId.innerHTML = id;
		var cellId = row.insertCell(1);
		cellId.innerHTML = name;
		var cellId = row.insertCell(2);
		cellId.innerHTML = phone;
	}

	function editContact(id, name, phone) {
		var tableTd = document.getElementById("contactTable_id" + id)
		tableTd.cells[0].innerHTML = id;
		tableTd.cells[1].innerHTML = name;
		tableTd.cells[2].innerHTML = phone;
	}

	function deleteContact(id) {
		var tableTd = document.getElementById("contactTable_id" + id);
		tableTd.parentNode.removeChild(tableTd);
	}
</script>
</head>
<body>
	<h2>Contacts</h2>

	<table id="contactTable">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Phone</th>
		</tr>
		<c:forEach items="${contactForm.contacts}" var="contact">
		   <tr id="contactTable_id${contact.id}">
				<td>${contact.id}</td>
				<td>${contact.name}</td>
				<td>${contact.phone}</td>
		   </tr>
		</c:forEach>
	</table>

</body>
</html>