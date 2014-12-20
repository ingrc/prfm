package com.ingrc.performa.model;

public class INGRCTCTYModel {

	private String ctype;
	private String text;
	public INGRCTCTYModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCTCTYModel(String ctype, String text) {
		super();
		this.ctype = ctype;
		this.text = text;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
