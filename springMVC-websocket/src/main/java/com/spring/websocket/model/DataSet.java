package com.spring.websocket.model;

import java.util.ArrayList;
import java.util.List;


// Representa um Banco de Dados

public class DataSet {

	private static List<ContactBean> contacts = new ArrayList<ContactBean>();

    private static int id = 0;
    
    static{
    	
    	contacts.add(new ContactBean(id++, "João", "3227-76-76"));
    	contacts.add(new ContactBean(id++, "Andresa", "3228-45-74"));
    	contacts.add(new ContactBean(id++, "Rafaela", "3223-46-16"));
    	contacts.add(new ContactBean(id++, "Renata", "3222-16-86"));
    }
    
    public static List<ContactBean> getContacts() {
		return contacts;
	}
    
    public static void setContacts(List<ContactBean> contacts) {
		DataSet.contacts = contacts;
	}
    
    public static void addContact(ContactBean contact){
    	contact.setId(id++);
    	contacts.add(contact);
    }
    
    public static void updateContact(ContactBean contact){
    	for(int i = 0; i < contacts.size(); i++){
    		if(contacts.get(i).getId() == contact.getId()){
    			contacts.set(i, contact);
    		}
    	}
    }
}
