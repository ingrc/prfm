package com.ingrc.performa.web.dto;

public class TOwnAndTOwnTDto {
	
	private String ownty;
	private String ownn;
	private String text;
	private String status;
	
	public TOwnAndTOwnTDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TOwnAndTOwnTDto(String ownty, String ownn, String text, String status) {
		super();
		this.ownty = ownty;
		this.ownn = ownn;
		this.text = text;
		this.status = status;
	}

	public String getOwnty() {
		return ownty;
	}

	public void setOwnty(String ownty) {
		this.ownty = ownty;
	}

	public String getOwnn() {
		return ownn;
	}

	public void setOwnn(String ownn) {
		this.ownn = ownn;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TOwnAndTOwnDto [ownty=" + ownty + ", ownn=" + ownn + ", text="
				+ text + ", status=" + status + "]";
	}
	
	

}
