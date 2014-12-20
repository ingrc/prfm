package com.ingrc.performa.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

public class INGRCAcFuncModel {
	@NotNull
	@Length(max=8)
	private String fid;
	@NotNull
	private String text;
	@NotNull
	@Length(max=3)
	private String scope;
	@NotNull
	private String bprc;
	public INGRCAcFuncModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public INGRCAcFuncModel(String fid, String text) {
		super();
		this.fid = fid;
		this.text = text;
	}

	public INGRCAcFuncModel(String fid, String text, String scope, String bprc) {
		super();
		this.fid = fid;
		this.text = text;
		this.scope = scope;
		this.bprc = bprc;
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
	@Override
	public String toString() {
		return "INGRCAcFuncModel [fid=" + fid + ", text=" + text + ", scope="
				+ scope + ", bprc=" + bprc + "]";
	}
	
	
}
