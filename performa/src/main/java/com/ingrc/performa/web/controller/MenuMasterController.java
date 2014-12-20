package com.ingrc.performa.web.controller;

import java.util.Arrays;
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

import com.ingrc.performa.model.MenuMasterModel;
import com.ingrc.performa.service.MenuMasterService;
import com.ingrc.performa.web.dto.ComboboxHelperDto;

@Controller
@RequestMapping("/menumaster")
public class MenuMasterController extends BaseController {

	private static final Logger logger = Logger
			.getLogger(MenuMasterController.class);

	@Autowired
	private MenuMasterService menuMasterService;

	@RequestMapping(value = "/form.html", method = RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request) {
		MenuMasterModel menuModel = new MenuMasterModel();
		if (request.getParameter("id") != null){
			String id = request.getParameter("id");
			menuModel = menuMasterService.getMenuMasterModelById(id);
		}
		
		model.addAttribute("modelForm", menuModel);

		List<ComboboxHelperDto> parentMenuList = menuMasterService
				.getComboboxValueMenuMaster();
		model.addAttribute("parentMenuList", parentMenuList);
		logger.debug("Parent Menu List [" + parentMenuList.size() + "]");

		return "menumaster-form";
	}

	@RequestMapping(value = "/form.html", method = RequestMethod.POST)
	public String doFormPost(
			@Validated @ModelAttribute("modelForm") MenuMasterModel menuMaster,
			BindingResult bindingResult, Model model) {
		logger.debug("Menu Master --> " + menuMaster.toString());
		if (bindingResult.hasErrors()) {
			logger.info("failed to save menumaster");
			return "menumaster-form";
		}
		logger.debug("success to save menumaster");
		if (menuMaster.getId() == null){
			menuMasterService.addMenuMaster(menuMaster);	
		} else {
			menuMasterService.updateMenuMaster(menuMaster);
		}
		model.addAttribute("list", menuMasterService.listMenuMasterAll());

		return "redirect:/menumaster/list.html";
	}

	@RequestMapping(value = "/list.html")
	public String doList(Model model, HttpServletRequest request) {
		if (request.getParameter("id") != null && request.getParameter("delete") != null){
			String[] ids = request.getParameterValues("id");
			StringBuilder deletedIds = new StringBuilder();
			StringBuilder deleteFailedIds = new StringBuilder();
			logger.info("deleting menu master with id ["+Arrays.toString(ids)+"]");
			for(String id:ids){
				int delresult = menuMasterService.deleteMenuMaster(NumberUtils.toInt(id,0));
				if (delresult == 1){
					deletedIds.append((deletedIds.toString().isEmpty() ? "" : ",") + id);
				} else if (delresult == -1){
					deleteFailedIds.append((deleteFailedIds.toString().isEmpty() ? "" : ",") + id);
				}
				
			}

			model.addAttribute("deletedItem", deletedIds.toString());
			model.addAttribute("deleteFailedItem", deleteFailedIds.toString());
			
		}
		model.addAttribute("list", menuMasterService.listMenuMasterAll());
		return "menumaster-list";
	}

}
