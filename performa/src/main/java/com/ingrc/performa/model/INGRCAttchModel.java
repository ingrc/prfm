package com.ingrc.performa.model;

public class INGRCAttchModel {

	private Integer attchid;
	private String name;
	private String type;
	private String size;
	private String cdby;
	private String cdon;
	private String refid;
	private String docobj;
	private String url;
	private String delflag;
	public INGRCAttchModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCAttchModel(Integer attchid, String name, String type,
			String size, String cdby, String cdon, String refid, String docobj,
			String url, String delflag) {
		super();
		this.attchid = attchid;
		this.name = name;
		this.type = type;
		this.size = size;
		this.cdby = cdby;
		this.cdon = cdon;
		this.refid = refid;
		this.docobj = docobj;
		this.url = url;
		this.delflag = delflag;
	}
	public Integer getAttchid() {
		return attchid;
	}
	public void setAttchid(Integer attchid) {
		this.attchid = attchid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
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
	public String getRefid() {
		return refid;
	}
	public void setRefid(String refid) {
		this.refid = refid;
	}
	public String getDocobj() {
		return docobj;
	}
	public void setDocobj(String docobj) {
		this.docobj = docobj;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	
}
