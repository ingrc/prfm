package com.ingrc.performa.model;

public class INGRCORGModel {

	private String orgc;
	private String name;
	public INGRCORGModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCORGModel(String orgc, String name) {
		super();
		this.orgc = orgc;
		this.name = name;
	}
	public String getOrgc() {
		return orgc;
	}
	public void setOrgc(String orgc) {
		this.orgc = orgc;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
