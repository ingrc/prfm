package com.ingrc.performa.component;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.ingrc.performa.model.INGRCReport;
import com.ingrc.performa.service.ReportService;

@Component("reportGeneratorThread")
@Scope("prototype")
public class ReportGeneratorThread implements Runnable{
	
	private static final Logger logger = Logger.getLogger(ReportGeneratorThread.class);
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	private String reportCode;
	private String reportName;
	private JasperPrint jasperPrint;
	private String outputReport;
	private ReportService reportService;
	
	public JasperPrint getJasperPrint() {
		return jasperPrint;
	}

	public void setJasperPrint(JasperPrint jasperPrint) {
		this.jasperPrint = jasperPrint;
	}

	public String getOutputReport() {
		return outputReport;
	}

	public void setOutputReport(String outputReport) {
		this.outputReport = outputReport;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}


	public String getReportCode() {
		return reportCode;
	}

	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}

	public ReportService getReportService() {
		return reportService;
	}

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}

	public void run() {
		Date date = new Date();
		logger.info("["+reportName+"] Generating report on ["+sdf.format(date)+"]");
		reportService.update(new INGRCReport(reportCode, reportName, new Date(), null, "On Progress..."));
		OutputStream output = null;
		try {
			output = new FileOutputStream(outputReport);
		} catch (FileNotFoundException e) {
			logger.error("Failed to create output report ["+e.getMessage()+"]");
		}
		try {
			JasperExportManager.exportReportToPdfStream(jasperPrint, output);
		} catch (JRException e) {
			logger.error("Failed to export report ["+e.getMessage()+"]");
		}
		
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info("["+reportName+"] Finished generate report on ["+sdf.format(new Date())+"]");
		reportService.update(new INGRCReport(reportCode, reportName, new Date(), outputReport, "Finish"));
	}

}
