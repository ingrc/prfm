package com.ingrc.performa.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.ingrc.performa.model.INGRCTOwnTModel;
import com.ingrc.performa.model.INGRCUserModel;

@Repository("ingrcTOwnTDao")
public class IngrcTOwnTDao extends JdbcDaoSupport {

	private static final Logger logger = Logger.getLogger(IngrcUserDao.class);
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public List<INGRCTOwnTModel> list(){
		String sql = "select ownty,ownn,lang,text from ingrc_townt";

		return getJdbcTemplate().query(sql, new RowMapper<INGRCTOwnTModel>(){
			
			public INGRCTOwnTModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTOwnTModel(
						result.getString("ownty"), 
						result.getString("ownn"), 
						result.getString("lang"), 
						result.getString("text"));
			}
		});
	}
	
	public INGRCTOwnTModel getById(String ownty){
		String sql = "select ownty,ownn,lang,text from ingrc_townt where ownty=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{ownty}, new RowMapper<INGRCTOwnTModel>(){

			public INGRCTOwnTModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTOwnTModel(
						result.getString("ownty"), 
						result.getString("ownn"), 
						result.getString("lang"), 
						result.getString("text"));
			}
		});
	}
}
