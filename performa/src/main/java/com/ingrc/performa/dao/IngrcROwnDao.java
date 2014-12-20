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

import com.ingrc.performa.model.INGRCROwnModel;
import com.ingrc.performa.web.dto.RiskMaintenanceOwnerDto;

@Repository("ingrcROwnDao")
public class IngrcROwnDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;
 
	@Autowired
    public void init(DataSource dataSource) {
        setJdbcTemplate(new JdbcTemplate(dataSource));
    }
	
	public int save(INGRCROwnModel model){
		String sql = "insert into ingrc_rown (riskid, owner) values (?,?)";
		return getJdbcTemplate().update(sql, new Object[]{model.getRiskId(), model.getOwner()});
	}
	
	public int delete(String riskId, String owner){
		String sql = "delete from ingrc_rown where riskid=? and owner=?";
		return getJdbcTemplate().update(sql, new Object[]{riskId, owner});
	}
	
	public List<INGRCROwnModel> list(String riskId){
		String sql = "select riskid, owner from ingrc_rown where riskid=?";
		return getJdbcTemplate().query(sql, new Object[]{riskId}, new RowMapper<INGRCROwnModel>(){

			public INGRCROwnModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCROwnModel(result.getString("riskid"), result.getString("owner"));
			}
			
		});
	}
	
	public List<RiskMaintenanceOwnerDto> listOwner(String riskId){
		String sql = "select r.riskid as riskid, t.username as username, r.owner as owner from ingrc_rown r, ingrc_town t where r.owner=t.owner and r.riskid=? order by t.username";
		return getJdbcTemplate().query(sql, new Object[] {riskId}, new RowMapper<RiskMaintenanceOwnerDto>(){

			public RiskMaintenanceOwnerDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new RiskMaintenanceOwnerDto(result.getString("riskid"), result.getString("username"), null, result.getString("owner"));
			}
			
		});
	}

}
