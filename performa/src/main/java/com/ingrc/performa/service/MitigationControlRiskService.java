package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcControlRiskDao;
import com.ingrc.performa.model.INGRCControlRiskModel;
import com.ingrc.performa.web.dto.MitigationControlRiskDto;

@Service("mitigationControlRiskService")
public class MitigationControlRiskService {

	@Autowired
	private IngrcControlRiskDao ingrcControlRiskDao;
	
	public int save(INGRCControlRiskModel model){
		return ingrcControlRiskDao.save(model);
	}
	
	public int delete(String controlId, String riskId){
		return ingrcControlRiskDao.delete(controlId, riskId);
	}
	
	public List<MitigationControlRiskDto> list(String controlId){
		return ingrcControlRiskDao.listControlRisk(controlId);
	}
}
