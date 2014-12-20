package com.ingrc.performa.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ingrc.performa.model.INGRCWebUserModel;
import com.ingrc.performa.service.WebUserService;

@Controller
@RequestMapping("/admin-user")
public class AdminUserController extends BaseController {

	private static final Logger logger = Logger.getLogger(AdminUserController.class);
	
	@Autowired
	private WebUserService webUserService;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		System.out.println("****** test");
		logger.debug("**** test");
		INGRCWebUserModel userModel = new INGRCWebUserModel();
		
		if (request.getParameter("webUsername") != null){
			String uname = request.getParameter("webUsername");
			userModel = webUserService.getByUname(uname);
			model.addAttribute("formStat", "update");
		} else {
			model.addAttribute("formStat", "addnew");
		}
		
		model.addAttribute("formModel", userModel);
		return "/admin-user-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request,
			@Validated @ModelAttribute("formModel") INGRCWebUserModel userModel,
			BindingResult bindingResult, Model model
			){
		
		logger.debug("formstat value ["+request.getParameter("formStat")+"]");
		System.out.println("******************* ["+request.getParameter("formStat")+"]");
		if (bindingResult.hasErrors()){
			if (userModel.getWebUsername() != null){
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute("formStat", "addnew");
			}
			return "/admin-user-form";
		}
		
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")){
			webUserService.update(userModel);
		} else {
			webUserService.save(userModel);
		}
		
		return "redirect:/admin-user/list.html";
	}
	
	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){
		if (request.getParameter("rowid") != null && request.getParameter("delete") != null){
			String[] ids = request.getParameterValues("rowid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String id:ids){
				logger.info("deleting mitigation control with mitigationControlId ["+id+"]");
				int delresult = webUserService.delete(id);
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
		model.addAttribute("listModel", webUserService.list());
		return "admin-user-list";
	}
	
	
}
