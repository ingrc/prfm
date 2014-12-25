package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class RuleMaintenanceFuncPrmDto {
	@NotNull @NotEmpty
	private String bprc;
	@NotNull @NotEmpty
	private String fid;
	@NotNull @NotEmpty
	private String tcode;
	private String ttext;
	@NotNull @NotEmpty
	private String object;
	@NotNull @NotEmpty
	private String field;
	private String from_val;
	private String to_val;
	private String search_type;
	private String status;
	public RuleMaintenanceFuncPrmDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public RuleMaintenanceFuncPrmDto(String bprc, String fid, String tcode, String object, String field, String from_val,
			String to_val, String search_type, String status) {
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


	public RuleMaintenanceFuncPrmDto(String tcode, String ttext) {
		super();
		this.tcode = tcode;
		this.ttext = ttext;
	}
	public String getBprc() {
		return bprc;
	}

	public void setBprc(String bprc) {
		this.bprc = bprc;
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
	
	public String getTtext() {
		return ttext;
	}
	public void setTtext(String ttext) {
		this.ttext = ttext;
	}
	public void setTcode(String tcode) {
		this.tcode = tcode;
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


	@Override
	public String toString() {
		return "RuleMaintenanceFuncPrmDto [bprc=" + bprc + ", fid=" + fid
				+ ", tcode=" + tcode + ", ttext=" + ttext + ", object="
				+ object + ", field=" + field + ", from_val=" + from_val
				+ ", to_val=" + to_val + ", search_type=" + search_type
				+ ", status=" + status + "]";
	}



}
