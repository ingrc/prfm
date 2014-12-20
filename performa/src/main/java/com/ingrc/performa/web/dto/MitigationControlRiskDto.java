package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import com.ingrc.performa.model.INGRCControlRiskModel;

public class MitigationControlRiskDto {

	private String controlId;
	@NotNull
	private String riskId;
	private String description;
	private String level;
	
	public MitigationControlRiskDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MitigationControlRiskDto(String controlId, String riskId,
			String description, String level) {
		super();
		this.controlId = controlId;
		this.riskId = riskId;
		this.description = description;
		this.level = level;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	
	public void constructModel(INGRCControlRiskModel model){
		model.setControlId(controlId);
		model.setRiskId(riskId);
	}
	
	public void constructDto(INGRCControlRiskModel model){
		this.controlId = model.getControlId();
		this.riskId = model.getRiskId();
	}
	
}
