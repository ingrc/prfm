package com.ingrc.performa.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MenuController {
	
	public static final String SESSION_MENU_MASTER_ID = "sessionMenuMasterId";
	
	@RequestMapping("/riskmanagement.html")
	public String doRiskManagement(HttpServletRequest request){
		this.setMenuSession(request, "1");
		return "riskmanagement";
	}
	
	@RequestMapping("/accesscontrol.html")
	public String doAccessControl(HttpServletRequest request){
		this.setMenuSession(request, "3");
		return "accesscontrol";
	}
	
	@RequestMapping("/performance.html")
	public String doPerformance(HttpServletRequest request){
		this.setMenuSession(request, "4");
		return "performance";
	}
	
	@RequestMapping("/customizing.html")
	public String doCustomizing(HttpServletRequest request){
		this.setMenuSession(request, "5");
		return "customizing";
	}
	
	@RequestMapping("/report.html")
	public String doReport(HttpServletRequest request){
		this.setMenuSession(request, "2");
		return "report";
	}
	
	public void setMenuSession(HttpServletRequest request, String menuId){
		request.getSession(true).setAttribute(SESSION_MENU_MASTER_ID, menuId);
	}
	
}
