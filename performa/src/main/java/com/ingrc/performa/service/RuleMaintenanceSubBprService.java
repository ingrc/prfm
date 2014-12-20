package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcRuleMaintenanceSubBprDao;
import com.ingrc.performa.model.INGRCSPRModel;
import com.ingrc.performa.web.dto.RuleMaintenanceSubBprDto;

@Service("rulemaintenancesubbprService")
public class RuleMaintenanceSubBprService {
	@Autowired
	private IngrcRuleMaintenanceSubBprDao ingrcRuleMaintenanceDao;
	
	public Integer save(RuleMaintenanceSubBprDto dto){
		INGRCSPRModel model = new INGRCSPRModel(dto.getSbpr(),dto.getBprc(),dto.getText());
		return ingrcRuleMaintenanceDao.save(model);
	}
	
	public Integer update(RuleMaintenanceSubBprDto dto){
		INGRCSPRModel model = new INGRCSPRModel(dto.getSbpr(),dto.getBprc(),dto.getText());
		return ingrcRuleMaintenanceDao.update(model);
	}
	
	public Integer delete(String sbpr){
		return ingrcRuleMaintenanceDao.delete(sbpr);
	}
	
	public List<RuleMaintenanceSubBprDto> list(){
		return ingrcRuleMaintenanceDao.list();
	}
	
	public RuleMaintenanceSubBprDto getById(String sbpr){
		RuleMaintenanceSubBprDto model = ingrcRuleMaintenanceDao.getById(sbpr);
		RuleMaintenanceSubBprDto dto = new RuleMaintenanceSubBprDto(model.getSbpr(),model.getBprc(),model.getText(),model.getBprtext());
		return dto;
	}
}
