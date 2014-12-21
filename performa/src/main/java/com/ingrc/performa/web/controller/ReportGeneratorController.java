package com.ingrc.performa.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ingrc.performa.component.ReportGeneratorThread;
import com.ingrc.performa.model.INGRCReport;
import com.ingrc.performa.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportGeneratorController extends BaseController {
	
	private String reportPath = REPORT_BASE_FOLDER + BaseController.REPORT_JASPER_FOLDER;
	private String outputPath = REPORT_BASE_FOLDER + BaseController.REPORT_OUTPUT_FOLDER;
//	private static final String LOGO_URL = "http://localhost:8080/performa/img/logo-beraucoal-report.png";
	
	@Autowired
	private DataSource dataSource;

	@Autowired
	private ReportGeneratorThread reportGeneratorThread;
	
	@Autowired
	private ThreadPoolTaskExecutor taskExecutor;
	
	@Autowired
	private ReportService reportService;

	@RequestMapping("/list.html")
	public String doList(Model model, HttpServletRequest request){
		model.addAttribute("listModel", reportService.list());
		if (request.getParameter("reportType") != null){
			generateReport(request);
		}
		return "/report-list";
	}
	
	private String generateReport(HttpServletRequest request){
		String reportType = request.getParameter("reportType");
		reportService.update(new INGRCReport(reportType, null, new Date(), null, "On Progress..."));
		
		if (reportType.equalsIgnoreCase("user-analysis")){
			generateReportWithDetail(reportType,
					reportPath + "/user-analysis.jrxml", 
					reportPath + "/user-analysis-detail.jrxml", 
					outputPath + "/user-analysis");
		}
		if (reportType.equalsIgnoreCase("role-analysis")){
			generateReportWithDetail(reportType,
					reportPath + "/role-analysis.jrxml", 
					reportPath + "/role-analysis-detail.jrxml", 
					outputPath + "/role-analysis");
		}
		if (reportType.equalsIgnoreCase("saptu-tcodeassign")){
			generateSingleReport(reportType,
					reportPath + "/saptu-tcodeassign.jrxml",
					outputPath + "/saptu-tcodeassign"
					);
		}
		if (reportType.equalsIgnoreCase("saptu-hrposition")){
			generateSingleReport(reportType,
					reportPath + "/saptu-hrposition.jrxml",
					outputPath + "/saptu-hrposition"
					);
		}
		if (reportType.equalsIgnoreCase("saptu-unused")){
			generateSingleReport(reportType,
					reportPath + "/saptu-unused.jrxml",
					outputPath + "/saptu-unused"
					);
		}
		if (reportType.equalsIgnoreCase("unauth-access")){
			generateSingleReport(reportType,
					reportPath + "/unauthorized-access.jrxml",
					outputPath + "/unauthorized-access"
					);
		}
		if (reportType.equalsIgnoreCase("superuser-log")){
			generateSingleReport(reportType,
					reportPath + "/superuser-log-review.jrxml",
					outputPath + "/superuser-log-review"
					);
		}
		if (reportType.equalsIgnoreCase("user-access-matrix-raw")){
			generateSingleReport(reportType,
					reportPath + "/user-access-matrix-raw.jrxml",
					outputPath + "/user-access-matrix-raw"
					);
		}
		
		return "finish-generate";
	}
	
	private void generateSingleReport(String reportCode, String reportName, String outputPDF){
		try {
			JasperReport jasperReport = JasperCompileManager.compileReport(reportName);
			
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("logo", LOGO_URL);
			
			Connection connection = dataSource.getConnection();
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
			
			ReportGeneratorThread rptGen = new ReportGeneratorThread();
			rptGen.setReportName(reportName);
			rptGen.setJasperPrint(jasperPrint);
			rptGen.setOutputReport(outputPDF /*+ "-" + sdfReport.format(date) */ + ".pdf");
			rptGen.setReportCode(reportCode);
			rptGen.setReportService(reportService);
			taskExecutor.execute(rptGen);
			
//			OutputStream output = new FileOutputStream(outputPDF);
//			JasperExportManager.exportReportToPdfStream(jasperPrint, output);
			
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
	
	private void generateReportWithDetail(String reportCode, String masterReport, String subReport, String outputPDF){
		try {
//			JasperDesign userAnalysisJD = JRXmlLoader.load(userAnalysisJasper);
//			JasperDesign userAnalysisDetailJD = JRXmlLoader.load(userAnalysisDetailJasper);
			
			JasperReport jasperReport = JasperCompileManager.compileReport(masterReport);
			JasperReport jasperDetailReport = JasperCompileManager.compileReport(subReport);
			
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("logo", LOGO_URL);
			parameters.put("subreportParameter", jasperDetailReport);
			
			Connection connection = dataSource.getConnection();
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
			
//			OutputStream output = new FileOutputStream(outputPDF);
//			JasperExportManager.exportReportToPdfStream(jasperPrint, output);
			ReportGeneratorThread rptGen = new ReportGeneratorThread();
			rptGen.setReportName(masterReport);
			rptGen.setJasperPrint(jasperPrint);
			rptGen.setOutputReport(outputPDF /* + "-" + sdfReport.format(date)*/ + ".pdf");
			rptGen.setReportCode(reportCode);
			rptGen.setReportService(reportService);
			taskExecutor.execute(rptGen);
			
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
	}
	
	@RequestMapping("/list-report.html")
	public void listReport(HttpServletRequest request){
		
	}
	
	@RequestMapping(value="/get")
	public void getAttachment(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String reportType = request.getParameter("reportType");
		INGRCReport reportModel = reportService.getReportByCode(reportType);
		
		if (reportType.contains("excel")){
			response.setContentType("application/vnd.ms-excel");
			response.setHeader( "Content-Disposition", "filename=\""+reportModel.getReportName().replace(" ", "-")+".xls\"");
			
		} else {
			response.setContentType("application/pdf");
			response.setHeader( "Content-Disposition", "filename=\""+reportModel.getReportName().replace(" ", "-")+".pdf\"");
			
		}
		
		InputStream in = new FileInputStream(new File(reportModel.getReportOuput()));
		IOUtils.copy(in, response.getOutputStream());
	}
}
