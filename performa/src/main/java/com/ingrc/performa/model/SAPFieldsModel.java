package com.ingrc.performa.model;

public class SAPFieldsModel {
private String key;
private String text;
public SAPFieldsModel() {
	super();
	// TODO Auto-generated constructor stub
}
public SAPFieldsModel(String key, String text) {
	super();
	this.key = key;
	this.text = text;
}
public String getKey() {
	return key;
}
public void setKey(String key) {
	this.key = key;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}
@Override
public String toString() {
	return "SAPFieldsModel [key=" + key + ", text=" + text + "]";
}


}
