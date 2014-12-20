package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcControlOwnerDao;
import com.ingrc.performa.model.INGRCControlOwnerModel;
import com.ingrc.performa.web.dto.MitigationControlOwnerDto;

@Service("mitigationControlOwnerService")
public class MitigationControlOwnerService {

	@Autowired
	private IngrcControlOwnerDao ingrcControlOwnerDao;
	
	public int save(INGRCControlOwnerModel model){
		return ingrcControlOwnerDao.save(model);
	}
	
	public int delete(String controlId, String owner){
		return ingrcControlOwnerDao.delete(controlId, owner);
	}
	
	public List<MitigationControlOwnerDto> listControlOwner(String controlId){
		return ingrcControlOwnerDao.listControlOwner(controlId);
	}
}
