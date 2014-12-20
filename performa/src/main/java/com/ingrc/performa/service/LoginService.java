package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcLoginDao;
import com.ingrc.performa.model.INGRCLoginModel;
import com.ingrc.performa.web.dto.ComboboxHelperDto;
import com.ingrc.performa.web.dto.LoginDto;
import com.ingrc.performa.web.dto.UserDto;

@Service("loginService")
public class LoginService {

	@Autowired
	private IngrcLoginDao ingrcLoginDao;
	
	public Integer save(LoginDto loginDto){
		INGRCLoginModel loginModel = new INGRCLoginModel();
		loginDto.constructModel(loginModel);
		return ingrcLoginDao.save(loginModel);
	}
	
	public Integer update(LoginDto loginDto){
		INGRCLoginModel loginModel = new INGRCLoginModel();
		loginDto.constructModel(loginModel);
		
		return ingrcLoginDao.update(loginModel);
	}
	
	public Integer delete(String userName){
		return ingrcLoginDao.delete(userName);
	}
	
	public List<INGRCLoginModel> list(){
		return ingrcLoginDao.list();
	}
	
	public LoginDto getByUserName(String userName){
		INGRCLoginModel loginModel = ingrcLoginDao.getByUserName(userName);
		LoginDto loginDto = new LoginDto();
		
		loginDto.constructDto(loginModel);
		return loginDto;
	}

	
}
