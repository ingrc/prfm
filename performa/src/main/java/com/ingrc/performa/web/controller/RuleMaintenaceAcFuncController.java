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

import com.ingrc.performa.service.DataReferenceService;
import com.ingrc.performa.service.RuleMaintenanceAcFuncService;
import com.ingrc.performa.web.dto.RuleMaintenanceAcFuncDto;

@Controller
@RequestMapping("/rulemaintenance-acfunc")
public class RuleMaintenaceAcFuncController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(RuleMaintenaceAcFuncController.class);

	private static final String LIST_BPR = "bprMenuList";
	
	@Autowired
	private RuleMaintenanceAcFuncService ruleMaintenanceAcFuncService;
	
	@Autowired
	private DataReferenceService dataReferenceService;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		RuleMaintenanceAcFuncDto dto = new RuleMaintenanceAcFuncDto();
		
		model.addAttribute(LIST_BPR,  dataReferenceService.getBPRList());
		String fid = request.getParameter("fid");
		if (fid != null) {
			dto = ruleMaintenanceAcFuncService.getById(fid);
			model.addAttribute("formStat", "update");
		}
		else {
			model.addAttribute("formStat", "addnew");
		}
		model.addAttribute("formModel", dto);
		
		return BPR_FOLDER + "/rulemaintenance-acfunc-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request, @Validated @ModelAttribute("formModel") RuleMaintenanceAcFuncDto dto, BindingResult bindingResult, Model model){
	
		model.addAttribute(LIST_BPR,  dataReferenceService.getBPRList());

		if (bindingResult.hasErrors()){
			if (dto.getFid() != null){
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute("formStat", "addnew");
			}
			return BPR_FOLDER + "/rulemaintenance-acfunc-form";			
		}
		
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")){
			ruleMaintenanceAcFuncService.update(dto);
		} else {
			ruleMaintenanceAcFuncService.save(dto);
		}
			
		return "redirect:/rulemaintenance-acfunc/list.html";
	}
	
	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){

		if (request.getParameter("rowid") != null && request.getParameter("delete") != null){
			String[] ids = request.getParameterValues("rowid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String id:ids){
				logger.info("deleting acfunc with fid ["+id+"] ");
				int delresult = ruleMaintenanceAcFuncService.delete(id);
				if (delresult == 1){
					deletedIds += ", [ID:"+id+"]";
				} else if (delresult == -1){
					deleteFailedIds  += ", [ID:"+id+"]";
				}
				
			}
			if (deletedIds.isEmpty() == false){
				model.addAttribute("deletedItem", deletedIds.substring(1));
			}
			if (deleteFailedIds.isEmpty() == false){
				model.addAttribute("deleteFailedItem", deleteFailedIds.substring(1));
			}
			
			logger.debug("delete info ["+deletedIds+"] - ["+deleteFailedIds+"]");
		}
		
		model.addAttribute("listModel", ruleMaintenanceAcFuncService.list());

		return BPR_FOLDER + "/rulemaintenance-acfunc-list";
	}
	
	
	
}
