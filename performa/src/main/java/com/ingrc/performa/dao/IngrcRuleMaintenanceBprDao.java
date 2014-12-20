package com.ingrc.performa.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.ingrc.performa.model.INGRCBPRModel;
import com.ingrc.performa.model.INGRCLoginModel;

@Repository("ingrcRuleMaintenanceBprDao")
public class IngrcRuleMaintenanceBprDao extends JdbcDaoSupport {
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer save(INGRCBPRModel model){
		String insertSql = "insert into ingrc_tbpr (bprc,text) "
				+ "values (?,?)";
		return getJdbcTemplate().update(insertSql, 
				new Object[]{model.getBprc(),model.getText()});
	}
	
	public Integer update(INGRCBPRModel model){
		String update = "update ingrc_tbpr set text=? "
				+ "where bprc=?";
		return getJdbcTemplate().update(update, new Object[]{model.getText(),model.getBprc()});
	}
	
	public Integer delete(String bprc){
		String sql = "delete from ingrc_tbpr where bprc=?";
		int result = getJdbcTemplate().update(sql, new Object[]{bprc});
		
		return result;
	}
	
	public List<INGRCBPRModel> list(){
		String sql = "select bprc,text from ingrc_tbpr";
		logger.info(sql);
		return getJdbcTemplate().query(sql, new RowMapper<INGRCBPRModel>(){
			
			public INGRCBPRModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCBPRModel(
						result.getString("bprc"),
						result.getString("text"));
			}
		});
	}
	
	public INGRCBPRModel getById(String bprc){
		String sql = "select bprc,text from ingrc_tbpr where bprc=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{bprc}, new RowMapper<INGRCBPRModel>(){

			public INGRCBPRModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCBPRModel(
						result.getString("bprc"),
						result.getString("text"));
			}
		});
	}
	
	
}
