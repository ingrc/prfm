package com.ingrc.performa.model;

public class INGRCBPRModel {

	private String bprc;
	private String text;
	public INGRCBPRModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public INGRCBPRModel(String bprc, String text) {
		super();
		this.bprc = bprc;
		this.text = text;
	}

	public String getBprc() {
		return bprc;
	}
	public void setBprc(String bprc) {
		this.bprc = bprc;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
