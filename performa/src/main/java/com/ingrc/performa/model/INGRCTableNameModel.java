package com.ingrc.performa.model;

public class INGRCTableNameModel {
	private Integer uploadid;
	private String tablename;
	private String label;
	private String upby;
	private String upon;
	private String filename;
	
	public INGRCTableNameModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public INGRCTableNameModel(String tablename, String label) {
		super();
		this.tablename = tablename;
		this.label = label;
	}


	public INGRCTableNameModel(Integer uploadid, String tablename,
			String label, String upby, String upon, String filename) {
		super();
		this.uploadid = uploadid;
		this.tablename = tablename;
		this.label = label;
		this.upby = upby;
		this.upon = upon;
		this.filename = filename;
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


	public String getUpby() {
		return upby;
	}


	public void setUpby(String upby) {
		this.upby = upby;
	}


	public String getUpon() {
		return upon;
	}


	public void setUpon(String upon) {
		this.upon = upon;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	@Override
	public String toString() {
		return "INGRCTableNameModel [uploadid=" + uploadid + ", tablename="
				+ tablename + ", label=" + label + ", upby=" + upby + ", upon="
				+ upon + ", filename=" + filename + "]";
	}



}
