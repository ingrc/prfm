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

import com.ingrc.performa.model.INGRCReport;

@Repository("ingrcReportDao")
public class IngrcReportDao extends JdbcDaoSupport {


	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer resetStatus(String status){
		return getJdbcTemplate().update("update ingrc_report set last_generate=?, stat=?, report_output=?", new Object[]{
			null,
			status,
			null
		});
	}
	
	public Integer update(INGRCReport report){
		String sql = "update ingrc_report set last_generate=?, stat=?, report_output=? where report_code=?";
		return getJdbcTemplate().update(sql, new Object[]{
				report.getLastGenerate(), 
				report.getStatus(), 
				report.getReportOuput(), report.getReportCode()});
	}
	
	public List<INGRCReport> list(){
		String sql = "select report_code, report_name, last_generate, stat, report_output from ingrc_report order by report_name";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCReport>(){

			public INGRCReport mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCReport(
						result.getString("report_code"), 
						result.getString("report_name"), 
						result.getTimestamp("last_generate"),
						result.getString("report_output"),
						result.getString("stat"));
			}});
	}
	
	public INGRCReport getReportByCode(String reportCode){
		String sql = "select report_code, report_name, last_generate, report_output, stat from ingrc_report where report_code=?";
		
		return getJdbcTemplate().queryForObject(sql, new Object[]{reportCode}, new RowMapper<INGRCReport>(){

			public INGRCReport mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCReport(
						result.getString("report_code"), 
						result.getString("report_name"), 
						result.getDate("last_generate"),
						result.getString("report_output"),
						result.getString("stat"));
			}});
	}
}
