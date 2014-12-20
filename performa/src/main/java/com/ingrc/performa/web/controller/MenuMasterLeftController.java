package com.ingrc.performa.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.math.NumberUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ingrc.performa.model.MenuMasterLeftModel;
import com.ingrc.performa.service.MenuMasterService;
import com.ingrc.performa.web.dto.ComboboxHelperDto;

@Controller
@RequestMapping("/menumasterleft")
public class MenuMasterLeftController extends BaseController {
	
	private static final Logger logger=Logger.getLogger(MenuMasterLeftController.class);
	@Autowired
	private MenuMasterService menuMasterService;
	
	private static final String PARAM_MENU_MASTER_ID = "menuMasterId";
	

	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){
		Integer menuMasterId=NumberUtils.toInt(request.getParameter(PARAM_MENU_MASTER_ID),0);
		
		if (request.getParameter("id") != null && request.getParameter("delete") != null){
			String[] ids = request.getParameterValues("id");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String id:ids){
				logger.info("deleting menu master with id ["+id+"]");
				int delresult = menuMasterService.deleteMenuMasterLeft(NumberUtils.toInt(id,0));
				if (delresult == 1){
					deletedIds += "," + id;
				} else if (delresult == -1){
					deleteFailedIds  += "," + id;
				}
				
			}
			if (deletedIds.isEmpty() == false){
				model.addAttribute("deletedItem", deletedIds.substring(1));
			}
			if (deleteFailedIds.isEmpty() == false){
				model.addAttribute("deleteFailedItem", deleteFailedIds.substring(1));
			}
		}
		model.addAttribute("menumaster", menuMasterService.getMenuMasterModelById(String.valueOf(menuMasterId)));
		model.addAttribute("list", menuMasterService.listMenuMasterLeftAll(menuMasterId));
		return "menumasterleft-list";
	}
	
	@RequestMapping(value="/form.html", method = RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		Integer menuMasterId=NumberUtils.toInt(request.getParameter(PARAM_MENU_MASTER_ID),0);
		
		MenuMasterLeftModel menuModel = new MenuMasterLeftModel();
		menuModel.setMenuMasterId(menuMasterId);
		if (request.getParameter("id") != null){
			String id = request.getParameter("id");
			menuModel = menuMasterService.getMenuMasterLeftById(NumberUtils.toInt(id,0));
		}
		model.addAttribute("modelForm", menuModel);
		model.addAttribute("menumaster", menuMasterService.getMenuMasterModelById(String.valueOf(menuMasterId)));
		
		
		List<ComboboxHelperDto> parentMenuList = menuMasterService.getComboboxValueMenuMasterLeft(menuMasterId);
		model.addAttribute("parentMenuList", parentMenuList);
		
		return "menumasterleft-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request,
			@Validated @ModelAttribute("modelForm") MenuMasterLeftModel menuModel,
			BindingResult result,
			Model model
			){
		Integer menuMasterId=NumberUtils.toInt(request.getParameter(PARAM_MENU_MASTER_ID),0);
		if (result.hasErrors()){
			return "menumasterleft-form";
		}
		
		if (menuModel.getId() == null){
			menuMasterService.addMenuMasterLeft(menuModel);
		} else {
			menuMasterService.updateMenuMasterLeft(menuModel);
		}
		
		model.addAttribute("menumaster", menuMasterService.getMenuMasterModelById(String.valueOf(menuMasterId)));
		model.addAttribute("list", menuMasterService.listMenuMasterLeftAll(menuMasterId));
		
		return "redirect:/menumasterleft/list.html?menuMasterId=" + menuMasterId;
	}
}
