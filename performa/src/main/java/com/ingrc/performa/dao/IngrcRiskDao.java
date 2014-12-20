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

import com.ingrc.performa.model.INGRCRASSRModel;
import com.ingrc.performa.model.INGRCRiskModel;

@Repository("ingrcRiskDao")
public class IngrcRiskDao extends JdbcDaoSupport {
	
	private static final Logger logger = Logger.getLogger(IngrcRiskDao.class);

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}

	public Integer save(INGRCRiskModel risk, List<INGRCRASSRModel> rassr){
		String sql = "insert into ingrc_risk(riskid,text,level,rtype,stat,bprc,sbpr,cobj,fid1,fid2,fid3,fid4,fid5) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int result = getJdbcTemplate().update(sql, new Object[] {risk.getRiskid(), risk.getText(), risk.getLevel(), risk.getRtype(), risk.getStat(), 
				risk.getBprc(), risk.getSbpr(), risk.getCobj(),risk.getFid1(),risk.getFid2(),risk.getFid3(),risk.getFid4(),risk.getFid5()});
	
		for (INGRCRASSRModel assr:rassr){
			sql = "insert into ingrc_rassr(riskid, assr) values (?,?)";
			result = result & getJdbcTemplate().update(sql, new Object[] {assr.getRiskId(), assr.getAssr()});		
		}
		
		return result;
	}
	
	public Integer update(INGRCRiskModel risk, List<INGRCRASSRModel> rassr){
		String sql = "update ingrc_risk set text=?, level=?,rtype=?,stat=?,bprc=?,sbpr=?,cobj=?, "
				+ "fid1=?,fid2=?,fid3=?,fid4=?,fid5=? "
				+ "where riskid=?";
		int result = getJdbcTemplate().update(sql, new Object[] {
				risk.getText(), 
				risk.getLevel(), 
				risk.getRtype(), 
				risk.getStat(), 
				risk.getBprc(), 
				risk.getSbpr(), 
				risk.getCobj(),
				risk.getFid1(),
				risk.getFid2(),
				risk.getFid3(),
				risk.getFid4(),
				risk.getFid5(), 
				risk.getRiskid()});
	
		sql = "delete from ingrc_rassr where riskid=?";
		result = result & getJdbcTemplate().update(sql, new Object[]{risk.getRiskid()});
		
		for (INGRCRASSRModel assr:rassr){
			sql = "insert into ingrc_rassr(riskid, assr) values (?,?)";
			result = result & getJdbcTemplate().update(sql, new Object[] {assr.getRiskId(), assr.getAssr()});		
		}
		
		return result;
	}
	
	public Integer delete(String riskId){
		String sql = "delete from ingrc_rassr where riskid=?";
		int result = getJdbcTemplate().update(sql, new Object[]{riskId});
		
		
		sql = "delete ingrc_risk where riskid=?";
		result = getJdbcTemplate().update(sql, new Object[]{riskId});
		
		return result;
	}
	
	public List<INGRCRiskModel> list(){
//		String sql = "select riskid,text,level,rtype,stat,bprc,sbpr,cobj,fid1,fid2,fid3,fid4,fid5 from ingrc_risk";
		String sql = "SELECT R.RISKID AS riskid, R.STAT as stat,  R.TEXT AS text, TY.TEXT as rtype, TC.TEXT as level, " +
					"bprc,sbpr,cobj,fid1,fid2,fid3,fid4,fid5 "+
					"FROM INGRC_RISK R LEFT JOIN INGRC_TRTY TY ON R.RTYPE = TY.RTYPE "+
					"LEFT JOIN INGRC_TRCAT TC ON R.LEVEL = TC.LEVEL "+
					"order by r.RISKID";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCRiskModel>(){

			public INGRCRiskModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCRiskModel(
						result.getString("riskid"), 
						result.getString("text"), 
						result.getString("level"), 
						result.getString("rtype"), 
						result.getString("stat"), 
						result.getString("bprc"), 
						result.getString("sbpr"), 
						result.getString("cobj"), 
						result.getString("fid1"), 
						result.getString("fid2"), 
						result.getString("fid3"), 
						result.getString("fid4"), 
						result.getString("fid5"));
			}
		});
	}
	
	public INGRCRiskModel getByRiskId(String riskId){
		String sql = "select riskid,text,level,rtype,stat,bprc,sbpr,cobj,fid1,fid2,fid3,fid4,fid5 from ingrc_risk where riskid=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{riskId}, new RowMapper<INGRCRiskModel>(){

			public INGRCRiskModel mapRow(ResultSet result, int arg1)
					throws SQLException {

				return new INGRCRiskModel(
						result.getString("riskid"), 
						result.getString("text"), 
						result.getString("level"), 
						result.getString("rtype"), 
						result.getString("stat"), 
						result.getString("bprc"), 
						result.getString("sbpr"), 
						result.getString("cobj"), 
						result.getString("fid1"), 
						result.getString("fid2"), 
						result.getString("fid3"), 
						result.getString("fid4"), 
						result.getString("fid5"));
			}
		});
	}
}
