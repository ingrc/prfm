package com.ingrc.performa.model;

public class INGRCRiskModel {

	private String riskid;
	private String text;
	private String level;
	private String rtype;
	private String stat;
	private String bprc;
	private String sbpr;
	private String cobj;
	private String cdby;
	private String cdon;
	private String upby;
	private String upon;
	private String fid1;
	private String fid2;
	private String fid3;
	private String fid4;
	private String fid5;
	
	
	public INGRCRiskModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCRiskModel(String riskid, String text, String level, String rtype,
			String stat, String bprc, String sbpr, String cobj, 
			String fid1, String fid2,String fid3,String fid4,String fid5) {
		super();
		this.riskid = riskid;
		this.text = text;
		this.level = level;
		this.rtype = rtype;
		this.stat = stat;
		this.bprc = bprc;
		this.sbpr = sbpr;
		this.cobj = cobj;
		this.fid1 =fid1;
		this.fid2 =fid2;
		this.fid3 =fid3;
		this.fid4 =fid4;
		this.fid5 =fid5;
	}
	public String getRiskid() {
		return riskid;
	}
	public void setRiskid(String riskid) {
		this.riskid = riskid;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String rtype) {
		this.rtype = rtype;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getBprc() {
		return bprc;
	}
	public void setBprc(String bprc) {
		this.bprc = bprc;
	}
	public String getSbpr() {
		return sbpr;
	}
	public void setSbpr(String sbpr) {
		this.sbpr = sbpr;
	}
	public String getCobj() {
		return cobj;
	}
	public void setCobj(String cobj) {
		this.cobj = cobj;
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
	public String getFid1() {
		return fid1;
	}
	public void setFid1(String fid1) {
		this.fid1 = fid1;
	}
	public String getFid2() {
		return fid2;
	}
	public void setFid2(String fid2) {
		this.fid2 = fid2;
	}
	public String getFid3() {
		return fid3;
	}
	public void setFid3(String fid3) {
		this.fid3 = fid3;
	}
	public String getFid4() {
		return fid4;
	}
	public void setFid4(String fid4) {
		this.fid4 = fid4;
	}
	public String getFid5() {
		return fid5;
	}
	public void setFid5(String fid5) {
		this.fid5 = fid5;
	}
	
}
