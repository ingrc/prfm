package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ingrc.performa.dao.IngrcLoginDao;
import com.ingrc.performa.dao.IngrcUserDao;
import com.ingrc.performa.model.INGRCLoginModel;
import com.ingrc.performa.model.INGRCTOwnModel;
import com.ingrc.performa.model.INGRCUserModel;
import com.ingrc.performa.web.dto.UserDto;

@Service("userService")
public class UserService {

	@Autowired
	private IngrcUserDao ingrcUserDao;
	
	@Autowired
	private IngrcLoginDao ingrcLoginDao;
	
	@Transactional
	public Integer save(UserDto userDto){
		INGRCUserModel userModel = new INGRCUserModel();
		INGRCLoginModel modelLogin = new INGRCLoginModel();
		INGRCTOwnModel modelTOwn = new INGRCTOwnModel();
		userDto.constructModel(userModel, modelLogin, modelTOwn);
//		System.out.println("KIRIM1="+userDto.getLogindto());
	
		return ingrcUserDao.save(userModel,modelLogin,modelTOwn);
	}
	@Transactional
	public Integer update(UserDto userDto){
		
		INGRCUserModel userModel = new INGRCUserModel();
		INGRCLoginModel modelLogin = new INGRCLoginModel();
		INGRCTOwnModel modelTOwn = new INGRCTOwnModel();
		userDto.constructModel(userModel, modelLogin, modelTOwn);
//		System.out.println("KIRIM2="+userDto.getLogindto());
		return ingrcUserDao.update(userModel, modelLogin, modelTOwn);
	}
	
	@Transactional
	public Integer delete(String userName){
		return ingrcUserDao.delete(userName);
	}
	
	public List<UserDto> list(){
		return ingrcUserDao.list();
	}
	
	public UserDto getByUserName(String userName){
		UserDto userDto = ingrcUserDao.getByUserName(userName);
		return userDto;
	}
	

}
