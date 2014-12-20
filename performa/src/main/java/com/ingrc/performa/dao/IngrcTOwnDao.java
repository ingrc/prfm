package com.ingrc.performa.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.ingrc.performa.model.INGRCTOwnModel;
import com.ingrc.performa.model.INGRCUserModel;
import com.ingrc.performa.web.dto.ComboboxHelperDto;

@Repository("ingrcTOwnDao")
public class IngrcTOwnDao extends JdbcDaoSupport {
	private static final Logger logger = Logger.getLogger(IngrcTOwnDao.class);
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer save(INGRCTOwnModel town){
		String insertSql = "insert into ingrc_town (owner,username,roner,coner,soner,scner,cdby,cdon,upby,upon) "
				+ "values (?,?,?,?,?,?,?,?,?,?)";
		return getJdbcTemplate().update(insertSql, 
				new Object[]{town.getOwner(), town.getUsername(), town.getRoner(), town.getConer(), town.getSoner(), town.getScner(), 
				town.getCdby(), town.getCdon(), town.getUpby(), town.getUpon()});
	}
	
	public Integer update(INGRCTOwnModel town){
		String update = "update ingrc_town set username=?,roner=?,coner=?,soner=?,scner=?,cdby=?,cdon=?,upby=?,upon=? "
				+ "where owner=?";
		return getJdbcTemplate().update(update, new Object[]{town.getUsername(), town.getRoner(), town.getConer(), town.getSoner(), town.getScner(), 
				town.getCdby(), town.getCdon(), town.getUpby(), town.getUpon(),town.getOwner()});
	}
	
	public Integer delete(String town){
		String sql = "delete from ingrc_town where owner=?";
		int result = getJdbcTemplate().update(sql, new Object[]{town});
		
		return result;
	}
	
	public List<INGRCTOwnModel> list(){
		String sql = "select owner,username,roner,coner,soner,scner,cdby,cdon,upby,upon from ingrc_town";
		logger.info(sql);
		return getJdbcTemplate().query(sql, new RowMapper<INGRCTOwnModel>(){
			
			public INGRCTOwnModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTOwnModel(
						result.getString("owner"), 
						result.getString("username"), 
						result.getString("roner"), 
						result.getString("coner"), 
						result.getString("soner"), 
						result.getString("scner"), 
						result.getString("cdby"), 
						result.getString("cdon"), 
						result.getString("upby"), 
						result.getString("upon"));
			}
		});
	}
	
	public INGRCTOwnModel getByUserName(String userName){
		String sql = "select owner,username,roner,coner,soner,scner,cdby,cdon,upby,upon from ingrc_town where username=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{userName}, new RowMapper<INGRCTOwnModel>(){

			public INGRCTOwnModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTOwnModel(
						result.getString("owner"), 
						result.getString("username"), 
						result.getString("roner"), 
						result.getString("coner"), 
						result.getString("soner"), 
						result.getString("scner"), 
						result.getString("cdby"), 
						result.getString("cdon"), 
						result.getString("upby"), 
						result.getString("upon"));
			}
		});
	}
	
}
