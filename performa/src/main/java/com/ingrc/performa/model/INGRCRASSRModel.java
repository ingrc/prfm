package com.ingrc.performa.model;

public class INGRCRASSRModel {

	private String assr;
	private String riskId;
	public INGRCRASSRModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCRASSRModel(String assr, String riskId) {
		super();
		this.assr = assr;
		this.riskId = riskId;
	}
	public String getAssr() {
		return assr;
	}
	public void setAssr(String assr) {
		this.assr = assr;
	}
	public String getRiskId() {
		return riskId;
	}
	public void setRiskId(String riskId) {
		this.riskId = riskId;
	}
	@Override
	public String toString() {
		return "INGRCRASSRModel [assr=" + assr + ", riskId=" + riskId + "]";
	}
	
}
