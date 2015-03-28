package com.spring.websocket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller // Define que a classe e um controller
@RequestMapping("/hello") // mapeamento na url
public class HelloController {

	@RequestMapping("/controller")
	public ModelAndView hello() {
		String message = "Wellcome to spring MVC 4.0"; 
		return new ModelAndView("/hello/view", "message", message); // chama  view a ser exibida

	}

	@RequestMapping("/helloWS")
	public String helloWS() {
		return "/hello/helloWS";
	}
}
