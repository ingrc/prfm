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

import com.ingrc.performa.model.INGRCAcFuncModel;
import com.ingrc.performa.web.dto.RuleMaintenanceAcFuncDto;

@Repository("ingrcRuleMaintenanceAcFuncDao")
public class IngrcRuleMaintenanceAcFuncDao extends JdbcDaoSupport {
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer save(INGRCAcFuncModel model){
		String insertSql = "insert into ingrc_ac_func (fid,text,scope,bprc) "
				+ "values (?,?,?,?)";
		return getJdbcTemplate().update(insertSql, 
				new Object[]{model.getFid(),model.getText(),model.getScope(),model.getBprc()});
	}
	
	public Integer update(INGRCAcFuncModel model){
		String update = "update ingrc_ac_func set text=?,scope=?,bprc=? "
				+ "where fid=?";
		return getJdbcTemplate().update(update, new Object[]{model.getText(),model.getScope(),model.getBprc(),model.getFid()});
	}
	
	public Integer delete(String fid){
		String sql = "delete from ingrc_ac_func where fid=?";
		int result = getJdbcTemplate().update(sql, new Object[]{fid});
		
		return result;
	}
	
	public List<RuleMaintenanceAcFuncDto> list(){
		String sql = "select A.fid,A.text,A.scope,A.bprc,B.text as bprtext from ingrc_ac_func A, ingrc_tbpr B where A.bprc=B.bprc";
		logger.info(sql);
		return getJdbcTemplate().query(sql, new RowMapper<RuleMaintenanceAcFuncDto>(){
			
			public RuleMaintenanceAcFuncDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new RuleMaintenanceAcFuncDto(
						result.getString("fid"),
						result.getString("text"),
						result.getString("scope"),
						result.getString("bprc"),
						result.getString("bprtext"));
			}
		});
	}
	
	public RuleMaintenanceAcFuncDto getById(String fid){
		String sql = "select A.fid,A.text,A.scope,A.bprc,B.text as bprtext from ingrc_ac_func A, ingrc_tbpr B where A.bprc=B.bprc AND A.fid=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{fid}, new RowMapper<RuleMaintenanceAcFuncDto>(){

			public RuleMaintenanceAcFuncDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new RuleMaintenanceAcFuncDto(
						result.getString("fid"),
						result.getString("text"),
						result.getString("scope"),
						result.getString("bprc"),
						result.getString("bprtext"));
			}
		});
	}
	
	
}
