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

import com.ingrc.performa.model.INGRCControlOwnerModel;
import com.ingrc.performa.web.dto.MitigationControlOwnerDto;

@Repository("ingrcControlOwnerDao")
public class IngrcControlOwnerDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public int save(INGRCControlOwnerModel model){
		String sql = "insert into ingrc_cown (ctrlid,owner) values (?,?)";
		return getJdbcTemplate().update(sql, new Object[]{model.getControlId(), model.getOwner()});
	}
	
	public int delete(String controlId, String owner){
		String sql = "delete from ingrc_cown where ctrlid=? and owner=?";
		return getJdbcTemplate().update(sql, new Object[]{controlId, owner});
	}
	
	public List<MitigationControlOwnerDto> listControlOwner(String controlId){
		String sql = "select c.ctrlid, o.owner, o.username from ingrc_cown c, ingrc_town o where c.owner=o.owner and c.ctrlid=?";
		return getJdbcTemplate().query(sql, new Object[] {controlId}, new RowMapper<MitigationControlOwnerDto>(){

			public MitigationControlOwnerDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new MitigationControlOwnerDto(result.getString("ctrlid"), result.getString("owner"), result.getString("username"));
			}
			
		});
	}
	
}
