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

import com.ingrc.performa.model.INGRCROwnModel;
import com.ingrc.performa.service.DataReferenceService;
import com.ingrc.performa.service.RiskMaintenanceOwnerService;
import com.ingrc.performa.web.dto.RiskMaintenanceOwnerDto;

@Controller
@RequestMapping("/riskmaintenance-owner")
public class RiskMaintenanceOwnerController extends BaseController {

	private static final Logger logger = Logger
			.getLogger(RiskMaintenanceOwnerController.class);

	private static final String LIST_TOWNER = "townerList";
	
	private static final String PARAM_RISKID = "riskId";

	@Autowired
	private DataReferenceService dataReferenceService;
	@Autowired 
	private RiskMaintenanceOwnerService riskMaintenanceOwnerService;

	@RequestMapping(value = "/form.html", method = RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request) {
		model.addAttribute(LIST_TOWNER, dataReferenceService.getRiskOwner());

		RiskMaintenanceOwnerDto dto = new RiskMaintenanceOwnerDto();
		
		String riskId = request.getParameter(PARAM_RISKID);
		dto.setRiskId(riskId);
		
		model.addAttribute("formModel", dto);
		model.addAttribute(PARAM_RISKID, riskId);
		return RISK_FOLDER
				+ "/riskmaintenance-owner-form";
	}

	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request,
			@Validated @ModelAttribute("formModel") RiskMaintenanceOwnerDto dto,
			BindingResult bindingResult, Model model ) {
		logger.debug("DTO ["+dto.toString()+"]");
		
		if (bindingResult.hasErrors()){
			model.addAttribute(LIST_TOWNER, dataReferenceService.getRiskOwner());
			return RISK_FOLDER + "/riskmaintenance-owner-form";
		}
		
		INGRCROwnModel rownModel = new INGRCROwnModel();
		dto.constructModel(rownModel);
		
		riskMaintenanceOwnerService.save(rownModel);
		
		return "redirect:/riskmaintenance-owner/list.html?riskId="+dto.getRiskId();
	}
	
	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){
		String riskId = request.getParameter(PARAM_RISKID);
		if (request.getParameter("owner") != null && request.getParameter("delete") != null){
			String[] owners = request.getParameterValues("owner");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String owner:owners){
				logger.info("deleting risk maintenance owner with riskid ["+riskId+"] owner ["+owner+"]");
				int delresult = riskMaintenanceOwnerService.delete(riskId, owner);
				if (delresult == 1){
					deletedIds += ", [riskId:"+riskId+", owner:"+owner+"]";
				} else if (delresult == -1){
					deleteFailedIds  += ", ["+riskId+","+owner+"]";
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
		
		model.addAttribute("listModel", riskMaintenanceOwnerService.listOwner(riskId));
		model.addAttribute(PARAM_RISKID, riskId);
		return RISK_FOLDER + "/riskmaintenance-owner-list";
	}
}
