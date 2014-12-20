package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcROwnDao;
import com.ingrc.performa.model.INGRCROwnModel;
import com.ingrc.performa.web.dto.RiskMaintenanceOwnerDto;

@Service("riskMaintenanceOwnerService")
public class RiskMaintenanceOwnerService {

	@Autowired
	private IngrcROwnDao ingrcROwnDao;
	
	public int save(INGRCROwnModel model){
		return ingrcROwnDao.save(model);
	}
	
	public int delete(String riskId, String owner){
		return ingrcROwnDao.delete(riskId, owner);
	}
	
	public List<INGRCROwnModel> list(String riskId){
		return ingrcROwnDao.list(riskId);
	}
	
	public List<RiskMaintenanceOwnerDto> listOwner(String riskId){
		return ingrcROwnDao.listOwner(riskId);
	}
}
