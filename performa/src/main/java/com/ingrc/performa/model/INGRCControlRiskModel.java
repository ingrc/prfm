package com.ingrc.performa.model;

public class INGRCControlRiskModel {

	private String controlId;
	private String riskId;
	public INGRCControlRiskModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCControlRiskModel(String controlId, String riskId) {
		super();
		this.controlId = controlId;
		this.riskId = riskId;
	}
	public String getControlId() {
		return controlId;
	}
	public void setControlId(String controlId) {
		this.controlId = controlId;
	}
	public String getRiskId() {
		return riskId;
	}
	public void setRiskId(String riskId) {
		this.riskId = riskId;
	}
	
}
