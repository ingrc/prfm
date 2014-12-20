package com.ingrc.performa.web.controller;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class HomeController {
	
	private static final Logger logger = Logger.getLogger(HomeController.class);

	@RequestMapping("/home.html")
	public String doHome(Locale locale){
		logger.info("Welcome home! The client locale is "+locale.getDisplayName());
		return "/home";
	}
	
	@RequestMapping("/template.html")
	public String doTemplate(){
		return "/template";
	}
}
