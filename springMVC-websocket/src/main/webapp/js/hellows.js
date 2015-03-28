var wsUri;

wsUri = wsUri = "ws://" + document.location.host + "/ws/hello"; /* Endereco de conexao do websocket */
var websocket = new WebSocket(wsUri); /* abre a conexao com o servidor */

function init() {
	output = document.getElementById("output");
	websocket.onopen = function(evt) {
		onOpen(evt);
	};
	
	websocket.onclose = function(evt) {
		onClose(evt);
	};
	
	websocket.onmessage = function(evt) {
		onMessage(evt);
	};
	
	websocket.onerror = function(evt) {
		onError(evt);
	};
}

function sendMessage() {
	websocket.send(document.getElementById("textID").value);
}

function onOpen(evt) {
	writeToScreen("Connected to Endpoint!");
}

function onClose(evt) {
	writeToScreen("Disconnected of the Endpoint!");
}

function onMessage(evt) {
	writeToScreen("Message Received: " + evt.data);
}

function onError(evt) {
	writeToScreen('<span style="color: red;">ERROR:</span> ' + evt.data);
}

function writeToScreen(message) {
	var pre = document.createElement("p");
	pre.style.wordWrap = "break-word"; /* CSS da pagina */
	pre.innerHTML = message;
	output.appendChild(pre);
}

window.addEventListener("load", init, false); /* chama o metodo init() no momento da carga */