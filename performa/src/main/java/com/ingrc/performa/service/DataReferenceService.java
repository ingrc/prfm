package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.DataReferenceDao;
import com.ingrc.performa.model.INGRCAcFuncModel;
import com.ingrc.performa.model.INGRCBPRModel;
import com.ingrc.performa.model.INGRCORGModel;
import com.ingrc.performa.model.INGRCSPRModel;
import com.ingrc.performa.model.INGRCTASSRModel;
import com.ingrc.performa.model.INGRCTCTYModel;
import com.ingrc.performa.model.INGRCTOwnModel;
import com.ingrc.performa.model.INGRCTRCATModel;
import com.ingrc.performa.model.INGRCTRTYModel;
import com.ingrc.performa.model.INGRCTableNameModel;
import com.ingrc.performa.model.INGRCUGRPModel;
import com.ingrc.performa.web.dto.TOwnAndTOwnTDto;

@Service("dataReferenceService")
public class DataReferenceService {

	@Autowired
	private DataReferenceDao dataReferenceDao;
	
	public List<INGRCBPRModel> getBPRList(){
		return dataReferenceDao.getBPRList();
	}
	
	public List<INGRCSPRModel> getSPRList(String bprc){
		return dataReferenceDao.getSPRList(bprc);
	}
	
	public List<INGRCSPRModel> getSPRList(){
		return dataReferenceDao.getSPRList();
	}
	
	public List<INGRCTRCATModel> getTRCATList(){
		return dataReferenceDao.getTRCATList();
	}
	
	public List<INGRCTRTYModel> getTRTYList(){
		return dataReferenceDao.getTRTYList();
	}
	
	public List<INGRCTASSRModel> getTASSRList(){
		return dataReferenceDao.getTASSRList();
	}
	
	public List<INGRCTCTYModel> getTCTYList(){
		return dataReferenceDao.getTCTYList();
	}
	
	public List<INGRCORGModel> getORGList(){
		return dataReferenceDao.getORGList();
	}
	
	public List<INGRCTOwnModel> getRiskOwner(){
		return dataReferenceDao.getRiskOwner();
	}
	

	public List<INGRCUGRPModel> getUGrpList(){
		return dataReferenceDao.getUGrpList();
	}
	
	public List<TOwnAndTOwnTDto> getTOwnAndTOwnTList(String username){
		return dataReferenceDao.getTOwnAndTOwnTList(username);
	}
	
	public List<INGRCTOwnModel> getControlOwner(){
		return dataReferenceDao.getControlOwner();
	}
	
	public List<INGRCTableNameModel> getAccessControlTableNameList(){
		return dataReferenceDao.getAccessControlTableNameList();
	}
	
	public List<String> getFileList(String path){
		
		return dataReferenceDao.getFileList(path);
	}
	
	public List<INGRCAcFuncModel> getAcFuncList(){
		return dataReferenceDao.getAcFuncList();
	}
}
