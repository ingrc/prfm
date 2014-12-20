package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class RuleMaintenanceAcFuncDto {
	
	@NotNull @NotEmpty
	@Length(max=8)
	private String fid;
	@NotNull
	private String text;
	@NotNull
	@Length(max=3)
	private String scope;
	@NotNull @NotEmpty
	private String bprc;
	private String bprtext;
	
	public RuleMaintenanceAcFuncDto() {
		super();
	}

	public RuleMaintenanceAcFuncDto(String fid, String text, String scope,
			String bprc, String bprtext) {
		super();
		this.fid = fid;
		this.text = text;
		this.scope = scope;
		this.bprc = bprc;
		this.bprtext = bprtext;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public String getBprc() {
		return bprc;
	}

	public void setBprc(String bprc) {
		this.bprc = bprc;
	}

	public String getBprtext() {
		return bprtext;
	}

	public void setBprtext(String bprtext) {
		this.bprtext = bprtext;
	}

	@Override
	public String toString() {
		return "RuleMaintenanceAcFuncDto [fid=" + fid + ", text=" + text
				+ ", scope=" + scope + ", bprc=" + bprc + ", bprtext="
				+ bprtext + "]";
	}


}
