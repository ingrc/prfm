
package com.ingrc.performa.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ingrc.performa.model.INGRCRiskModel;
import com.ingrc.performa.model.INGRCSPRModel;
import com.ingrc.performa.service.DataReferenceService;
import com.ingrc.performa.service.RiskMaintenanceService;
import com.ingrc.performa.web.dto.RiskMaintenanceDto;

@Controller
@RequestMapping("/riskmaintenance")
public class RiskMaintenanceController extends BaseController {

	private static final Logger logger = Logger.getLogger(RiskMaintenanceController.class);
	
	private static final String LIST_RISK_TYPE = "risktypeList";
	private static final String LIST_RISK_LEVEL = "risklevelList";
	private static final String LIST_FINANCIAL = "financialList";
	private static final String LIST_BPR = "bprList";
	private static final String LIST_SPR = "sprList";
	private static final String LIST_AC_FUNC = "acFuncList";
	
	@Autowired
	private DataReferenceService dataReferenceService;
	@Autowired
	private RiskMaintenanceService riskMaintenanceService;
	
	@RequestMapping(value = "/sprlist/{bprc}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<INGRCSPRModel> getSPRList(@PathVariable("bprc") String bprc){
		logger.debug("get sprlist with ["+bprc+"]");
		return dataReferenceService.getSPRList(bprc);
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		model.addAttribute(LIST_RISK_TYPE, dataReferenceService.getTRTYList());
		model.addAttribute(LIST_RISK_LEVEL, dataReferenceService.getTRCATList());
		model.addAttribute(LIST_FINANCIAL, dataReferenceService.getTASSRList());
		model.addAttribute(LIST_BPR, dataReferenceService.getBPRList());
		model.addAttribute(LIST_SPR, dataReferenceService.getSPRList());
		model.addAttribute(LIST_AC_FUNC, dataReferenceService.getAcFuncList());
		
		RiskMaintenanceDto riskModel = new RiskMaintenanceDto();
		
		if (request.getParameter("riskId") != null){
			String riskId = request.getParameter("riskId");
			riskModel = riskMaintenanceService.getRiskMaintenanceByRiskId(riskId);
			model.addAttribute("formStat", "update");
		} else {
			model.addAttribute("formStat", "addnew");
		}
		System.out.println("MASUK="+riskModel);
		model.addAttribute("formModel", riskModel);
		
		return RISK_FOLDER + "/riskmaintenance-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request, @Validated @ModelAttribute("formModel") RiskMaintenanceDto dto,
			BindingResult bindingResult, Model model){
		
		logger.debug("submit form --> "+dto.toString());
		if (bindingResult.hasErrors()) {
			logger.info("failed to save riskmaintenance");
			
			model.addAttribute(LIST_RISK_TYPE, dataReferenceService.getTRTYList());
			model.addAttribute(LIST_RISK_LEVEL, dataReferenceService.getTRCATList());
			model.addAttribute(LIST_FINANCIAL, dataReferenceService.getTASSRList());
			model.addAttribute(LIST_BPR, dataReferenceService.getBPRList());
			model.addAttribute(LIST_SPR, dataReferenceService.getSPRList());
			model.addAttribute(LIST_AC_FUNC, dataReferenceService.getAcFuncList());
			
			if (request.getParameter("riskId") != null){
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute("formStat", "addnew");
			}
			
			model.addAttribute("formModel", dto);
			
			return RISK_FOLDER + "/riskmaintenance-form";
		}
		
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")){
			riskMaintenanceService.update(dto);
		} else {
			riskMaintenanceService.save(dto);
		}

		return "redirect:/riskmaintenance/list.html";
	}
	
	@RequestMapping(value = "/list.html")
	public String doList(Model model, HttpServletRequest request){
		if (request.getParameter("riskid") != null && request.getParameter("delete") != null){
			String[] ids = request.getParameterValues("riskid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String id:ids){
				logger.info("deleting risk maintenance with riskid ["+id+"]");
				int delresult = riskMaintenanceService.delete(id);
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
		
		List<INGRCRiskModel> listRisk = riskMaintenanceService.list();
		logger.debug("riskModelList ["+listRisk.size()+"]");
		model.addAttribute("listModel", listRisk);
		return RISK_FOLDER + "/riskmaintenance-list";
	}
}
