package com.ingrc.performa.component;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ingrc.performa.dao.ReportDataGeneratorDao;
import com.ingrc.performa.model.INGRCReport;
import com.ingrc.performa.model.INGRCSqlScriptModel;
import com.ingrc.performa.service.ReportService;
import com.ingrc.performa.service.SqlScriptService;
import com.ingrc.performa.web.controller.BaseController;

@Component
@EnableScheduling
public class DataUploaderScheduler extends BaseController {
	
	@Autowired
	private ReportDataGeneratorDao reportDataGeneratorDao;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private SqlScriptService sqlScriptService;
	
//	private static final String UPLOADER_SQL_SCRIPT = "report-script.sql";
	private String reportPath = REPORT_BASE_FOLDER + BaseController.REPORT_JASPER_FOLDER;
	private String outputPath = REPORT_BASE_FOLDER + BaseController.REPORT_OUTPUT_FOLDER;
	
	private static final Logger logger = Logger.getLogger(DataUploaderScheduler.class);
	
	// http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/scheduling/support/CronSequenceGenerator.html
	@Scheduled(cron="0 */15 * * * *")
	public void runScheduler(){
//		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(UPLOADER_SQL_SCRIPT);
//
//		BufferedReader reader = null;
//		reader = new BufferedReader(new InputStreamReader(inputStream));
//		
//		String line="";
//		try {
//			reportService.resetStatus("Uploading data");
//			while ((line = reader.readLine()) != null) {
//				logger.info("executing script ["+line+"] at ["+new Date()+"]");
//				reportDataGeneratorDao.execScript(line);
//			}
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		for (INGRCSqlScriptModel model:sqlScriptService.list()){
			logger.info("executing script ["+model.getName()+"] ["+model.getSqlScript()+"] at ["+new Date()+"]");
			reportDataGeneratorDao.execScript(model.getSqlScript());
		}
		
		reportService.resetStatus("Ready");
		logger.info("Generating all reports");
		generateReport("role-analysis");
		generateReport("saptu-hrposition");
		generateReport("saptu-tcodeassign");
		generateReport("saptu-unused");
		generateReport("superuser-log");
		generateReport("superuser-log-excel");
		generateReport("unauth-access");
		generateReport("user-access-matrix");
		generateReport("user-access-matrix-excel");
		generateReport("user-access-matrix-pdf");
		generateReport("user-analysis");
		generateReport("password-monitoring");
		
	}
	
	private void generateReport(String reportType){
		reportService.update(new INGRCReport(reportType, null, new Date(), null, "On Progress..."));
		String reportOutput="";
		
		if (reportType.equalsIgnoreCase("user-analysis")){
			reportOutput = outputPath + "/user-analysis.pdf";
			
			generateReportWithDetail(reportType,
					reportPath + "/user-analysis.jrxml", 
					reportPath + "/user-analysis-detail.jrxml", 
					reportOutput);
			
		}
		if (reportType.equalsIgnoreCase("role-analysis")){
			reportOutput = outputPath + "/role-analysis.pdf";
			
			generateReportWithDetail(reportType,
					reportPath + "/role-analysis.jrxml", 
					reportPath + "/role-analysis-detail.jrxml", 
					reportOutput);
		}
		if (reportType.equalsIgnoreCase("saptu-tcodeassign")){
			reportOutput = outputPath + "/saptu-tcodeassign.pdf";
			
			generateSingleReport(reportType,
					reportPath + "/saptu-tcodeassign.jrxml",
					reportOutput
					);
		}
		if (reportType.equalsIgnoreCase("saptu-hrposition")){
			reportOutput = outputPath + "/saptu-hrposition.pdf";
			generateSingleReport(reportType,
					reportPath + "/saptu-hrposition.jrxml",
					reportOutput
					);
		}
		if (reportType.equalsIgnoreCase("saptu-unused")){
			reportOutput = outputPath + "/saptu-unused.pdf";
			generateSingleReport(reportType,
					reportPath + "/saptu-unused.jrxml",
					reportOutput
					);
		}
		if (reportType.equalsIgnoreCase("unauth-access")){
			reportOutput = outputPath + "/unauthorized-access.pdf";
			generateSingleReport(reportType,
					reportPath + "/unauthorized-access.jrxml",
					reportOutput
					);
		}
		if (reportType.equalsIgnoreCase("superuser-log")){
			reportOutput =outputPath + "/superuser-log-review.pdf";
			generateSingleReport(reportType,
					reportPath + "/superuser-log-review.jrxml",
					reportOutput
					);
		}
		if (reportType.equalsIgnoreCase("superuser-log-excel")){
			reportOutput = outputPath + "/superuser-log-excel.xls";
			generateSingleReportExcel(reportType,
					reportPath + "/superuser-log-review.jrxml",
					reportOutput
					);
		}
		if (reportType.equalsIgnoreCase("user-access-matrix-excel")){
			reportOutput = outputPath + "/user-access-matrix.xls";
			generateSingleReportExcel(reportType,
					reportPath + "/user-access-matrix-raw.jrxml",
					reportOutput
					);
		}
		if (reportType.equalsIgnoreCase("user-access-matrix-pdf")){
			reportOutput = outputPath + "/user-access-matrix.pdf";
			generateSingleReport(reportType,
					reportPath + "/user-access-matrix-raw.jrxml",
					reportOutput
					);
		}
		if (reportType.equalsIgnoreCase("user-access-matrix")){
			reportOutput = outputPath + "/user-access-matrix.pdf";
			generateSingleReport(reportType,
					reportPath + "/user-access-matrix.jrxml",
					reportOutput
					);
		}
		if (reportType.equalsIgnoreCase("password-monitoring")){
			reportOutput = outputPath + "/password-monitoring.pdf";
			generateSingleReport(reportType,
					reportPath + "/password_monitoring.jrxml",
					reportOutput
					);
		}
		reportService.update(new INGRCReport(reportType, null, new Date(), reportOutput, "Finish"));
	}
	
	private void generateSingleReportExcel(String reportCode, String reportName, String outputExcel){
		try {
			JasperReport jasperReport = JasperCompileManager.compileReport(reportName);
			
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("logo", LOGO_URL);
			
			Connection connection = dataSource.getConnection();
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
			
			JRXlsExporter exporter = new JRXlsExporter();
			exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(outputExcel));
			exporter.exportReport();
			
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
	
	private void generateSingleReport(String reportCode, String reportName, String outputPDF){
		try {
			JasperReport jasperReport = JasperCompileManager.compileReport(reportName);
			
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("logo", LOGO_URL);
			
			Connection connection = dataSource.getConnection();
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
			
			
			OutputStream output = new FileOutputStream(outputPDF);
			JasperExportManager.exportReportToPdfStream(jasperPrint, output);
			
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
		catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
			
			OutputStream output = new FileOutputStream(outputPDF);
			JasperExportManager.exportReportToPdfStream(jasperPrint, output);
			
			
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
