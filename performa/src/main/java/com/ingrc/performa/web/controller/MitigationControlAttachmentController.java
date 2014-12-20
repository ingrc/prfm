package com.ingrc.performa.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.ingrc.performa.model.INGRCAttchModel;
import com.ingrc.performa.service.MitigationControlAttachmentService;
import com.ingrc.performa.web.dto.MitigationControlAttachmentDto;

@Controller
@RequestMapping("/mitigationcontrol-attch")
public class MitigationControlAttachmentController extends BaseController {

	private static final Logger logger = Logger.getLogger(MitigationControlAttachmentController.class);
	private static final String PARAM_CONTROLID = "controlId";
	
	@Autowired
	private MitigationControlAttachmentService mitigationControlAttachmentService;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		MitigationControlAttachmentDto dto = new MitigationControlAttachmentDto();
		
		
		String controlId = request.getParameter(PARAM_CONTROLID);
		dto.setControlId(controlId);
		model.addAttribute(PARAM_CONTROLID, controlId);
		
		
		model.addAttribute("formModel", dto);
		
		return RISK_FOLDER + "/mitigationcontrol-attch-form";
		
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFromPost(HttpServletRequest request, 
			@Validated @ModelAttribute("formModel") MitigationControlAttachmentDto dto,
			BindingResult bindingResult,
			Model model
			){
		dto.setDocobj("CTRLDOC"); // default value -> Control Document
		
		logger.debug("attachment dto ["+dto.toString()+"]");
		if (bindingResult.hasErrors()){
			model.addAttribute(PARAM_CONTROLID, dto.getControlId());
			return RISK_FOLDER + "/mitigationcontrol-attch-form";
		}
		
		
		MultipartFile uploadedFile = dto.getUploadedFile();
		if (uploadedFile.getSize() == 0){
			logger.error("file is empty");
			bindingResult.rejectValue("uploadedFile","mitigationcontrol.attch.form.filename.empty");
			return RISK_FOLDER + "/mitigationcontrol-attch-form";
		}else {
			try {
				String uploadPath = UPLOAD_FOLDER + File.separator + uploadedFile.getOriginalFilename();
                byte[] bytes = uploadedFile.getBytes();
                BufferedOutputStream buffStream = 
                        new BufferedOutputStream(new FileOutputStream(new File(BASE_UPLOAD_FOLDER + File.separator + uploadPath)));
                buffStream.write(bytes);
                buffStream.close();
                dto.setFilepath(uploadPath);
            } catch (Exception e) {
//                logger.error("Upload error [" + e.getMessage()+"]");
            	e.printStackTrace();
            }
			dto.setFilename(uploadedFile.getOriginalFilename());
			dto.setFileext(uploadedFile.getContentType());
			dto.setFilesize(String.valueOf(uploadedFile.getSize()));
			
			logger.debug("Upload result ["+dto.toString()+"]");
		}
		
		INGRCAttchModel attchModel = new INGRCAttchModel();
		dto.constructModel(attchModel);
		
		mitigationControlAttachmentService.save(attchModel);
		
		return "redirect:/mitigationcontrol-attch/list.html?controlId="+dto.getControlId();
	}
	
	@RequestMapping("list.html")
	public String doList(Model model, HttpServletRequest request){
		String controlId = request.getParameter(PARAM_CONTROLID);
		if (request.getParameter("rowid") != null && request.getParameter("delete") != null){
			String[] attchs = request.getParameterValues("rowid");
			String deletedIds ="";
			String deleteFailedIds = "";
			for(String attch:attchs){
				logger.info("deleting control owner with attchid ["+attch+"] control id ["+controlId+"]");
				int delresult = mitigationControlAttachmentService.delete(Integer.valueOf(attch));
				if (delresult == 1){
					deletedIds += ", [attchid:"+attch+", control id:"+controlId+"]";
				} else if (delresult == -1){
					deleteFailedIds  +=   ", [attchid:"+attch+", control id:"+controlId+"]";
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
		
		model.addAttribute("listModel", mitigationControlAttachmentService.listControlAttch(controlId));
		model.addAttribute(PARAM_CONTROLID, controlId);
		
		return RISK_FOLDER + "/mitigationcontrol-attch-list";
	}

	@Override
	public void initBinder(WebDataBinder binder) {
		super.initBinder(binder);
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}
	
	@RequestMapping("/attach.html")
	public void getAttachment(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String attchPath = BASE_UPLOAD_FOLDER + File.separator + request.getParameter("path");
		String type = request.getParameter("type");
		logger.debug("get file from ["+attchPath+"] with type ["+type+"]");
		response.setContentType(type);
		InputStream in = new FileInputStream(new File(attchPath));
		IOUtils.copy(in, response.getOutputStream());
	}
	
	
	
}
