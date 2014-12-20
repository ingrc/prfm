package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import com.ingrc.performa.model.INGRCCTRLModel;

public class MitigationControlDto {

	@NotNull
	private String mitigationControlId;
	private String reference;
	@NotNull
	private String name;
	@NotNull
	private String mitigationType;
	private String frequency;
	@NotNull
	private String organization;
	private String businessProcess;
	private String subProcess;
	private String description;
	public MitigationControlDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MitigationControlDto(String mitigationControlId, String reference,
			String name, String mitigationType, String frequency,
			String organization, String businessProcess, String subProcess,
			String description) {
		super();
		this.mitigationControlId = mitigationControlId;
		this.reference = reference;
		this.name = name;
		this.mitigationType = mitigationType;
		this.frequency = frequency;
		this.organization = organization;
		this.businessProcess = businessProcess;
		this.subProcess = subProcess;
		this.description = description;
	}
	public String getMitigationControlId() {
		return mitigationControlId;
	}
	public void setMitigationControlId(String mitigationControlId) {
		this.mitigationControlId = mitigationControlId;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMitigationType() {
		return mitigationType;
	}
	public void setMitigationType(String mitigationType) {
		this.mitigationType = mitigationType;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public String getBusinessProcess() {
		return businessProcess;
	}
	public void setBusinessProcess(String businessProcess) {
		this.businessProcess = businessProcess;
	}
	public String getSubProcess() {
		return subProcess;
	}
	public void setSubProcess(String subProcess) {
		this.subProcess = subProcess;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public void constructModel(INGRCCTRLModel model){
		model.setCtrlId(this.mitigationControlId);
		model.setCtrlName(this.name);
		model.setDescription(this.description);
		model.setCtype(mitigationType);
		model.setCref(this.reference);
		model.setCfreq(this.frequency);
		model.setBprc(this.businessProcess);
		model.setSbpr(subProcess);
		model.setOrgc(this.organization);
	}
	
	public void constructDto(INGRCCTRLModel model){
		this.mitigationControlId = model.getCtrlId();
		this.name = model.getCtrlName();
		this.description = model.getDescription();
		this.mitigationType = model.getCtype();
		this.reference = model.getCref();
		this.frequency = model.getCfreq();
		this.businessProcess = model.getBprc();
		this.subProcess = model.getSbpr();
		this.organization = model.getOrgc();
		
	}
	
}
