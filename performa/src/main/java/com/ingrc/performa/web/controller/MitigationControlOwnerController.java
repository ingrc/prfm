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

import com.ingrc.performa.model.INGRCControlOwnerModel;
import com.ingrc.performa.service.DataReferenceService;
import com.ingrc.performa.service.MitigationControlOwnerService;
import com.ingrc.performa.web.dto.MitigationControlOwnerDto;

@Controller
@RequestMapping("/mitigationcontrol-owner")
public class MitigationControlOwnerController extends BaseController {

	private static final Logger logger = Logger.getLogger(MitigationControlOwnerController.class);
	private static final String LIST_OWNER = "ownerList";
	private static final String PARAM_CONTROLID = "controlId";
	
	
	@Autowired
	private MitigationControlOwnerService mitigationControlOwnerService;
	@Autowired
	private DataReferenceService dataReferenceService;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		MitigationControlOwnerDto dto = new MitigationControlOwnerDto();
		
		String controlId = request.getParameter(PARAM_CONTROLID);
		dto.setControlId(controlId);
		
		model.addAttribute(LIST_OWNER, dataReferenceService.getControlOwner());
		model.addAttribute("formModel", dto);
		model.addAttribute(PARAM_CONTROLID, controlId);
		
		return RISK_FOLDER + "/mitigationcontrol-owner-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request, @Validated @ModelAttribute("formModel") MitigationControlOwnerDto dto, BindingResult bindingResult, Model model){
		
		if (bindingResult.hasErrors()){
			model.addAttribute(LIST_OWNER, dataReferenceService.getControlOwner());
			return RISK_FOLDER + "/mitigationcontrol-owner-form";
		}
		
		INGRCControlOwnerModel cownerModel = new INGRCControlOwnerModel();
		dto.constructModel(cownerModel);
		
		mitigationControlOwnerService.save(cownerModel);
		
		return "redirect:/mitigationcontrol-owner/list.html?controlId="+dto.getControlId();
	}
	
	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){
		String controlId = request.getParameter(PARAM_CONTROLID);
		if (request.getParameter("rowid") != null && request.getParameter("delete") != null){
			String[] owners = request.getParameterValues("rowid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String owner:owners){
				logger.info("deleting control owner with owner ["+owner+"] control id ["+controlId+"]");
				int delresult = mitigationControlOwnerService.delete(controlId, owner);
				if (delresult == 1){
					deletedIds += ", [owner:"+owner+", control id:"+controlId+"]";
				} else if (delresult == -1){
					deleteFailedIds  += ", [owner:"+owner+", control id:"+controlId+"]";
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
		
		model.addAttribute("listModel", mitigationControlOwnerService.listControlOwner(controlId));
		model.addAttribute(PARAM_CONTROLID, controlId);
		
		return RISK_FOLDER + "/mitigationcontrol-owner-list";
	}
	
}
