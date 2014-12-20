package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import com.ingrc.performa.model.INGRCControlOwnerModel;

public class MitigationControlOwnerDto {

	private String controlId;
	@NotNull
	private String owner;
	private String username;
	public MitigationControlOwnerDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MitigationControlOwnerDto(String controlId, String owner,
			String username) {
		super();
		this.controlId = controlId;
		this.owner = owner;
		this.username = username;
	}
	public String getControlId() {
		return controlId;
	}
	public void setControlId(String controlId) {
		this.controlId = controlId;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void constructModel(INGRCControlOwnerModel model){
		model.setControlId(controlId);
		model.setOwner(owner);
	}
	
	public void constructDto(INGRCControlOwnerModel model){
		this.controlId = model.getControlId();
		this.owner = model.getOwner();
	}
}
