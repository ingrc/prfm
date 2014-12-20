package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcRuleMaintenanceAcFuncDao;
import com.ingrc.performa.model.INGRCAcFuncModel;
import com.ingrc.performa.web.dto.RuleMaintenanceAcFuncDto;

@Service("rulemaintenanceAcFuncService")
public class RuleMaintenanceAcFuncService {
	@Autowired
	private IngrcRuleMaintenanceAcFuncDao ingrcRuleMaintenanceDao;
	
	public Integer save(RuleMaintenanceAcFuncDto dto){
		INGRCAcFuncModel model = new INGRCAcFuncModel(dto.getFid(),dto.getText(),dto.getScope(),dto.getBprc());
		return ingrcRuleMaintenanceDao.save(model);
	}
	
	public Integer update(RuleMaintenanceAcFuncDto dto){
		INGRCAcFuncModel model = new INGRCAcFuncModel(dto.getFid(),dto.getText(),dto.getScope(),dto.getBprc());
		return ingrcRuleMaintenanceDao.update(model);
	}
	
	public Integer delete(String fid){
		return ingrcRuleMaintenanceDao.delete(fid);
	}
	
	public List<RuleMaintenanceAcFuncDto> list(){
		return ingrcRuleMaintenanceDao.list();
	}
	
	public RuleMaintenanceAcFuncDto getById(String fid){
		RuleMaintenanceAcFuncDto model = ingrcRuleMaintenanceDao.getById(fid);
		RuleMaintenanceAcFuncDto dto = new RuleMaintenanceAcFuncDto(model.getFid(),model.getText(),model.getScope(),model.getBprc(),model.getBprtext());
		return dto;
	}
}
