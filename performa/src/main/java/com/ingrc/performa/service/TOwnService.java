package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcTOwnDao;
import com.ingrc.performa.model.INGRCTOwnModel;

@Service("townService")
public class TOwnService {
	
	@Autowired
	private IngrcTOwnDao ingrcTOwn;
	
	public List<INGRCTOwnModel> list(){
		return ingrcTOwn.list();
	}
	
	public INGRCTOwnModel getById(String username){
		try {
			INGRCTOwnModel towntModel = ingrcTOwn.getByUserName(username);
			return towntModel;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		
		
		
	}
}
