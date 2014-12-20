package com.ingrc.performa.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class INGRCWebUserModel {

	@NotNull
	private String webUsername;
	@NotNull
	private String webPassword;
	private String role;
	private Boolean enabled;
	@NotNull @NotEmpty
	private String displayname;
	
	public INGRCWebUserModel() {
		super();
	}
	public INGRCWebUserModel(String webUsername, String webPassword,
			String role, Boolean enabled, String displayname) {
		super();
		this.webUsername = webUsername;
		this.webPassword = webPassword;
		this.role = role;
		this.enabled = enabled;
		this.displayname = displayname;
	}
	public String getWebUsername() {
		return webUsername;
	}
	public void setWebUsername(String webUsername) {
		this.webUsername = webUsername;
	}
	public String getWebPassword() {
		return webPassword;
	}
	public void setWebPassword(String webPassword) {
		this.webPassword = webPassword;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public String getDisplayname() {
		return displayname;
	}
	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}
	
	
}
