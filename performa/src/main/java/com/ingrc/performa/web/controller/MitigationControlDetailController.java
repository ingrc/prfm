package com.ingrc.performa.web.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;

import com.ingrc.performa.model.INGRCCTRLModel;
import com.ingrc.performa.model.INGRCSPRModel;
import com.ingrc.performa.service.DataReferenceService;
import com.ingrc.performa.service.MitigationControlService;
import com.ingrc.performa.web.dto.MitigationControlDto;

@Controller
@RequestMapping("/mitigationcontrol")
public class MitigationControlDetailController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(MitigationControlDetailController.class);

	private static final String LIST_MITIGATION_TYPE = "mitigationTypeList";
	private static final String LIST_ORGANIZATION = "organizationList";
	private static final String LIST_BPR = "bprList";
	private static final String LIST_SPR = "sprList";
	
	@Autowired
	private DataReferenceService dataReferenceService;
	@Autowired
	private MitigationControlService mitigationControlService;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value = "/sprlist/{bprc}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<INGRCSPRModel> getSPRList(@PathVariable("bprc") String bprc){
		logger.debug("get sprlist with ["+bprc+"]");
		return dataReferenceService.getSPRList(bprc);
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		
		model.addAttribute(LIST_MITIGATION_TYPE, dataReferenceService.getTCTYList());
		model.addAttribute(LIST_ORGANIZATION, dataReferenceService.getORGList());
		model.addAttribute(LIST_BPR, dataReferenceService.getBPRList());
		model.addAttribute(LIST_SPR, dataReferenceService.getSPRList());
		
		MitigationControlDto dto = new MitigationControlDto();
		
		if(request.getParameter("mitigationControlId") != null){
			String controlId = request.getParameter("mitigationControlId");
			INGRCCTRLModel ctrlModel = mitigationControlService.getCtrlById(controlId);
			dto.constructDto(ctrlModel);
			model.addAttribute("formStat", "update");
		} else {
			model.addAttribute("formStat", "addnew");
		}
		
		model.addAttribute("formModel", dto);
		return RISK_FOLDER + "/mitigationcontrol-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request,@Validated @ModelAttribute("formModel") MitigationControlDto dto, BindingResult bindingResul, Model model){
		if (bindingResul.hasErrors()){
			model.addAttribute(LIST_MITIGATION_TYPE, dataReferenceService.getTCTYList());
			model.addAttribute(LIST_ORGANIZATION, dataReferenceService.getORGList());
			model.addAttribute(LIST_BPR, dataReferenceService.getBPRList());
			model.addAttribute(LIST_SPR, dataReferenceService.getSPRList());
			
			if(request.getParameter("mitigationControlId") != null && request.getParameter("mitigationControlId").isEmpty() == false){
				logger.debug("control id ["+request.getParameter("mitigationControlId")+"]");
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute("formStat", "addnew");
			}
			
			
			return RISK_FOLDER + "/mitigationcontrol-form"; 
		}
		
		INGRCCTRLModel ctrlModel = new INGRCCTRLModel();
		dto.constructModel(ctrlModel);
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")){
			mitigationControlService.update(ctrlModel);
		} else {
			mitigationControlService.save(ctrlModel);
		}
		return "redirect:/mitigationcontrol/list.html";
	}
	
	@RequestMapping(value="/list.html")
	public String doList(Model model, HttpServletRequest request){
		if (request.getParameter("rowid") != null && request.getParameter("delete") != null){
			String[] ids = request.getParameterValues("rowid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String id:ids){
				logger.info("deleting mitigation control with mitigationControlId ["+id+"]");
				int delresult = mitigationControlService.delete(id);
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
		
		model.addAttribute("listModel", mitigationControlService.list());
		return RISK_FOLDER + "/mitigationcontrol-list";
	}
}
