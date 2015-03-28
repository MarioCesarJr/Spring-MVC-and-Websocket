package com.spring.websocket.model;

import java.util.List;

public class ContactFormBean {

	private List<ContactBean> contacts;
	
	public List<ContactBean> getContacts() {
		return contacts;
	}
	
	public void setContacts(List<ContactBean> contacts) {
		this.contacts = contacts;
	}
}
