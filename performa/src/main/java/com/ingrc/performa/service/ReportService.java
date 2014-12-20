package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcReportDao;
import com.ingrc.performa.model.INGRCReport;

@Service("reportService")
public class ReportService {

	@Autowired
	private IngrcReportDao ingrcReportDao;
	
	public int update(INGRCReport report){
		return ingrcReportDao.update(report);
	}
	
	public List<INGRCReport> list(){
		return ingrcReportDao.list();
	}
	
	public INGRCReport getReportByCode(String reportCode){
		return ingrcReportDao.getReportByCode(reportCode);
	}
	
	public Integer resetStatus(String status){
		return ingrcReportDao.resetStatus(status);
	}
}
