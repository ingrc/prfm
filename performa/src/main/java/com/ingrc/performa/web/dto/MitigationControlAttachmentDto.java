package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ingrc.performa.model.INGRCAttchModel;

public class MitigationControlAttachmentDto {

	@NotNull
	private String controlId;
	private Integer attchId;
	private MultipartFile uploadedFile;
	private String filename;
	private String fileext;
	private String filesize;
	private String filepath;
	private String docobj;
	public MitigationControlAttachmentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MitigationControlAttachmentDto(String controlId, Integer attchId,
			MultipartFile uploadedFile, String filename, String fileext,
			String filesize, String filepath, String docobj) {
		super();
		this.controlId = controlId;
		this.attchId = attchId;
		this.uploadedFile = uploadedFile;
		this.filename = filename;
		this.fileext = fileext;
		this.filesize = filesize;
		this.filepath = filepath;
	}

	public String getControlId() {
		return controlId;
	}
	public void setControlId(String controlId) {
		this.controlId = controlId;
	}
	public MultipartFile getUploadedFile() {
		return uploadedFile;
	}
	public void setUploadedFile(MultipartFile uploadedFile) {
		this.uploadedFile = uploadedFile;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFileext() {
		return fileext;
	}

	public void setFileext(String fileext) {
		this.fileext = fileext;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Integer getAttchId() {
		return attchId;
	}

	public void setAttchId(Integer attchId) {
		this.attchId = attchId;
	}
	
	public String getDocobj() {
		return docobj;
	}

	public void setDocobj(String docobj) {
		this.docobj = docobj;
	}

	@Override
	public String toString() {
		return "MitigationControlAttachmentDto [controlId=" + controlId
				+ ", attchId=" + attchId + ", uploadedFile=" + uploadedFile
				+ ", filename=" + filename + ", fileext=" + fileext
				+ ", filesize=" + filesize + ", filepath=" + filepath
				+ ", docobj=" + docobj + "]";
	}

	public void constructModel(INGRCAttchModel model){
		model.setAttchid(attchId);
		model.setName(filename);
		model.setType(fileext);
		model.setSize(filesize);
		model.setRefid(controlId);
		model.setDocobj(docobj);
		model.setUrl(filepath);
	}
	
	public void constructDto(INGRCAttchModel model){
		this.attchId = model.getAttchid();
		this.filename = model.getName();
		this.fileext = model.getType();
		this.filesize = model.getSize();
		this.controlId = model.getRefid();
		this.docobj = model.getDocobj();
		this.filepath = model.getUrl();
	}
	
	
}
