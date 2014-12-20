package com.ingrc.performa.web.dto;

public class MenuMasterDto {

	private Integer id;
	private String displayname;
	private String url;
	private String menulevel;
	public MenuMasterDto() {
		super();
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
	public String getMenulevel() {
		return menulevel;
	}
	public void setMenulevel(String menulevel) {
		this.menulevel = menulevel;
	}
	
	
}
