package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import com.ingrc.performa.model.INGRCROwnModel;

public class RiskMaintenanceOwnerDto {

	@NotNull
	private String riskId;
	@NotNull
	private String owner;
	private String name;
	private String role;
	public RiskMaintenanceOwnerDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RiskMaintenanceOwnerDto(String riskId, String name, String role, String owner) {
		super();
		this.riskId = riskId;
		this.name = name;
		this.role = role;
		this.owner = owner;
	}
	public String getRiskId() {
		return riskId;
	}
	public void setRiskId(String riskId) {
		this.riskId = riskId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	@Override
	public String toString() {
		return "RiskMaintenanceOwnerDto [riskId=" + riskId + ", name=" + name
				+ ", role=" + role + "]";
	}
	public void constructModel(INGRCROwnModel model){
		model.setOwner(owner);
		model.setRiskId(riskId);
	}
	public void constructDto(INGRCROwnModel model){
		this.owner = model.getOwner();
		this.riskId = model.getRiskId();
	}
}
