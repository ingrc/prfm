package com.ingrc.performa.model;

public class INGRCTASSRModel {

	private String assr;
	private String text;
	public INGRCTASSRModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCTASSRModel(String assr, String text) {
		super();
		this.assr = assr;
		this.text = text;
	}
	public String getAssr() {
		return assr;
	}
	public void setAssr(String assr) {
		this.assr = assr;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
}
