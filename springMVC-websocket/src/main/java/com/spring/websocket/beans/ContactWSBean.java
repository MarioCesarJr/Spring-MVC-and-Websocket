package com.spring.websocket.beans;

import com.spring.websocket.model.ContactBean;

public class ContactWSBean {

	private final ContactBean contact;
	private final String action;

	public ContactWSBean(ContactBean contact, String action) {
		this.contact = contact;
		this.action = action;
	}

	public ContactBean getContact() {
		return this.contact;
	}

	public String getAction() {
		return this.action;
	}
}