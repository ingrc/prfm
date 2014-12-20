package com.ingrc.performa.web.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

@Controller
public class BaseController {

	private static final String CONFIG_FILE = "config.properties";
	
	protected String BASE_UPLOAD_FOLDER;
	protected static final String UPLOAD_FOLDER = "/uploadfile";
	
	public String REPORT_BASE_FOLDER;
	public static final String REPORT_JASPER_FOLDER = "/";
	public static final String REPORT_OUTPUT_FOLDER = "/report-output";
	public String LOGO_URL;
	
	protected static final String FILE_TO_DB_FOLDER = "/filetodb";
	protected static final String ACCESSCONTROL_FOLDER = "/accesscontrol";
	
	protected static final String RISK_FOLDER = "/riskmanagement";
	protected static final String USER_FOLDER = "usermanagement";
	
	protected static final String BPR_FOLDER = "/rulemaintenance";

	@InitBinder
	/* Converts empty strings into null when a form is submitted */
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}
	
	public BaseController(){
		Properties prop = new Properties();
		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(CONFIG_FILE);
		try {
			prop.load(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		BASE_UPLOAD_FOLDER = prop.getProperty("base.upload.folder");
		REPORT_BASE_FOLDER = prop.getProperty("base.report.folder");
		LOGO_URL =  prop.getProperty("report.logo.url");
		
	}
}
