package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class TOwnDto {
	@NotNull @NotEmpty
	private String owner;
	@NotNull @NotEmpty
	private String username;
	private String roner;
	private String coner;
	private String soner;
	private String scner;
	private String cdby;
	private String cdon;
	private String upby;
	private String upon;
	public TOwnDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TOwnDto(String owner, String username, String roner, String coner,
			String soner, String scner, String cdby, String cdon, String upby,
			String upon) {
		super();
		this.owner = owner;
		this.username = username;
		this.roner = roner;
		this.coner = coner;
		this.soner = soner;
		this.scner = scner;
		this.cdby = cdby;
		this.cdon = cdon;
		this.upby = upby;
		this.upon = upon;
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
	public String getRoner() {
		return roner;
	}
	public void setRoner(String roner) {
		this.roner = roner;
	}
	public String getConer() {
		return coner;
	}
	public void setConer(String coner) {
		this.coner = coner;
	}
	public String getSoner() {
		return soner;
	}
	public void setSoner(String soner) {
		this.soner = soner;
	}
	public String getScner() {
		return scner;
	}
	public void setScner(String scner) {
		this.scner = scner;
	}
	public String getCdby() {
		return cdby;
	}
	public void setCdby(String cdby) {
		this.cdby = cdby;
	}
	public String getCdon() {
		return cdon;
	}
	public void setCdon(String cdon) {
		this.cdon = cdon;
	}
	public String getUpby() {
		return upby;
	}
	public void setUpby(String upby) {
		this.upby = upby;
	}
	public String getUpon() {
		return upon;
	}
	public void setUpon(String upon) {
		this.upon = upon;
	}
	@Override
	public String toString() {
		return "TOwnDto [owner=" + owner + ", username=" + username
				+ ", roner=" + roner + ", coner=" + coner + ", soner=" + soner
				+ ", scner=" + scner + ", cdby=" + cdby + ", cdon=" + cdon
				+ ", upby=" + upby + ", upon=" + upon + "]";
	}
	
	
}
