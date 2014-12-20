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

import com.ingrc.performa.model.INGRCSPRModel;
import com.ingrc.performa.web.dto.RuleMaintenanceSubBprDto;

@Repository("ingrcRuleMaintenanceSubBprDao")
public class IngrcRuleMaintenanceSubBprDao extends JdbcDaoSupport {
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer save(INGRCSPRModel model){
		String insertSql = "insert into ingrc_tspr (sbpr,bprc,text) "
				+ "values (?,?,?)";
		return getJdbcTemplate().update(insertSql, 
				new Object[]{model.getSbpr(),model.getBprc(),model.getText()});
	}
	
	public Integer update(INGRCSPRModel model){
		String update = "update ingrc_tspr set bprc=?,text=? "
				+ "where sbpr=?";
		return getJdbcTemplate().update(update, new Object[]{model.getBprc(),model.getText(),model.getSbpr()});
	}
	
	public Integer delete(String sbpr){
		String sql = "delete from ingrc_tspr where sbpr=?";
		int result = getJdbcTemplate().update(sql, new Object[]{sbpr});
		
		return result;
	}
	
	public List<RuleMaintenanceSubBprDto> list(){
		String sql = "select A.sbpr,A.bprc,A.text,B.text as bprtext from ingrc_tspr A, ingrc_tbpr B where A.bprc=B.bprc";
		logger.info(sql);
		return getJdbcTemplate().query(sql, new RowMapper<RuleMaintenanceSubBprDto>(){
			
			public RuleMaintenanceSubBprDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new RuleMaintenanceSubBprDto(
						result.getString("sbpr"),
						result.getString("bprc"),
						result.getString("text"),
						result.getString("bprtext"));
			}
		});
	}
	
	public RuleMaintenanceSubBprDto getById(String sbpr){
		String sql = "select A.sbpr,A.bprc,A.text,B.text as bprtext from ingrc_tspr A, ingrc_tbpr B where A.bprc=B.bprc AND sbpr=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{sbpr}, new RowMapper<RuleMaintenanceSubBprDto>(){

			public RuleMaintenanceSubBprDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new RuleMaintenanceSubBprDto(
						result.getString("sbpr"),
						result.getString("bprc"),
						result.getString("text"),
						result.getString("bprtext"));
			}
		});
	}
	
	
}
