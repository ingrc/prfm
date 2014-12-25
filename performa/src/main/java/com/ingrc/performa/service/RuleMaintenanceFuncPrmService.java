package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcRuleMaintenanceFuncPrmDao;
import com.ingrc.performa.model.INGRCFuncPrmModel;
import com.ingrc.performa.model.SAPFieldsModel;
import com.ingrc.performa.model.SAPTOBJTModel;
import com.ingrc.performa.web.dto.RuleMaintenanceFuncPrmDto;

@Service("ruleMaintenanceFuncPrmService")
public class RuleMaintenanceFuncPrmService {
	@Autowired
	private IngrcRuleMaintenanceFuncPrmDao ingrcRuleMaintenanceFuncPrmDao;
	
	public Integer save(RuleMaintenanceFuncPrmDto dto){
		INGRCFuncPrmModel model = new INGRCFuncPrmModel(dto.getBprc(),dto.getFid(),dto.getTcode(),dto.getObject(),dto.getField(),
				dto.getFrom_val(),dto.getTo_val(),dto.getSearch_type(),dto.getStatus());
		return ingrcRuleMaintenanceFuncPrmDao.save(model);
	}
	
	public Integer update(RuleMaintenanceFuncPrmDto dto){
		INGRCFuncPrmModel model = new INGRCFuncPrmModel(dto.getBprc(),dto.getFid(),dto.getTcode(),dto.getObject(),dto.getField(),
				dto.getFrom_val(),dto.getTo_val(),dto.getSearch_type(),dto.getStatus());
		return ingrcRuleMaintenanceFuncPrmDao.update(model);
	}
	
	public Integer delete(String bprc,String fid, String tcode, String object, String field){
		return ingrcRuleMaintenanceFuncPrmDao.delete(bprc,fid,tcode,object,field);
	}
	
	public List<RuleMaintenanceFuncPrmDto> list(String bprc,String fid,String tcode){
		return ingrcRuleMaintenanceFuncPrmDao.list(bprc,fid,tcode);
	}
	
	public List<RuleMaintenanceFuncPrmDto> listFunctionAction(String fid){
		return ingrcRuleMaintenanceFuncPrmDao.listFunctionAction(fid);
	}
	
	public List<SAPTOBJTModel> listObjectT(){
		return ingrcRuleMaintenanceFuncPrmDao.listObjectT();
	} 
	
	public List<SAPFieldsModel> listField(String object){
		return ingrcRuleMaintenanceFuncPrmDao.listField(object);
	} 
//	public List<INGRCBPRModel> listBusinessProcess(){
//		return ingrcRuleMaintenanceFuncPrmDao.listBusinessProcess();
//	}
	
	public RuleMaintenanceFuncPrmDto getById(String bprc,String fid,String tcode,String object,String field){
		RuleMaintenanceFuncPrmDto model = ingrcRuleMaintenanceFuncPrmDao.getById(bprc,fid,tcode,object,field);
		RuleMaintenanceFuncPrmDto dto = new RuleMaintenanceFuncPrmDto(model.getBprc(),model.getFid(),model.getTcode(),model.getObject(),
				model.getField(),model.getFrom_val(),model.getTo_val(),model.getSearch_type(),model.getStatus());
		return dto;
	}
//	
//	public SAPTSTCModel checkTcode(String tcode){
//		return ingrcRuleMaintenanceFuncPrmDao.getByTcode(tcode);
//	}
	
}
