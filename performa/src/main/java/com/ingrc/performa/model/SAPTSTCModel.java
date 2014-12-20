package com.ingrc.performa.model;

public class SAPTSTCModel {
	private String tcode;
	private String pgmna;
	public SAPTSTCModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SAPTSTCModel(String tcode, String pgmna) {
		super();
		this.tcode = tcode;
		this.pgmna = pgmna;
	}
	public String getTcode() {
		return tcode;
	}
	public void setTcode(String tcode) {
		this.tcode = tcode;
	}
	public String getPgmna() {
		return pgmna;
	}
	public void setPgmna(String pgmna) {
		this.pgmna = pgmna;
	}
	@Override
	public String toString() {
		return "SAP_TSTC [tcode=" + tcode + ", pgmna=" + pgmna + "]";
	}
	
	
}
