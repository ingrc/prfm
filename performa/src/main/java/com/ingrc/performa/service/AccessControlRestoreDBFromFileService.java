package com.ingrc.performa.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ingrc.performa.dao.AccessControlRestoreDBFromFileDao;
import com.ingrc.performa.web.dto.AccessControlRestoreDBFromFileDto;
import com.ingrc.performa.web.dto.UserDto;

@Service("AccessControlService")
public class AccessControlRestoreDBFromFileService {

	@Autowired
	private AccessControlRestoreDBFromFileDao accessControlDao;
	
	@Transactional
	public Integer save(AccessControlRestoreDBFromFileDto accessControlDto){
		return accessControlDao.save(accessControlDto);
		
	}
	
	public List<AccessControlRestoreDBFromFileDto> list(){
		return accessControlDao.list();
	}
	
	public Integer updateLastUploadDate(Date uploadDate, String tableName){
		return accessControlDao.updateLastUploadDate(uploadDate, tableName);
	}
}
