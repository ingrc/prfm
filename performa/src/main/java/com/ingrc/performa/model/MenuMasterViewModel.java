package com.ingrc.performa.model;

public class MenuMasterViewModel {

	private Integer id;
	private Integer parentId;
	private Integer hlevel;
	private String displayname;
	private String url;
	private String display;
	public MenuMasterViewModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getHlevel() {
		return hlevel;
	}
	public void setHlevel(Integer hlevel) {
		this.hlevel = hlevel;
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
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	
}
