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

import com.ingrc.performa.service.RuleMaintenanceBprService;
import com.ingrc.performa.web.dto.RuleMaintenanceBprDto;

@Controller
@RequestMapping("/rulemaintenance-bpr")
public class RuleMaintenaceBprController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(RuleMaintenaceBprController.class);
	
	@Autowired
	private RuleMaintenanceBprService ruleMaintenanceBprService;

	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		RuleMaintenanceBprDto dto = new RuleMaintenanceBprDto();
		
//		String controlId = request.getParameter(PARAM_CONTROLID);
//		dto.setBprc(controlId);
		String bprc = request.getParameter("bprc");
		if (request.getParameter("bprc") != null) {
			//model.addAttribute(LIST_BPR, ruleMaintenanceBprService.getById(bprc));
			dto = ruleMaintenanceBprService.getById(bprc);
			model.addAttribute("formStat", "update");
		}
		else {
			//model.addAttribute(LIST_BPR, ruleMaintenanceBprService.list());
			model.addAttribute("formStat", "addnew");
		}
		model.addAttribute("formModel", dto);
//		model.addAttribute(PARAM_CONTROLID, controlId);
		
		return BPR_FOLDER + "/rulemaintenance-bpr-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request, @Validated @ModelAttribute("formModel") RuleMaintenanceBprDto dto, BindingResult bindingResult, Model model){
	
		if (bindingResult.hasErrors()){
			if (dto.getBprc() != null){
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute("formStat", "addnew");
			}
			return BPR_FOLDER + "/mitigationcontrol-risk-form";			
		}
		
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")){
			System.out.println("KIRIM="+formStat);
			ruleMaintenanceBprService.update(dto);
		} else {
			ruleMaintenanceBprService.save(dto);
		}
			
		return "redirect:/rulemaintenance-bpr/list.html";
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
				int delresult = ruleMaintenanceBprService.delete(bprId);
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
		
		model.addAttribute("listModel", ruleMaintenanceBprService.list());
//		model.addAttribute(PARAM_CONTROLID, controlId);
		return BPR_FOLDER + "/rulemaintenance-bpr-list";
	}
	
	
	
}
