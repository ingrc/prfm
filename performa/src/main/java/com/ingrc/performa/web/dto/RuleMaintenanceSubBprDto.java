package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class RuleMaintenanceSubBprDto {
	
	@NotNull @NotEmpty
	private String sbpr;
	@NotNull @NotEmpty
	private String bprc;
	private String text;
	private String bprtext;
	
	public RuleMaintenanceSubBprDto() {
		super();
	}

	public RuleMaintenanceSubBprDto(String sbpr, String bprc, String text,
			String bprtext) {
		super();
		this.sbpr = sbpr;
		this.bprc = bprc;
		this.text = text;
		this.bprtext = bprtext;
	}

	public String getSbpr() {
		return sbpr;
	}

	public void setSbpr(String sbpr) {
		this.sbpr = sbpr;
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

	public String getBprtext() {
		return bprtext;
	}

	public void setBprtext(String bprtext) {
		this.bprtext = bprtext;
	}

	@Override
	public String toString() {
		return "RuleMaintenanceSubBprDto [sbpr=" + sbpr + ", bprc=" + bprc
				+ ", text=" + text + ", bprtext=" + bprtext + "]";
	}



}
