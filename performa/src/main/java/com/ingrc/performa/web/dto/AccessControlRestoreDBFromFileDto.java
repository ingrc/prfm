package com.ingrc.performa.web.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class AccessControlRestoreDBFromFileDto {
	private Integer uploadid;
	@NotNull
	private String tablename;
	private String label;
	private MultipartFile uploadedFile;
	private String filepath;	
	private String filename;
	private String fileext;
	private String filesize;
	private Integer totalrecord;
	private Integer actualrecord;
	private String info;
	private String useraccess;
	private String stat;
	private Date uploadDate;
	
	public AccessControlRestoreDBFromFileDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public AccessControlRestoreDBFromFileDto(String tablename) {
		super();
		this.tablename = tablename;
	}

	

	public AccessControlRestoreDBFromFileDto(String tablename, String label,
			String filename, Integer totalrecord) {
		super();
		this.tablename = tablename;
		this.label = label;
		this.filename = filename;
		this.totalrecord = totalrecord;
	}


	public AccessControlRestoreDBFromFileDto(Integer uploadid,
			String tablename, String label, MultipartFile uploadedFile,
			String filepath, String filename, String fileext, String filesize,
			Integer totalrecord, Integer actualrecord, String info, String useraccess) {
		super();
		this.uploadid = uploadid;
		this.tablename = tablename;
		this.label = label;
		this.uploadedFile = uploadedFile;
		this.filepath = filepath;
		this.filename = filename;
		this.fileext = fileext;
		this.filesize = filesize;
		this.totalrecord = totalrecord;
		this.actualrecord = actualrecord;
		this.info = info;
		this.useraccess = useraccess;
	}

	public Integer getUploadid() {
		return uploadid;
	}

	public void setUploadid(Integer uploadid) {
		this.uploadid = uploadid;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public MultipartFile getUploadedFile() {
		return uploadedFile;
	}

	public void setUploadedFile(MultipartFile uploadedFile) {
		this.uploadedFile = uploadedFile;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
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

	public Integer getTotalrecord() {
		return totalrecord;
	}

	public void setTotalrecord(Integer totalrecord) {
		this.totalrecord = totalrecord;
	}

	public Integer getActualrecord() {
		return actualrecord;
	}

	public void setActualrecord(Integer actualrecord) {
		this.actualrecord = actualrecord;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getUseraccess() {
		return useraccess;
	}

	public void setUseraccess(String useraccess) {
		this.useraccess = useraccess;
	}


	public String getStat() {
		return stat;
	}


	public void setStat(String stat) {
		this.stat = stat;
	}
	

	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	@Override
	public String toString() {
		return "AccessControlRestoreDBFromFileDto [uploadid=" + uploadid
				+ ", tablename=" + tablename + ", label=" + label
				+ ", uploadedFile=" + uploadedFile + ", filepath=" + filepath
				+ ", filename=" + filename + ", fileext=" + fileext
				+ ", filesize=" + filesize + ", totalrecord=" + totalrecord
				+ ", actualrecord=" + actualrecord + ", info=" + info + ", useraccess=" + useraccess+"]";
	}


}
