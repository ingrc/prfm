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
import org.springframework.transaction.annotation.Transactional;

import com.ingrc.performa.model.INGRCCTRLModel;

@Repository("ingrcCtrlDao")
public class IngrcCtrlDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}

	public int save(INGRCCTRLModel ctrlModel){
		String sql = "insert into ingrc_ctrl (ctrlid, cname, text, ctype, cref, cfreq, bprc, sbpr, orgc) values (?,?,?,?,?,?,?,?,?)";
		return getJdbcTemplate().update(sql, new Object[]{
				ctrlModel.getCtrlId(), 
				ctrlModel.getCtrlName(), 
				ctrlModel.getDescription(),
				ctrlModel.getCtype(),
				ctrlModel.getCref(),
				ctrlModel.getCfreq(),
				ctrlModel.getBprc(),
				ctrlModel.getSbpr(),
				ctrlModel.getOrgc()});
	}
	
	public int update(INGRCCTRLModel model){
		String sql = "update ingrc_ctrl set cname=?, text=?, ctype=?, cref=?, cfreq=?, bprc=?, sbpr=?, orgc=? where ctrlid=?";
		return getJdbcTemplate().update(sql, new Object[]{
				model.getCtrlName(), 
				model.getDescription(),
				model.getCtype(),
				model.getCref(),
				model.getCfreq(),
				model.getBprc(),
				model.getSbpr(),
				model.getOrgc(),
				model.getCtrlId()
		});
	}
	
	@Transactional
	public int delete(String ctrlId){
		
		getJdbcTemplate().update("delete from ingrc_attch where refid=?", ctrlId);
		getJdbcTemplate().update("delete from ingrc_cown where ctrlid=?", ctrlId);
		getJdbcTemplate().update("delete from ingrc_crisk where ctrlid=?", ctrlId);
		
		String sql = "delete from ingrc_ctrl where ctrlid=?";
		return getJdbcTemplate().update(sql, new Object[]{ctrlId});
	}
	
	public INGRCCTRLModel getCtrlById(String ctrlId){
		String sql = "select ctrlid, cname, text, ctype, cref, cfreq, bprc, sbpr, orgc from ingrc_ctrl where ctrlid=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{ctrlId}, new RowMapper<INGRCCTRLModel>(){

			public INGRCCTRLModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCCTRLModel(
						result.getString("ctrlid"), 
						result.getString("cname"), 
						result.getString("text"), 
						result.getString("ctype"), 
						result.getString("cref"),
						result.getString("cfreq"), 
						result.getString("bprc"), 
						result.getString("sbpr"), 
						result.getString("orgc"));
			}
			
		});
	}
	
	public List<INGRCCTRLModel> list(){
		String sql = "select c.ctrlid, c.cname, c.text, tc.text as ctype, c.cref, c.cfreq, c.bprc, c.sbpr, c.orgc from ingrc_ctrl c left join INGRC_TCTY tc on c.CTYPE=tc.CTYPE";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCCTRLModel>(){

			public INGRCCTRLModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCCTRLModel(
						result.getString("ctrlid"), 
						result.getString("cname"), 
						result.getString("text"), 
						result.getString("ctype"), 
						result.getString("cref"),
						result.getString("cfreq"), 
						result.getString("bprc"), 
						result.getString("sbpr"), 
						result.getString("orgc"));
			}
			
		});
	}
}



