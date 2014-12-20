package com.ingrc.performa.model;

public class INGRCSPRModel {

	private String bprc;
	private String sbpr;
	private String text;
	public INGRCSPRModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCSPRModel(String sbpr, String bprc, String text) {
		super();
		this.bprc = bprc;
		this.sbpr = sbpr;
		this.text = text;
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
