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
import com.ingrc.performa.model.SAPFieldsModel;
import com.ingrc.performa.model.SAPTSTCModel;
import com.ingrc.performa.service.DataReferenceService;
import com.ingrc.performa.service.RuleMaintenanceAcFActService;
import com.ingrc.performa.service.RuleMaintenanceAcFuncService;
import com.ingrc.performa.service.RuleMaintenanceFuncPrmService;
import com.ingrc.performa.web.dto.RuleMaintenanceAcFActDto;
import com.ingrc.performa.web.dto.RuleMaintenanceFuncPrmDto;

@Controller
@RequestMapping("/rulemaintenance-funcprm")
public class RuleMaintenaceFuncPrmController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(RuleMaintenaceFuncPrmController.class);

	private static final String LIST_AC_FUNC = "acFuncList";
//	private static final String LIST_TSTC = "tstcList";
	@Autowired
	private RuleMaintenanceFuncPrmService ruleMaintenanceFuncPrmService;
	
	@Autowired
	private RuleMaintenanceAcFActService ruleMaintenanceAcFActService;
	@Autowired
	private RuleMaintenanceAcFuncService ruleMaintenanceAcFuncService;
	
	@Autowired
	private DataReferenceService dataReferenceService;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		RuleMaintenanceFuncPrmDto dto = new RuleMaintenanceFuncPrmDto();

		String bprc = request.getParameter("bprc");
		String fid = request.getParameter("fid");
		String tcode = request.getParameter("tcode");
		String object = request.getParameter("object");
		String field = request.getParameter("field");
		System.out.println("masuk="+bprc+fid+tcode+object+field);
		model.addAttribute("selectedBprc", bprc);
		model.addAttribute("selectedFunction", fid);
		model.addAttribute("selectedAction", tcode);
		model.addAttribute("selectedObject", object);
		model.addAttribute("selectedField", field);
		model.addAttribute("businessProcessList", ruleMaintenanceAcFActService.listBusinessProcess());
		model.addAttribute("objetcTList", ruleMaintenanceFuncPrmService.listObjectT());
		if(bprc != null)
			model.addAttribute("functionList", ruleMaintenanceAcFActService.listFunctionAction(bprc));
		if(fid != null)
			model.addAttribute("actionList", ruleMaintenanceFuncPrmService.listFunctionAction(fid));
		if(object!=null)
			model.addAttribute("fieldList", ruleMaintenanceFuncPrmService.listField(object));
		

		
		if (fid != null && tcode != null) {
			dto = ruleMaintenanceFuncPrmService.getById(bprc,fid,tcode,object,field);
			model.addAttribute("formStat", "update");
		}
		else {
			if(fid != null)
				dto.setFid(fid);
			model.addAttribute("formStat", "addnew");
		}
		model.addAttribute("formModel", dto);
		
		return BPR_FOLDER + "/rulemaintenance-funcprm-form";
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFormPost(HttpServletRequest request, @Validated @ModelAttribute("formModel") RuleMaintenanceFuncPrmDto dto, BindingResult bindingResult, Model model){
	
		model.addAttribute("businessProcessList", ruleMaintenanceAcFActService.listBusinessProcess());
		model.addAttribute("objetcTList", ruleMaintenanceFuncPrmService.listObjectT());

		if(dto.getBprc() != null)
			model.addAttribute("functionList", ruleMaintenanceAcFActService.listFunctionAction(dto.getBprc()));
		if(dto.getFid() != null)
			model.addAttribute("actionList", ruleMaintenanceFuncPrmService.listFunctionAction(dto.getFid()));
//		model.addAttribute("selectedFunction", dto.getFid());
//		model.addAttribute("selectedBprc", dto.getBprc());
//		model.addAttribute("selectedAction", dto.getTcode());
		if (bindingResult.hasErrors()){

			if (dto.getBprc() != null && 
				dto.getFid() != null && 
				dto.getTcode() != null && 
				dto.getObject() != null && 
				dto.getField() != null){
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute("formStat", "addnew");
			}
			return BPR_FOLDER + "/rulemaintenance-funcprm-form";			
		}
		
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")){
			ruleMaintenanceFuncPrmService.update(dto);
		} else {
			ruleMaintenanceFuncPrmService.save(dto);
		}
			
		return "redirect:/rulemaintenance-funcprm/list.html?bprc="+dto.getBprc()+"&fid="+dto.getFid()+"&tcode="+dto.getTcode();
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
				int delresult = ruleMaintenanceFuncPrmService.delete(fidandtcode[0],fidandtcode[1],fidandtcode[2],fidandtcode[3],fidandtcode[4]);
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

		String bprc = request.getParameter("bprc");
		String fid = request.getParameter("fid");
		String tcode = request.getParameter("tcode");
		
		
		model.addAttribute("businessProcessList", ruleMaintenanceAcFActService.listBusinessProcess());
		if(bprc != null)
			model.addAttribute("functionList", ruleMaintenanceAcFActService.listFunctionAction(bprc));
		if(fid != null)
			model.addAttribute("actionList", ruleMaintenanceFuncPrmService.listFunctionAction(fid));
		
		logger.info("MASUK BPRC, FID, TCODE value ["+bprc+","+fid+","+tcode+"]");
		model.addAttribute("selectedFunction", fid);
		model.addAttribute("selectedBprc", bprc);
		model.addAttribute("selectedAction", tcode);
		model.addAttribute("listModel", ruleMaintenanceFuncPrmService.list(bprc,fid,tcode));

		return BPR_FOLDER + "/rulemaintenance-funcprm-list";
	}
	
	@RequestMapping(value = "/functionlist/{bprc}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<INGRCAcFuncModel> getSPRList(@PathVariable("bprc") String bprc){
		logger.debug("get sprlist with ["+bprc+"]");
		return ruleMaintenanceAcFActService.listFunctionAction(bprc);
	}
	
	@RequestMapping(value = "/functionactionlist/{fid}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<RuleMaintenanceFuncPrmDto> getSPRActionList(@PathVariable("fid") String fid){
		logger.debug("get sprlist with ["+fid+"]");
		return ruleMaintenanceFuncPrmService.listFunctionAction(fid);
	}
	
	@RequestMapping(value = "/functionobjectlist/{object}", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<SAPFieldsModel> getSPRObjectList(@PathVariable("object") String object){
		logger.debug("get sprlist with ["+object+"]");
		return ruleMaintenanceFuncPrmService.listField(object);
	}
	
	
}
