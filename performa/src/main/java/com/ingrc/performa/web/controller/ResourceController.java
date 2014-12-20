package com.ingrc.performa.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.math.NumberUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ingrc.performa.service.MenuMasterService;

@Controller
@RequestMapping("/res")
public class ResourceController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(ResourceController.class);

	@Autowired
	private MenuMasterService menuMasterService;
	
	@RequestMapping(value="/menumaster", produces=MediaType.TEXT_PLAIN_VALUE)
	public @ResponseBody String doMenuMaster(){
		String menuList = menuMasterService.getListMenuMaster();
		return menuList;
	}
	
	@RequestMapping(value="/menumasterleft", produces=MediaType.TEXT_PLAIN_VALUE)
	public @ResponseBody String doMenuMasterLeft(HttpServletRequest request){
		String sesMenuId = "";
		if (request.getParameter("mntop") != null){
			sesMenuId = request.getParameter("mntop");
			request.getSession(true).setAttribute(MenuController.SESSION_MENU_MASTER_ID, sesMenuId);
		}
		
		if (request.getSession(true).getAttribute(MenuController.SESSION_MENU_MASTER_ID) != null){
			sesMenuId = request.getSession(true).getAttribute(MenuController.SESSION_MENU_MASTER_ID).toString();
		}
		
		
		Integer masterMenuId = NumberUtils.toInt(sesMenuId, 0);
		String result = menuMasterService.getListMenuMasterLeft(masterMenuId);
		logger.debug("session menu master ["+sesMenuId+"] - result ["+result+"]");
		return (result != null) ? result : "";
	}
}
