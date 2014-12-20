package com.ingrc.performa.model;

public class INGRCLoginModel {
    private String username;
    private String password;
    private String lock;
    private String cdby;
    private String cdon;
    private String upby;
    private String upon;
    private String trdat;
    private String ltime;
    
	public INGRCLoginModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCLoginModel(String username, String password, String lock,
			String cdby, String cdon, String upby, String upon, String trdat,
			String ltime) {
		super();
		this.username = username;
		this.password = password;
		this.lock = lock;
		this.cdby = cdby;
		this.cdon = cdon;
		this.upby = upby;
		this.upon = upon;
		this.trdat = trdat;
		this.ltime = ltime;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLock() {
		return lock;
	}
	public void setLock(String lock) {
		this.lock = lock;
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
	public String getTrdat() {
		return trdat;
	}
	public void setTrdat(String trdat) {
		this.trdat = trdat;
	}
	public String getLtime() {
		return ltime;
	}
	public void setLtime(String ltime) {
		this.ltime = ltime;
	}
	@Override
	public String toString() {
		return "INGRCLoginModel [username=" + username + ", password="
				+ password + ", lock=" + lock + ", cdby=" + cdby + ", cdon="
				+ cdon + ", upby=" + upby + ", upon=" + upon + ", trdat="
				+ trdat + ", ltime=" + ltime + "]";
	}
    
    
}
