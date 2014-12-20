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

import com.ingrc.performa.model.INGRCAcFuncModel;
import com.ingrc.performa.model.SAPTSTCModel;
import com.ingrc.performa.service.DataReferenceService;
import com.ingrc.performa.service.RuleMaintenanceAcFActService;
import com.ingrc.performa.web.dto.RuleMaintenanceAcFActDto;

@Controller
@RequestMapping("/rulemaintenance-acfact")
public class RuleMaintenaceAcFActController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(RuleMaintenaceAcFActController.class);

	private static final String LIST_AC_FUNC = "acFuncList";
	private static final String LIST_TSTC = "tstcList";
	@Autowired
	private RuleMaintenanceAcFActService ruleMaintenanceAcFActService;
	
	@Autowired
	private DataReferenceService dataReferenceService;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		RuleMaintenanceAcFActDto dto = new RuleMaintenanceAcFActDto();
		
		model.addAttribute(LIST_AC_FUNC, dataReferenceService.getAcFuncList());
		//model.addAttribute(LIST_TSTC, dataReferenceService.getTsctList());
		String fid = request.getParameter("fid");
		String tcode = request.getParameter("tcode");
		if (fid != null && tcode != null) {
			dto = ruleMaintenanceAcFActService.getById(fid,tcode);
			model.addAttribute("formStat", "update");
		}
		else {
			if(fid != null)
				dto.setFid(fid);
			model.addAttribute("formStat", "addnew");
		}
		model.addAttribute("formModel", dto);
		
		return BPR_FOLDER + "/rulemaintenance-acfact-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request, @Validated @ModelAttribute("formModel") RuleMaintenanceAcFActDto dto, BindingResult bindingResult, Model model){
	
		model.addAttribute(LIST_AC_FUNC, dataReferenceService.getAcFuncList());
		
		SAPTSTCModel cek = ruleMaintenanceAcFActService.checkTcode(dto.getTcode());
		if (cek == null){
			bindingResult.rejectValue("tcode", "rulemaintenance.acfact.tcode.not.in");
		}
//		if not found
//		bindingResult.rejectValue(arg0, arg1);
		
		
		if (bindingResult.hasErrors()){
			
			
			if (dto.getFid() != null && dto.getTcode() != null){
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute("formStat", "addnew");
			}
			return BPR_FOLDER + "/rulemaintenance-acfact-form";			
		}
		
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")){
			ruleMaintenanceAcFActService.update(dto);
		} else {
			ruleMaintenanceAcFActService.save(dto);
		}
			
		return "redirect:/rulemaintenance-acfact/list.html?fid="+dto.getFid();
	}
	
	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){

		if (request.getParameter("rowid") != null && request.getParameter("delete") != null){
			String[] ids = request.getParameterValues("rowid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String id:ids){
				logger.info("deleting acfact with fid ["+id+"] ");
				String[] fidandtcode = id.split("-");
				int delresult = ruleMaintenanceAcFActService.delete(fidandtcode[0],fidandtcode[1]);
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
		
		model.addAttribute("businessProcessList", ruleMaintenanceAcFActService.listBusinessProcess());
		
		String bprc = request.getParameter("bprc");
		String fid = request.getParameter("fid");
		
		logger.info("FID value ["+fid+"]");
		model.addAttribute("selectedFunction", fid);
		model.addAttribute("selectedBprc", bprc);
		model.addAttribute("listModel", ruleMaintenanceAcFActService.list(fid));

		return BPR_FOLDER + "/rulemaintenance-acfact-list";
	}
	
	@RequestMapping(value = "/functionlist/{bprc}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<INGRCAcFuncModel> getSPRList(@PathVariable("bprc") String bprc){
		logger.debug("get sprlist with ["+bprc+"]");
		return ruleMaintenanceAcFActService.listFunctionAction(bprc);
	}
	
	
}
