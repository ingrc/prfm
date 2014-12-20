package com.ingrc.performa.model;

public class INGRCTOwnTModel {
	private String ownty;
	private String ownn;
	private String lang;
	private String text;
	public INGRCTOwnTModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCTOwnTModel(String ownty, String ownn, String lang, String text) {
		super();
		this.ownty = ownty;
		this.ownn = ownn;
		this.lang = lang;
		this.text = text;
	}
	public String getOwnty() {
		return ownty;
	}
	public void setOwnty(String ownty) {
		this.ownty = ownty;
	}
	public String getOwnn() {
		return ownn;
	}
	public void setOwnn(String ownn) {
		this.ownn = ownn;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "INGRCTOwnT [ownty=" + ownty + ", ownn=" + ownn + ", lang="
				+ lang + ", text=" + text + "]";
	}
	
	
}
