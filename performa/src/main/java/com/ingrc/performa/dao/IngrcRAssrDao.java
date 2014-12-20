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

import com.ingrc.performa.model.INGRCRASSRModel;

@Repository("ingrcRAssrDao")
public class IngrcRAssrDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}

	public List<INGRCRASSRModel> list(String riskId){
		String sql = "select riskid, assr from ingrc_rassr where riskid=?";
		return getJdbcTemplate().query(sql, new Object[]{riskId}, new RowMapper<INGRCRASSRModel>(){

			public INGRCRASSRModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCRASSRModel(result.getString("assr"), result.getString("riskid"));
			}
			
		});
	}
}






