package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcTOwnTDao;
import com.ingrc.performa.model.INGRCTOwnTModel;
import com.ingrc.performa.web.dto.UserDto;

@Service("towntService")
public class TOwnTService {
	
	@Autowired
	private IngrcTOwnTDao ingrcTOwnt;
	
	public List<INGRCTOwnTModel> list(){
		return ingrcTOwnt.list();
	}
	
	public INGRCTOwnTModel getById(String ownty){
		INGRCTOwnTModel towntModel = ingrcTOwnt.getById(ownty);

		return towntModel;
	}
}
