package com.ingrc.performa.web.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.ingrc.performa.component.DataUploaderThread;
import com.ingrc.performa.service.AccessControlRestoreDBFromFileService;
import com.ingrc.performa.service.DataReferenceService;
import com.ingrc.performa.web.dto.AccessControlRestoreDBFromFileDto;

@Controller
@RequestMapping("/accesscontrol")
public class AccessControlRestoreDBFromFileController extends BaseController {

	private static final Logger logger = Logger.getLogger(AccessControlRestoreDBFromFileController.class);
	private static final String LIST_TABLENAME_DROP_DOWN = "tableMenuList";
	private static final String LIST_FILE_DROP_DOWN = "fileMenuList";
	
	@Autowired
	private DataReferenceService dataReferenceService;
	@Autowired
	private AccessControlRestoreDBFromFileService accessControlService;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private ThreadPoolTaskExecutor taskExecutor;
	
	@RequestMapping(value="/form.html", method=RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request){
		
		AccessControlRestoreDBFromFileDto acuDto = new AccessControlRestoreDBFromFileDto();
		model.addAttribute(LIST_TABLENAME_DROP_DOWN,
				dataReferenceService.getAccessControlTableNameList());
		model.addAttribute(LIST_FILE_DROP_DOWN,
				dataReferenceService.getFileList(BASE_UPLOAD_FOLDER + File.separator + FILE_TO_DB_FOLDER));
		
		model.addAttribute("formModel", acuDto);
		return ACCESSCONTROL_FOLDER + "/accesscontrol-form";
		
	}
	
	@RequestMapping(value="/form.html", method=RequestMethod.POST)
	public String doFromPost(HttpServletRequest request, 
			@Validated @ModelAttribute("formModel") AccessControlRestoreDBFromFileDto dto,
			BindingResult bindingResult,
			Model model
			){
		
		dto.setUseraccess(request.getRemoteUser());
		model.addAttribute(LIST_TABLENAME_DROP_DOWN,
				dataReferenceService.getAccessControlTableNameList());
		model.addAttribute(LIST_FILE_DROP_DOWN,
				dataReferenceService.getFileList(BASE_UPLOAD_FOLDER + File.separator + FILE_TO_DB_FOLDER));
		logger.debug("attachment dto ["+dto.toString()+"]");
		if (bindingResult.hasErrors()){
			bindingResult.rejectValue("filename","acesscontrol.form.filename.empty");
			return ACCESSCONTROL_FOLDER + "/accesscontrol-form";			
		}
		
		dto.setFilepath(BASE_UPLOAD_FOLDER + File.separator + FILE_TO_DB_FOLDER);
		
//		MultipartFile uploadedFile = dto.getUploadedFile();
//		if (uploadedFile.getSize() == 0){
//			logger.error("file is empty");
//			bindingResult.rejectValue("uploadedFile","acesscontrol.form.filename.empty");
//			return ACCESSCONTROL_FOLDER + "/accesscontrol-form";
//		}else {
//			try {
//				String uploadPath = UPLOAD_FOLDER + File.separator + uploadedFile.getOriginalFilename();
//                byte[] bytes = uploadedFile.getBytes();
//                BufferedOutputStream buffStream = 
//                        new BufferedOutputStream(new FileOutputStream(new File(BASE_UPLOAD_FOLDER + File.separator + uploadPath)));
//                buffStream.write(bytes);
//                buffStream.close();
//                
//                dto.setFilepath(BASE_UPLOAD_FOLDER + File.separator +uploadPath);
//            } catch (Exception e) {
//                logger.error("Upload error [" + e.getMessage()+"]");
////            	e.printStackTrace();
//            }
//			dto.setFilename(uploadedFile.getOriginalFilename());
//			dto.setFileext(uploadedFile.getContentType());
//			dto.setFilesize(String.valueOf(uploadedFile.getSize()));
//			
//			logger.debug("Upload result ["+dto.toString()+"]");
//			
//			accessControlService.save(dto);
//			if(dto.getInfo()=="fieldnotmatch"){
//				bindingResult.rejectValue("uploadedFile","acesscontrol.form.error.1");
//				return ACCESSCONTROL_FOLDER + "/accesscontrol-form";
//			}
//		}
		
//		accessControlService.save(dto);
		DataUploaderThread dataUploadThread = new DataUploaderThread();
		dataUploadThread.setAccessControlService(accessControlService);
		dataUploadThread.setDto(dto);
		taskExecutor.execute(dataUploadThread);
		
//		if(dto.getInfo()=="tblnotexist"){
//			dto.setInfo("");
//			bindingResult.rejectValue("tablename","acesscontrol.form.error.2");
//			return ACCESSCONTROL_FOLDER + "/accesscontrol-form";
//		}
//		if(dto.getInfo()=="fieldnotmatch"){
//			dto.setInfo("");
//			bindingResult.rejectValue("tablename","acesscontrol.form.error.1");
//			return ACCESSCONTROL_FOLDER + "/accesscontrol-form";
//		}
		
		return "redirect:/accesscontrol/list.html";
//		System.out.println("KIRIM="+dto);
//		model.addAttribute("formModel", dto);
//		return ACCESSCONTROL_FOLDER + "/accesscontrol-form";
	}
	
	@RequestMapping(value = "/list.html")
	public String doList(Model model, HttpServletRequest request) {
		if (request.getParameter("username") != null
				&& request.getParameter("delete") != null) {
			String[] ids = request.getParameterValues("username");
			String deletedIds = "";
			String deleteFailedIds = "";
//			for (String id : ids) {
//				logger.info("deleting User with usernme [" + id + "]");
//				int delresult = userService.delete(id);
//				if (delresult == 1) {
//					deletedIds += "," + id;
//				} else if (delresult == -1) {
//					deleteFailedIds += "," + id;
//				}
//
//			}
			if (deletedIds.isEmpty() == false) {
				model.addAttribute("deletedItem", deletedIds.substring(1));
			}
			if (deleteFailedIds.isEmpty() == false) {
				model.addAttribute("deleteFailedItem",
						deleteFailedIds.substring(1));
			}
		}

		List<AccessControlRestoreDBFromFileDto> listAcl = accessControlService.list();

		model.addAttribute("listModel", listAcl);
		return ACCESSCONTROL_FOLDER + "/accesscontrol-list";
	}
	
	
	@Override
	public void initBinder(WebDataBinder binder) {
		super.initBinder(binder);
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}
	
//	@RequestMapping("/attach.html")
//	public void getAttachment(HttpServletRequest request, HttpServletResponse response) throws IOException{
//		String attchPath = BASE_UPLOAD_FOLDER + File.separator + request.getParameter("path");
//		String type = request.getParameter("type");
//		logger.debug("get file from ["+attchPath+"] with type ["+type+"]");
//		response.setContentType(type);
//		InputStream in = new FileInputStream(new File(attchPath));
//		IOUtils.copy(in, response.getOutputStream());
//	}
	
	
	
}
