package com.ingrc.performa.model;

public class SAPTOBJTModel {
	private String langu;
    private String object;
    private String ttext;
	public SAPTOBJTModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SAPTOBJTModel(String object, String ttext) {
		super();
		this.object = object;
		this.ttext = ttext;
	}
	public String getLangu() {
		return langu;
	}
	public void setLangu(String langu) {
		this.langu = langu;
	}
	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}
	public String getTtext() {
		return ttext;
	}
	public void setTtext(String ttext) {
		this.ttext = ttext;
	}
	@Override
	public String toString() {
		return "SAPTOBJTModel [langu=" + langu + ", object=" + object
				+ ", ttext=" + ttext + "]";
	}
    
}
