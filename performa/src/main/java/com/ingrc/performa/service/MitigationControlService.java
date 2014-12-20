package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcCtrlDao;
import com.ingrc.performa.model.INGRCCTRLModel;

@Service("mitigationControlService")
public class MitigationControlService {

	@Autowired
	private IngrcCtrlDao ingrcCtrlDao;
	
	public int save(INGRCCTRLModel model){
		return ingrcCtrlDao.save(model);
	}
	
	public int update(INGRCCTRLModel model){
		return ingrcCtrlDao.update(model);
	}
	
	public int delete(String ctrlid){
		return ingrcCtrlDao.delete(ctrlid);
	}
	
	public INGRCCTRLModel getCtrlById(String ctrlid){
		return ingrcCtrlDao.getCtrlById(ctrlid);
	}
	
	public List<INGRCCTRLModel> list(){
		return ingrcCtrlDao.list();
	}
}
