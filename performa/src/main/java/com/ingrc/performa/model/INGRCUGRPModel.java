package com.ingrc.performa.model;

public class INGRCUGRPModel {
	private String vclass;
    private String text;
    private String cdby;
    private String cdon;
    private String upby;
    private String upon;
    
	public INGRCUGRPModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public INGRCUGRPModel(String vclass, String text, String cdby, String cdon,
			String upby, String upon) {
		super();
		this.vclass = vclass;
		this.text = text;
		this.cdby = cdby;
		this.cdon = cdon;
		this.upby = upby;
		this.upon = upon;
	}

	public INGRCUGRPModel(String vclass, String text) {
		super();
		this.vclass = vclass;
		this.text = text;
	}
	
	public String getVclass() {
		return vclass;
	}

	public void setVclass(String vclass) {
		this.vclass = vclass;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
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

	@Override
	public String toString() {
		return "INGRCUGRPModel [vclass=" + vclass + ", text=" + text
				+ ", cdby=" + cdby + ", cdon=" + cdon + ", upby=" + upby
				+ ", upon=" + upon + "]";
	}
    

    
    
}
