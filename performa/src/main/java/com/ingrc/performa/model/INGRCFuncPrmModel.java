package com.ingrc.performa.model;

public class INGRCFuncPrmModel {
	private String bprc;
	private String fid;
	private String tcode;
	private String object;
	private String field;
	private String from_val;
	private String to_val;
	private String search_type;
	private String status;


	public INGRCFuncPrmModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public INGRCFuncPrmModel(String bprc, String fid, String tcode,
			String object, String field, String from_val, String to_val,
			String search_type, String status) {
		super();
		this.bprc = bprc;
		this.fid = fid;
		this.tcode = tcode;
		this.object = object;
		this.field = field;
		this.from_val = from_val;
		this.to_val = to_val;
		this.search_type = search_type;
		this.status = status;
	}

	public String getBprc() {
		return bprc;
	}

	public void setBprc(String bprc) {
		this.bprc = bprc;
	}

	public String getObject() {
		return object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getFrom_val() {
		return from_val;
	}

	public void setFrom_val(String from_val) {
		this.from_val = from_val;
	}

	public String getTo_val() {
		return to_val;
	}

	public void setTo_val(String to_val) {
		this.to_val = to_val;
	}

	public String getSearch_type() {
		return search_type;
	}

	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getTcode() {
		return tcode;
	}

	public void setTcode(String tcode) {
		this.tcode = tcode;
	}

	@Override
	public String toString() {
		return "INGRCFuncPrmModel [bprc=" + bprc + ", fid=" + fid + ", tcode="
				+ tcode + ", object=" + object + ", field=" + field
				+ ", from_val=" + from_val + ", to_val=" + to_val
				+ ", search_type=" + search_type + ", status=" + status + "]";
	}



}
