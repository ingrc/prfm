package com.ingrc.performa.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.ingrc.performa.model.INGRCAcFActModel;
import com.ingrc.performa.model.INGRCAcFuncModel;
import com.ingrc.performa.model.INGRCBPRModel;
import com.ingrc.performa.model.SAPTSTCModel;
import com.ingrc.performa.web.dto.RuleMaintenanceAcFActDto;

@Repository("ingrcRuleMaintenanceAcFActDao")
public class IngrcRuleMaintenanceAcFActDao extends JdbcDaoSupport {
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer save(INGRCAcFActModel model){
		String insertSql = "insert into ingrc_ac_fact (fid,tcode,stat) "
				+ "values (?,?,?)";
		return getJdbcTemplate().update(insertSql, 
				new Object[]{model.getFid(),model.getTcode(),model.getStat()});
	}
	
	public Integer update(INGRCAcFActModel model){
		String update = "update ingrc_ac_fact set stat=? "
				+ "where fid=? AND tcode=?";
		return getJdbcTemplate().update(update, new Object[]{model.getStat(),model.getFid(),model.getTcode()});
	}
	
	public Integer delete(String fid, String tcode){
		String sql = "delete from ingrc_ac_fact where fid=? AND tcode=? ";
		int result = getJdbcTemplate().update(sql, new Object[]{fid,tcode});
		
		return result;
	}
	
	public List<RuleMaintenanceAcFActDto> list(String fid){
		String sql = "select A.fid, B.text as fidtext, A.tcode, C.ttext as tcodetext, A.stat "
				+ "from ingrc_ac_fact A "
				+ "left join ingrc_ac_func B on A.fid=B.fid "
				+ "left join sap_tstct C on A.tcode = C.tcode "
				+ "where A.fid=?";
		logger.info(sql);
		return getJdbcTemplate().query(sql, new Object[]{fid}, new RowMapper<RuleMaintenanceAcFActDto>(){
			
			public RuleMaintenanceAcFActDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new RuleMaintenanceAcFActDto(
						result.getString("fid"),
						result.getString("fidtext"),
						result.getString("tcode"),
						result.getString("tcodetext"),
						result.getString("stat"));
			}
		});
	}
	
	public RuleMaintenanceAcFActDto getById(String fid, String tcode){
		String sql = "select A.fid, B.text as fidtext, A.tcode, C.pgmna as tcodetext, A.stat "
				+ "from ingrc_ac_fact A "
				+ "left join ingrc_ac_func B on A.fid=B.fid "
				+ "left join sap_tstc C on A.tcode = C.tcode "
				+ "where A.fid=? AND A.tcode=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{fid,tcode}, new RowMapper<RuleMaintenanceAcFActDto>(){

			public RuleMaintenanceAcFActDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new RuleMaintenanceAcFActDto(
						result.getString("fid"),
						result.getString("fidtext"),
						result.getString("tcode"),
						result.getString("tcodetext"),
						result.getString("stat"));
			}
		});
	}
	
	public List<INGRCAcFuncModel> listFunctionAction(String bprc){
		String sql = "select fid,text from ingrc_ac_func where bprc=? order by fid";
		return getJdbcTemplate().query(sql, new Object[]{bprc}, new RowMapper<INGRCAcFuncModel>(){

			public INGRCAcFuncModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCAcFuncModel(result.getString("fid"), result.getString("text"));
			}});
	}
	
	public List<INGRCBPRModel> listBusinessProcess(){
		String sql = "select bprc, text from ingrc_tbpr order by bprc";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCBPRModel>(){

			public INGRCBPRModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCBPRModel(result.getString("bprc"), result.getString("text"));
			}
			
		});
	}
	
	public SAPTSTCModel getByTcode(String tcode){
		String sql = "select tcode,pgmna from sap_tstc "
				+ "where tcode=?";
		try{
			return getJdbcTemplate().queryForObject(sql,new Object[]{tcode}, new RowMapper<SAPTSTCModel>(){

				public SAPTSTCModel mapRow(ResultSet result, int arg1)
						throws SQLException {
					return new SAPTSTCModel(
							result.getString("tcode"),
							result.getString("pgmna"));
				}
			});
		}
		catch (EmptyResultDataAccessException ex){
			return null;
		}
		
	}		
}
