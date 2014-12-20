package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcRuleMaintenanceAcFActDao;
import com.ingrc.performa.dao.IngrcRuleMaintenanceAcFuncDao;
import com.ingrc.performa.model.INGRCAcFActModel;
import com.ingrc.performa.model.INGRCAcFuncModel;
import com.ingrc.performa.model.INGRCBPRModel;
import com.ingrc.performa.model.SAPTSTCModel;
import com.ingrc.performa.web.dto.RuleMaintenanceAcFActDto;
import com.ingrc.performa.web.dto.RuleMaintenanceAcFuncDto;

@Service("rulemaintenanceAcFActService")
public class RuleMaintenanceAcFActService {
	@Autowired
	private IngrcRuleMaintenanceAcFActDao ingrcRuleMaintenanceDao;
	
	public Integer save(RuleMaintenanceAcFActDto dto){
		INGRCAcFActModel model = new INGRCAcFActModel(dto.getFid(),dto.getTcode(),dto.getStat());
		return ingrcRuleMaintenanceDao.save(model);
	}
	
	public Integer update(RuleMaintenanceAcFActDto dto){
		INGRCAcFActModel model = new INGRCAcFActModel(dto.getFid(),dto.getTcode(),dto.getStat());
		return ingrcRuleMaintenanceDao.update(model);
	}
	
	public Integer delete(String fid, String tcode){
		return ingrcRuleMaintenanceDao.delete(fid,tcode);
	}
	
	public List<RuleMaintenanceAcFActDto> list(String fid){
		return ingrcRuleMaintenanceDao.list(fid);
	}
	
	public List<INGRCAcFuncModel> listFunctionAction(String bprc){
		return ingrcRuleMaintenanceDao.listFunctionAction(bprc);
	}
	
	public List<INGRCBPRModel> listBusinessProcess(){
		return ingrcRuleMaintenanceDao.listBusinessProcess();
	}
	
	public RuleMaintenanceAcFActDto getById(String fid,String tcode){
		RuleMaintenanceAcFActDto model = ingrcRuleMaintenanceDao.getById(fid,tcode);
		RuleMaintenanceAcFActDto dto = new RuleMaintenanceAcFActDto(model.getFid(),model.getFidtext(),model.getTcode(),model.getTcodetext(),model.getStat());
		return dto;
	}
	
	public SAPTSTCModel checkTcode(String tcode){
		return ingrcRuleMaintenanceDao.getByTcode(tcode);
	}
	
}
