package com.ingrc.performa.model;

public class INGRCTRCATModel {

	private String level;
	private String text;
	private String color;
	public INGRCTRCATModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCTRCATModel(String level, String text, String color) {
		super();
		this.level = level;
		this.text = text;
		this.color = color;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
