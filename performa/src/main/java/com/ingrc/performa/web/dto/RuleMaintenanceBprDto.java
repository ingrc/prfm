package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class RuleMaintenanceBprDto {
	@NotNull @NotEmpty
	private String bprc;
	@NotNull @NotEmpty
	private String text;
	
	public RuleMaintenanceBprDto() {
		super();
	}
	public RuleMaintenanceBprDto(String bprc, String text) {
		super();
		this.bprc = bprc;
		this.text = text;
	}
	public String getBprc() {
		return bprc;
	}
	public void setBprc(String bprc) {
		this.bprc = bprc;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "RuleMaintenanceBprDto [bprc=" + bprc + ", text=" + text + "]";
	}
	
	
}
