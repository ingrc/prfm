package com.ingrc.performa.model;

public class INGRCTRTYModel {

	private String rtype;
	private String text;
	public INGRCTRTYModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCTRTYModel(String rtype, String text) {
		super();
		this.rtype = rtype;
		this.text = text;
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String rtype) {
		this.rtype = rtype;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
