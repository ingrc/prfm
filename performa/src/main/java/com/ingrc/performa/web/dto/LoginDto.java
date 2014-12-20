package com.ingrc.performa.web.dto;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.ingrc.performa.model.INGRCLoginModel;

public class LoginDto {
	@NotNull @NotEmpty
    private String username;
	@NotNull @NotEmpty
    private String password;
    private String lock;
    private String cdby;
    private String cdon;
    private String upby;
    private String upon;
    private String trdat;
    private String ltime;
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
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
		return "LoginDto [username=" + username + ", password=" + password
				+ ", lock=" + lock + ", cdby=" + cdby + ", cdon=" + cdon
				+ ", upby=" + upby + ", upon=" + upon + ", trdat=" + trdat
				+ ", ltime=" + ltime + "]";
	}
    
	public void constructModel(INGRCLoginModel model){
		model.setUsername(this.getUsername());
		model.setPassword(this.getPassword());
		model.setLock(this.getLock());
		model.setCdby(this.getCdby());
		model.setCdon(this.getCdon());
		model.setUpby(this.getUpby());
		model.setUpon(this.getUpon());
		model.setTrdat(this.getTrdat());
		model.setLtime(this.getLtime());
	}
	
	public void constructDto(INGRCLoginModel model){
		this.username = model.getUsername();
		this.password = model.getPassword();
		this.lock = model.getLock();
		this.cdby = model.getCdby();
		this.cdon = model.getCdon();
		this.upby = model.getUpby();
		this.upon = model.getUpon();
		this.trdat = model.getTrdat();
		this.ltime = model.getLtime();
	}
}
