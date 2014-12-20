package com.ingrc.performa.model;

public class INGRCROwnModel {

	private String riskId;
	private String owner;
	public INGRCROwnModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCROwnModel(String riskId, String owner) {
		super();
		this.riskId = riskId;
		this.owner = owner;
	}
	public String getRiskId() {
		return riskId;
	}
	public void setRiskId(String riskId) {
		this.riskId = riskId;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	
}
