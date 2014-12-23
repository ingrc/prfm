package com.ingrc.performa.web.controller;

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

import com.ingrc.performa.model.INGRCSqlScriptModel;
import com.ingrc.performa.service.SqlScriptService;

@Controller
@RequestMapping("/sqlscript")
public class SqlScriptManagementController {

	private static final Logger logger = Logger.getLogger(SqlScriptManagementController.class);
	
	@Autowired
	private SqlScriptService sqlScriptService;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		INGRCSqlScriptModel sqlModel = new INGRCSqlScriptModel();
		
		if (request.getParameter("id") != null){
			int id = NumberUtils.toInt(request.getParameter("id"), 0);
			sqlModel = sqlScriptService.getSqlScript(id);
			model.addAttribute("formStat", "update");
		} else {
			model.addAttribute("formStat", "addnew");
		}
		
		model.addAttribute("formModel", sqlModel);
		
		return "/sqlscript-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request, 
			@Validated @ModelAttribute("formModel") INGRCSqlScriptModel sqlModel,
			BindingResult bindingResult, Model model){
		if (bindingResult.hasErrors()){
			if (sqlModel.getId() != null){
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute("formStat", "addnew");
			}
			return "/sqlscript-form";
		}
		
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")){
			sqlScriptService.update(sqlModel);
		} else {
			sqlScriptService.save(sqlModel);
		}
		
		return "redirect:/sqlscript/list.html";
	}
	
	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){
		if (request.getParameter("rowid") != null && request.getParameter("delete") != null){
			String[] ids = request.getParameterValues("rowid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String id:ids){
				logger.info("deleting sqlscript with id ["+id+"]");
				int delresult = sqlScriptService.delete(NumberUtils.toInt(id,0));
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
		model.addAttribute("listModel", sqlScriptService.list());
		return "/sqlscript-list";
	}
	
}
