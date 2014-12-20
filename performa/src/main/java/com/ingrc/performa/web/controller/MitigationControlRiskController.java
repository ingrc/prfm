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

import com.ingrc.performa.model.INGRCControlRiskModel;
import com.ingrc.performa.service.MitigationControlRiskService;
import com.ingrc.performa.service.RiskMaintenanceService;
import com.ingrc.performa.web.dto.MitigationControlRiskDto;

@Controller
@RequestMapping("/mitigationcontrol-risk")
public class MitigationControlRiskController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(MitigationControlRiskController.class);

	private static final String LIST_RISK = "riskList";
	private static final String PARAM_CONTROLID = "controlId";
	
	@Autowired
	private RiskMaintenanceService riskMaintenanceService;
	@Autowired
	private MitigationControlRiskService mitigationControlRiskService;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		MitigationControlRiskDto dto = new MitigationControlRiskDto();
		
		String controlId = request.getParameter(PARAM_CONTROLID);
		dto.setControlId(controlId);
		
		model.addAttribute(LIST_RISK, riskMaintenanceService.list());
		model.addAttribute("formModel", dto);
		model.addAttribute(PARAM_CONTROLID, controlId);
		
		return RISK_FOLDER + "/mitigationcontrol-risk-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request, @Validated @ModelAttribute("formModel") MitigationControlRiskDto dto, BindingResult bindingResult, Model model){
	
		if (bindingResult.hasErrors()){
			model.addAttribute(LIST_RISK, riskMaintenanceService.list());
			return RISK_FOLDER + "/mitigationcontrol-risk-form";			
		}
		
		INGRCControlRiskModel criskModel = new INGRCControlRiskModel();
		dto.constructModel(criskModel);
		
		mitigationControlRiskService.save(criskModel);
			
		return "redirect:/mitigationcontrol-risk/list.html?controlId="+dto.getControlId();
	}
	
	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){
		String controlId = request.getParameter(PARAM_CONTROLID);
		if (request.getParameter("rowid") != null && request.getParameter("delete") != null){
			String[] riskIds = request.getParameterValues("rowid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String riskId:riskIds){
				logger.info("deleting control risk with riskid ["+riskId+"] control id ["+controlId+"]");
				int delresult = mitigationControlRiskService.delete(controlId, riskId);
				if (delresult == 1){
					deletedIds += ", [riskId:"+riskId+", control id:"+controlId+"]";
				} else if (delresult == -1){
					deleteFailedIds  += ", [riskId:"+riskId+", control id:"+controlId+"]";
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
		
		model.addAttribute("listModel", mitigationControlRiskService.list(controlId));
		model.addAttribute(PARAM_CONTROLID, controlId);
		return RISK_FOLDER + "/mitigationcontrol-risk-list";
	}
	
	
	
}
