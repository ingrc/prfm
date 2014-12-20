package com.ingrc.performa.model;

import java.util.Date;

public class INGRCReport {

	private String reportCode;
	private String reportName;
	private Date lastGenerate;
	private String status;
	private String reportOuput;
	public INGRCReport() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCReport(String reportCode, String reportName, Date lastGenerate, String reportOutput,
			String status) {
		super();
		this.reportCode = reportCode;
		this.reportName = reportName;
		this.lastGenerate = lastGenerate;
		this.status = status;
		this.reportOuput = reportOutput;
	}
	public String getReportCode() {
		return reportCode;
	}
	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}
	public String getReportName() {
		return reportName;
	}
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	public Date getLastGenerate() {
		return lastGenerate;
	}
	public void setLastGenerate(Date lastGenerate) {
		this.lastGenerate = lastGenerate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReportOuput() {
		return reportOuput;
	}
	public void setReportOuput(String reportOuput) {
		this.reportOuput = reportOuput;
	}
	
	
}
