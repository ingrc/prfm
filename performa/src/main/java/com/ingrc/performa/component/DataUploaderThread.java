package com.ingrc.performa.component;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.ingrc.performa.service.AccessControlRestoreDBFromFileService;
import com.ingrc.performa.web.dto.AccessControlRestoreDBFromFileDto;

@Component("dataUploaderThread")
@Scope("prototype")
public class DataUploaderThread implements Runnable {
	
	private static final Logger logger = Logger.getLogger(DataUploaderThread.class);
	
	private AccessControlRestoreDBFromFileService accessControlService;
	
	private AccessControlRestoreDBFromFileDto dto;
	
	public AccessControlRestoreDBFromFileDto getDto() {
		return dto;
	}
	public void setDto(AccessControlRestoreDBFromFileDto dto) {
		this.dto = dto;
	}
	public AccessControlRestoreDBFromFileService getAccessControlService() {
		return accessControlService;
	}
	public void setAccessControlService(
			AccessControlRestoreDBFromFileService accessControlService) {
		this.accessControlService = accessControlService;
	}
	public void run() {
		logger.info("["+dto.getTablename()+"] Insert data start ["+dto.getFilename()+"] on ["+new Date()+"]");
		
		accessControlService.save(dto);
		if(dto.getInfo()=="tblnotexist"){
//			dto.setInfo("");
			logger.error("["+dto.getTablename()+"] table not found");
//			bindingResult.rejectValue("tablename","acesscontrol.form.error.2");
//			return ACCESSCONTROL_FOLDER + "/accesscontrol-form";
		}else if(dto.getInfo()=="fieldnotmatch"){
			logger.error("["+dto.getTablename()+"] field not match");
//			dto.setInfo("");
//			bindingResult.rejectValue("tablename","acesscontrol.form.error.1");
//			return ACCESSCONTROL_FOLDER + "/accesscontrol-form";
		} else {
			accessControlService.updateLastUploadDate(new Date(), dto.getTablename());
			logger.info("["+dto.getTablename()+"] Insert data finish ["+dto.getFilename()+"] on ["+new Date()+"]");
		}
		
		
		
	}

}
