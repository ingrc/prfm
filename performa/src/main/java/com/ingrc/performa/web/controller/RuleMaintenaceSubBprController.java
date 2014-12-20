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
import com.ingrc.performa.service.RuleMaintenanceSubBprService;
import com.ingrc.performa.web.dto.RuleMaintenanceSubBprDto;

@Controller
@RequestMapping("/rulemaintenance-subbpr")
public class RuleMaintenaceSubBprController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(RuleMaintenaceSubBprController.class);

	private static final String LIST_BPR = "bprMenuList";
	//private static final String PARAM_CONTROLID = "controlId";
	
	@Autowired
	private RuleMaintenanceSubBprService ruleMaintenanceSubBprService;

//	@Autowired
//	private RuleMaintenanceBprService ruleMaintenanceBprService;
//	
	@Autowired
	private DataReferenceService dataReferenceService;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		RuleMaintenanceSubBprDto dto = new RuleMaintenanceSubBprDto();
		
		model.addAttribute(LIST_BPR,  dataReferenceService.getBPRList());
//		String controlId = request.getParameter(PARAM_CONTROLID);
//		dto.setBprc(controlId);
		String sbpr = request.getParameter("sbpr");
		if (request.getParameter("sbpr") != null) {
			dto = ruleMaintenanceSubBprService.getById(sbpr);
			model.addAttribute("formStat", "update");
		}
		else {
			//model.addAttribute(LIST_BPR, ruleMaintenanceBprService.list());
			model.addAttribute("formStat", "addnew");
		}
		model.addAttribute("formModel", dto);
//		model.addAttribute(PARAM_CONTROLID, controlId);
		
		return BPR_FOLDER + "/rulemaintenance-subbpr-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request, @Validated @ModelAttribute("formModel") RuleMaintenanceSubBprDto dto, BindingResult bindingResult, Model model){
	
		model.addAttribute(LIST_BPR,  dataReferenceService.getBPRList());

		if (bindingResult.hasErrors()){
			if (dto.getSbpr() != null){
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute("formStat", "addnew");
			}
			return BPR_FOLDER + "/rulemaintenance-subbpr-form";			
		}
		
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")){
			ruleMaintenanceSubBprService.update(dto);
		} else {
			ruleMaintenanceSubBprService.save(dto);
		}
			
		return "redirect:/rulemaintenance-subbpr/list.html";
	}
	
	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){
//		String controlId = request.getParameter(PARAM_CONTROLID);
		if (request.getParameter("rowid") != null && request.getParameter("delete") != null){
			String[] bprIds = request.getParameterValues("rowid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String bprId:bprIds){
				logger.info("deleting bpr with bprc ["+bprId+"] ");
				int delresult = ruleMaintenanceSubBprService.delete(bprId);
				if (delresult == 1){
					deletedIds += ", [ID:"+bprId+"]";
				} else if (delresult == -1){
					deleteFailedIds  += ", [ID:"+bprId+"]";
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
		
		model.addAttribute("listModel", ruleMaintenanceSubBprService.list());
//		model.addAttribute(PARAM_CONTROLID, controlId);
		return BPR_FOLDER + "/rulemaintenance-subbpr-list";
	}
	
	
	
}
