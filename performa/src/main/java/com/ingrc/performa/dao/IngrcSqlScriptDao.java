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

import com.ingrc.performa.model.INGRCSqlScriptModel;

@Repository("ingrcSqlScriptDao")
public class IngrcSqlScriptDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public int save(INGRCSqlScriptModel model){
		String sql = "insert into ingrc_sqlscript (name, sql_script, ordo) values (?,?,?)";
		return getJdbcTemplate().update(sql, new Object[]{model.getName(), model.getSqlScript(), model.getOrdo()});
	}
	
	public int update(INGRCSqlScriptModel model){
		String sql = "update ingrc_sqlscript set name=?, sql_script=?, ordo=? where id=?";
		return getJdbcTemplate().update(sql, new Object[]{model.getName(), model.getSqlScript(), model.getOrdo(), model.getId()});
	}
	
	public int delete(int id){
		return getJdbcTemplate().update("delete from ingrc_sqlscript where id=?", id);
	}
	
	public INGRCSqlScriptModel getSqlScript(int id){
		try {
			String sql = "select id, name, sql_script, ordo from ingrc_sqlscript where id=?";
			return getJdbcTemplate().queryForObject(sql, new Object[]{id}, new RowMapper<INGRCSqlScriptModel>() {

				public INGRCSqlScriptModel mapRow(ResultSet result, int arg1)
						throws SQLException {
					INGRCSqlScriptModel model = new INGRCSqlScriptModel(
							result.getInt("id"), 
							result.getString("name"), 
							result.getString("sql_script"), 
							result.getInt("ordo"));
					return model;
				}
				
			});
		} catch (EmptyResultDataAccessException ex){
			return null;
		}
	}
	
	public List<INGRCSqlScriptModel> list(){
		String sql = "select id, name, sql_script, ordo from ingrc_sqlscript order by ordo asc";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCSqlScriptModel>(){

			public INGRCSqlScriptModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				INGRCSqlScriptModel model = new INGRCSqlScriptModel(
						result.getInt("id"), 
						result.getString("name"), 
						result.getString("sql_script"), 
						result.getInt("ordo"));
				return model;
			}
			
		});
	}
}





