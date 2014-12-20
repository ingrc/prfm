package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcRuleMaintenanceBprDao;
import com.ingrc.performa.model.INGRCBPRModel;
import com.ingrc.performa.web.dto.RuleMaintenanceBprDto;

@Service("rulemaintenancebprService")
public class RuleMaintenanceBprService {
	@Autowired
	private IngrcRuleMaintenanceBprDao ingrcRuleMaintenanceDao;
	
	public Integer save(RuleMaintenanceBprDto dto){
		INGRCBPRModel model = new INGRCBPRModel(dto.getBprc(),dto.getText());
		return ingrcRuleMaintenanceDao.save(model);
	}
	
	public Integer update(RuleMaintenanceBprDto dto){
		INGRCBPRModel model = new INGRCBPRModel(dto.getBprc(),dto.getText());
		return ingrcRuleMaintenanceDao.update(model);
	}
	
	public Integer delete(String bprc){
		return ingrcRuleMaintenanceDao.delete(bprc);
	}
	
	public List<INGRCBPRModel> list(){
		return ingrcRuleMaintenanceDao.list();
	}
	
	public RuleMaintenanceBprDto getById(String bprc){
		INGRCBPRModel model = ingrcRuleMaintenanceDao.getById(bprc);
		RuleMaintenanceBprDto dto = new RuleMaintenanceBprDto(model.getBprc(),model.getText());
		return dto;
	}
}
