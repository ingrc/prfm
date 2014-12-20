package com.ingrc.performa.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class MenuMasterLeftModel {

	private Integer id;
	@NotNull @NotEmpty
	private String displayname;
	private String url;
	private String description;
	private Integer parentId;
	@NotNull
	private Integer menuMasterId;
	public MenuMasterLeftModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MenuMasterLeftModel(Integer id, String displayname, String url,
			String description, Integer parentid, Integer menu_master_id) {
		super();
		this.id = id;
		this.displayname = displayname;
		this.url = url;
		this.description = description;
		this.parentId = parentid;
		this.menuMasterId = menu_master_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDisplayname() {
		return displayname;
	}
	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	public Integer getMenuMasterId() {
		return menuMasterId;
	}
	public void setMenuMasterId(Integer menuMasterId) {
		this.menuMasterId = menuMasterId;
	}
	
	
}
