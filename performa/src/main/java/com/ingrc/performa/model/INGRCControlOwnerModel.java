package com.ingrc.performa.model;

public class INGRCControlOwnerModel {

	private String controlId;
	private String owner;
	public INGRCControlOwnerModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCControlOwnerModel(String controlId, String owner) {
		super();
		this.controlId = controlId;
		this.owner = owner;
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
	
}
