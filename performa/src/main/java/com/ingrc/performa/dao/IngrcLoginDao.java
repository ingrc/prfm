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

import com.ingrc.performa.model.INGRCLoginModel;
import com.ingrc.performa.model.INGRCUserModel;
import com.ingrc.performa.web.dto.ComboboxHelperDto;

@Repository("ingrcLoginDao")
public class IngrcLoginDao extends JdbcDaoSupport {
	private static final Logger logger = Logger.getLogger(IngrcLoginDao.class);
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer save(INGRCLoginModel login){
		String insertSql = "insert into ingrc_login (username,password,lock,cdby,cdon,upby,upon,trdat,ltime) "
				+ "values (?,?,?,?,?,?,?,?,?)";
		return getJdbcTemplate().update(insertSql, 
				new Object[]{login.getUsername(),login.getPassword(),login.getLock(),
				login.getCdby(),login.getCdon(),login.getUpby(),login.getUpon(),login.getTrdat(),login.getLtime()});
	}
	
	public Integer update(INGRCLoginModel login){
		String update = "update ingrc_login set password=?,lock=?,cdby=?,cdon=?,upby=?,upon=?,trdat=?,ltime=? "
				+ "where username=?";
		return getJdbcTemplate().update(update, new Object[]{login.getPassword(),login.getLock(),
				login.getCdby(),login.getCdon(),login.getUpby(),login.getUpon(),login.getTrdat(),login.getLtime()});
	}
	
	public Integer delete(String userName){
		String sql = "delete from ingrc_login where username=?";
		int result = getJdbcTemplate().update(sql, new Object[]{userName});
		
		return result;
	}
	
	public List<INGRCLoginModel> list(){
		String sql = "select username,password,lock,cdby,cdon,upby,upon,trdat,ltime from ingrc_login";
		logger.info(sql);
		return getJdbcTemplate().query(sql, new RowMapper<INGRCLoginModel>(){
			
			public INGRCLoginModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCLoginModel(
						result.getString("username"),
						result.getString("password"),
						result.getString("lock"),
						result.getString("cdby"),
						result.getString("cdon"),
						result.getString("upby"),
						result.getString("upon"),
						result.getString("trdat"),
						result.getString("ltime"));
			}
		});
	}
	
	public INGRCLoginModel getByUserName(String userName){
		String sql = "select username,password,lock,cdby,cdon,upby,upon,trdat,ltime from ingrc_login where username=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{userName}, new RowMapper<INGRCLoginModel>(){

			public INGRCLoginModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCLoginModel(
						result.getString("username"),
						result.getString("password"),
						result.getString("lock"),
						result.getString("cdby"),
						result.getString("cdon"),
						result.getString("upby"),
						result.getString("upon"),
						result.getString("trdat"),
						result.getString("ltime"));
			}
		});
	}
	
}
