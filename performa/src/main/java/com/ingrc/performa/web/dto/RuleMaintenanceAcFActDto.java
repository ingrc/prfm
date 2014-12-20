package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class RuleMaintenanceAcFActDto {
	@NotNull @NotEmpty
	private String fid;
	private String fidtext;
	@NotNull @NotEmpty
	private String	tcode;
	private String tcodetext;
	private String stat;
	public RuleMaintenanceAcFActDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RuleMaintenanceAcFActDto(String fid, String fidtext, String tcode,
			String tcodetext, String stat) {
		super();
		this.fid = fid;
		this.fidtext = fidtext;
		this.tcode = tcode;
		this.tcodetext = tcodetext;
		this.stat = stat;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getFidtext() {
		return fidtext;
	}
	public void setFidtext(String fidtext) {
		this.fidtext = fidtext;
	}
	public String getTcode() {
		return tcode;
	}
	public void setTcode(String tcode) {
		this.tcode = tcode;
	}
	public String getTcodetext() {
		return tcodetext;
	}
	public void setTcodetext(String tcodetext) {
		this.tcodetext = tcodetext;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	@Override
	public String toString() {
		return "RuleMaintenanceAcFActDto [fid=" + fid + ", fidtext=" + fidtext
				+ ", tcode=" + tcode + ", tcodetext=" + tcodetext + ", stat="
				+ stat + "]";
	}

}
