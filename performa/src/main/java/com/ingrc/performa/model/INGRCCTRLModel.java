package com.ingrc.performa.model;

public class INGRCCTRLModel {

	private String ctrlId;
	private String ctrlName;
	private String description;
	private String ctype;
	private String cref;
	private String cfreq;
	private String bprc;
	private String sbpr;
	private String orgc;
	public INGRCCTRLModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCCTRLModel(String ctrlId, String ctrlName, String description,
			String ctype, String cref, String cfreq, String bprc, String sbpr,
			String orgc) {
		super();
		this.ctrlId = ctrlId;
		this.ctrlName = ctrlName;
		this.description = description;
		this.ctype = ctype;
		this.cref = cref;
		this.cfreq = cfreq;
		this.bprc = bprc;
		this.sbpr = sbpr;
		this.orgc = orgc;
	}
	public String getCtrlId() {
		return ctrlId;
	}
	public void setCtrlId(String ctrlId) {
		this.ctrlId = ctrlId;
	}
	public String getCtrlName() {
		return ctrlName;
	}
	public void setCtrlName(String ctrlName) {
		this.ctrlName = ctrlName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getCref() {
		return cref;
	}
	public void setCref(String cref) {
		this.cref = cref;
	}
	public String getCfreq() {
		return cfreq;
	}
	public void setCfreq(String cfreq) {
		this.cfreq = cfreq;
	}
	public String getBprc() {
		return bprc;
	}
	public void setBprc(String bprc) {
		this.bprc = bprc;
	}
	public String getSbpr() {
		return sbpr;
	}
	public void setSbpr(String sbpr) {
		this.sbpr = sbpr;
	}
	public String getOrgc() {
		return orgc;
	}
	public void setOrgc(String orgc) {
		this.orgc = orgc;
	}
	
}
