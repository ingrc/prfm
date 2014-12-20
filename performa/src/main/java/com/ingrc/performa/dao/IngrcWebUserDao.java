package com.ingrc.performa.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.ingrc.performa.model.INGRCWebUserModel;

@Repository("ingrcWebUserDao")
public class IngrcWebUserDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;
 
	@Autowired
    public void init(DataSource dataSource) {
        setJdbcTemplate(new JdbcTemplate(dataSource));
    }
	
	public int save(INGRCWebUserModel model){
		String sql = "insert into ingrc_web_user (uname, passwd, enabled, role, displayname) values (?,?,?,?,?)";
		return getJdbcTemplate().update(sql, new Object[]{
				model.getWebUsername(),
				encodePassword(model.getWebPassword()),
				model.getEnabled(),
				model.getRole(),
				model.getDisplayname()
		});
	}
	
	public int update(INGRCWebUserModel model){
		String sql = "update ingrc_web_user set passwd=?, enabled=?, role=?, displayname=? where uname=?";
		return getJdbcTemplate().update(sql, new Object[]{
				encodePassword(model.getWebPassword()),
				model.getEnabled(),
				model.getRole(),
				model.getDisplayname(),
				model.getWebUsername()
		});
	}
	
	public int delete(String uname){
		return getJdbcTemplate().update("delete from ingrc_web_user where uname=? and role<>?", new Object[]{uname, "ADMIN"});
	}
	
	public List<INGRCWebUserModel> list(){
		String sql = "select uname, role, enabled, displayname from ingrc_web_user order by uname";
		return getJdbcTemplate().query(sql,  new RowMapper<INGRCWebUserModel>(){

			public INGRCWebUserModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCWebUserModel(
						result.getString("uname"), 
						"<hidden>", 
						result.getString("role"), 
						result.getBoolean("enabled"),
						result.getString("displayname"));
			}
			
		});
	}
	
	public INGRCWebUserModel getByUname(String uname){
		return getJdbcTemplate().queryForObject("select uname,passwd,role,enabled,displayname from ingrc_web_user where uname=?", new Object[]{uname}, new RowMapper<INGRCWebUserModel>() {

			public INGRCWebUserModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCWebUserModel(
						result.getString("uname"), 
						"<hidden>", 
						result.getString("role"), 
						result.getBoolean("enabled"),
						result.getString("displayname"));
			}
		});
	}
	
	private String encodePassword(String passwd){
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(passwd);
		return hashedPassword;
	}
}











