package com.spring.websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.codehaus.jackson.map.ObjectMapper;

import com.spring.websocket.beans.ContactWSBean;
import com.spring.websocket.model.ContactBean;

@ServerEndpoint(value = "/ws/contact")
public class ContactWS {
	
	private static final Set<Session> SESSIONS;
	private static final ObjectMapper JSON_MAPPER;
	
	static {
		SESSIONS = Collections.synchronizedSet(new HashSet<Session>());
		JSON_MAPPER = new ObjectMapper();
	}

	@OnOpen
	public void onOpen(Session session) {
		String.format("Open session [%s].", session.getId());
		SESSIONS.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		String.format("Close session [%s].", session.getId());
		SESSIONS.remove(session);
	}

	public static void sendContact(ContactBean contact, String action) {
		try {
			ContactWSBean contactWS = new ContactWSBean(contact, action);
			String json = JSON_MAPPER.writeValueAsString(contactWS);
			for (Session currentSession : SESSIONS) {
				currentSession.getBasicRemote().sendText(json);
			}
		} catch (IOException e) {
			e.getMessage();
		}
	}
}