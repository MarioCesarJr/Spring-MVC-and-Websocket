package com.spring.websocket;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/ws/hello")
public class HelloWebSocket {

	public HelloWebSocket() {

	}

	@OnOpen
	public void onOpen(Session session) {
		String.format("Session [%s] opened.", session.getId());

	}

	@OnClose
	public void onClose(Session session) {
		String.format("Session [%s] closed.", session.getId());

	}

	@OnError
	public void onError(Session session, Throwable throwable) {
		String.format("Error on session [%s].", session.getId(), throwable);
	}

	@OnMessage
	public String onHelloMessage(String message) {
		String.format("Message received [%s].", message);

		return "Message received = " + message;
	}

}