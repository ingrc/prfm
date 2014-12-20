package com.ingrc.performa.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ingrc.performa.dao.IngrcRAssrDao;
import com.ingrc.performa.dao.IngrcRiskDao;
import com.ingrc.performa.model.INGRCRASSRModel;
import com.ingrc.performa.model.INGRCRiskModel;
import com.ingrc.performa.web.dto.RiskMaintenanceDto;

@Service("riskMaintenanceService")
public class RiskMaintenanceService {

	@Autowired
	private IngrcRiskDao ingrcRiskDao;
	@Autowired
	private IngrcRAssrDao ingrcRAssrDao;
	
	@Transactional
	public Integer save(RiskMaintenanceDto dto){
		INGRCRiskModel riskModel = new INGRCRiskModel();
		List<INGRCRASSRModel> rassrModel = new ArrayList<INGRCRASSRModel>();
		dto.constructModel(riskModel, rassrModel);
		System.out.println("KIRIM Save="+riskModel);
		return ingrcRiskDao.save(riskModel, rassrModel);
	}
	
	@Transactional
	public Integer update(RiskMaintenanceDto dto){
		INGRCRiskModel riskModel = new INGRCRiskModel();
		List<INGRCRASSRModel> rassrModel = new ArrayList<INGRCRASSRModel>();
		dto.constructModel(riskModel, rassrModel);
		return ingrcRiskDao.update(riskModel, rassrModel);
	}
	
	@Transactional
	public Integer delete(String riskId){
		return ingrcRiskDao.delete(riskId);
	}
	
	public List<INGRCRiskModel> list(){
		return ingrcRiskDao.list();
	}
	
	public RiskMaintenanceDto getRiskMaintenanceByRiskId(String riskId){
		INGRCRiskModel riskModel = ingrcRiskDao.getByRiskId(riskId);
		
		List<INGRCRASSRModel> rassrList = ingrcRAssrDao.list(riskId);
		
		RiskMaintenanceDto dto = new RiskMaintenanceDto();
		dto.constructDto(riskModel, rassrList);

		return dto;
	}
}
