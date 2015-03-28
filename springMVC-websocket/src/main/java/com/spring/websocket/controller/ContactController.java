package com.spring.websocket.controller;

import java.util.Iterator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.websocket.ContactWS;
import com.spring.websocket.model.ContactBean;
import com.spring.websocket.model.ContactFormBean;
import com.spring.websocket.model.DataSet;

@Controller
@RequestMapping(value = { "/contact" })
public class ContactController {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		
		ContactFormBean contactForm = new ContactFormBean();
		contactForm.setContacts(DataSet.getContacts());
		return new ModelAndView("/contact/list", "contactForm", contactForm);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add() {
		
		return "/contact/addEdit";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam("id") int id) {
		
		Iterator<ContactBean> iterator = DataSet.getContacts().iterator();
		while (iterator.hasNext()) {
			ContactBean contact = iterator.next();
			if (contact.getId() == id) {
				iterator.remove();
				ContactWS.sendContact(contact, "DELETE");
			}
		}
		return this.list();
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam("id") int id) {
		
		Iterator<ContactBean> iterator = DataSet.getContacts().iterator();
		while (iterator.hasNext()) {
			ContactBean contact = iterator.next();
			if (contact.getId() == id) {
				return new ModelAndView("/contact/addEdit", "contact", contact);
			}
		}
		return this.list();
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("contact") ContactBean contact,
			@RequestParam("action") String action) {
		if ((action != null) && (action.trim().toLowerCase().equals("cancel"))) {
			return this.list();
		}
		
		if (contact == null) {
			return this.list();
		
		} else if (contact.getId() == null) {
			DataSet.addContact(contact);
			ContactWS.sendContact(contact, "ADD");
		
		} else {
			DataSet.updateContact(contact);
			ContactWS.sendContact(contact, "EDIT");
		}
		return this.list();
	}

	@RequestMapping(value = "/listEdit", method = RequestMethod.GET)
	public ModelAndView listEdit() {
		
		ContactFormBean contactForm = new ContactFormBean();
		contactForm.setContacts(DataSet.getContacts());
		return new ModelAndView("/contact/listEdit", "contactForm", contactForm);
	}

	@RequestMapping(value = "/saveList", method = RequestMethod.POST)
	public ModelAndView saveList(
			@ModelAttribute("contactForm") ContactFormBean contactForm,
			@RequestParam("action") String action) {
		if ((action != null) && (action.trim().toLowerCase().equals("cancel"))) {
			return this.list();
		}
		
		for (ContactBean contact : DataSet.getContacts()) {
			ContactWS.sendContact(contact, "DELETE");
		}
		
		DataSet.setContacts(contactForm.getContacts());
		for (ContactBean contact : DataSet.getContacts()) {
			ContactWS.sendContact(contact, "ADD");
		}
		return this.list();
	}

	@RequestMapping(value = "/listWS", method = RequestMethod.GET)
	public ModelAndView listWS() {
		
		ContactFormBean contactForm = new ContactFormBean();
		contactForm.setContacts(DataSet.getContacts());
		return new ModelAndView("/contact/listWS", "contactForm", contactForm);
	}
}