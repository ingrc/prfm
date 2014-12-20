package com.ingrc.performa.model;

public class INGRCAcFActModel {
	private String fid;
	private String	tcode;
	private String stat;
	public INGRCAcFActModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCAcFActModel(String fid, String tcode, String stat) {
		super();
		this.fid = fid;
		this.tcode = tcode;
		this.stat = stat;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getTcode() {
		return tcode;
	}
	public void setTcode(String tcode) {
		this.tcode = tcode;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	@Override
	public String toString() {
		return "INGRCAcFActModel [fid=" + fid + ", tcode=" + tcode + ", stat="
				+ stat + "]";
	}
	
}
