package com.ingrc.performa.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class MenuMasterModel {

	private Integer id;
	private String url;
	@NotNull @NotEmpty
	private String displayname;
	private String description;
	@NotNull
	private Integer parentId;
	public MenuMasterModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDisplayname() {
		return displayname;
	}
	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	@Override
	public String toString() {
		return "MenuMasterModel [id=" + id + ", url=" + url + ", displayname="
				+ displayname + ", description=" + description + ", parentId="
				+ parentId + "]";
	}
	
	
	
	
}
