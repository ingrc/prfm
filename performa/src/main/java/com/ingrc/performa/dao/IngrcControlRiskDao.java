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

import com.ingrc.performa.model.INGRCControlRiskModel;
import com.ingrc.performa.web.dto.MitigationControlRiskDto;

@Repository("ingrcControlRiskDao")
public class IngrcControlRiskDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}

	public int save(INGRCControlRiskModel model){
		String sql = "insert into ingrc_crisk (ctrlid, riskid) values (?,?)";
		return getJdbcTemplate().update(sql, new Object[]{model.getControlId(), model.getRiskId()});
	}
	
	public int delete(String controlId, String riskId){
		String sql = "delete from ingrc_crisk where ctrlid=? and riskid=?";
		return getJdbcTemplate().update(sql, new Object[]{controlId, riskId});
	}
	
	public List<MitigationControlRiskDto> listControlRisk(String controlId){
		String sql = "select c.ctrlid, c.riskid, r.text, tc.TEXT as level from ingrc_crisk c left join ingrc_risk r on c.riskid=r.riskid left join INGRC_TRCAT tc on r.LEVEL=tc.LEVEL where c.ctrlid=? order by c.riskid";
		return getJdbcTemplate().query(sql, new Object[]{controlId}, new RowMapper<MitigationControlRiskDto>(){

			public MitigationControlRiskDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new MitigationControlRiskDto(result.getString("ctrlid"), result.getString("riskid"), result.getString("text"), result.getString("level")); 
			}
			
		});
	}
	
}
