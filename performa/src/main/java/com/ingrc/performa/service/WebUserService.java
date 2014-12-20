package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcWebUserDao;
import com.ingrc.performa.model.INGRCWebUserModel;

@Service("webUserService")
public class WebUserService {

	@Autowired
	private IngrcWebUserDao ingrcWebUserDao;
	
	public int save(INGRCWebUserModel model){
		return ingrcWebUserDao.save(model);
	}
	
	public int update(INGRCWebUserModel model){
		return ingrcWebUserDao.update(model);
	}
	
	public int delete(String uname){
		return ingrcWebUserDao.delete(uname);
	}
	
	public List<INGRCWebUserModel> list(){
		return ingrcWebUserDao.list();
	}
	
	public INGRCWebUserModel getByUname(String uname){
		return ingrcWebUserDao.getByUname(uname);
	}
}
