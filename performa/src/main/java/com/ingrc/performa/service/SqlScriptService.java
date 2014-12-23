package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcSqlScriptDao;
import com.ingrc.performa.model.INGRCSqlScriptModel;

@Service("sqlScriptService")
public class SqlScriptService {

	@Autowired
	private IngrcSqlScriptDao ingrcSqlScriptDao;
	
	public int save(INGRCSqlScriptModel model){
		return ingrcSqlScriptDao.save(model);
	}
	
	public int update(INGRCSqlScriptModel model){
		return ingrcSqlScriptDao.update(model);
	}
	
	public int delete(int id){
		return ingrcSqlScriptDao.delete(id);
	}
	
	public INGRCSqlScriptModel getSqlScript(int id){
		return ingrcSqlScriptDao.getSqlScript(id);
	}
	
	public List<INGRCSqlScriptModel> list(){
		return ingrcSqlScriptDao.list();
	}
}
