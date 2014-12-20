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

import com.ingrc.performa.model.INGRCAttchModel;
import com.ingrc.performa.web.dto.MitigationControlAttachmentDto;

@Repository("ingrcAttachDao")
public class IngrcAttachDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public int save(INGRCAttchModel model){
		String sql = "insert into ingrc_attch (name,type,size,refid,docobj,url,delflag) values (?,?,?,?,?,?,?)";
		return getJdbcTemplate().update(sql, new Object[]{
				model.getName(),
				model.getType(),
				model.getSize(),
				model.getRefid(),
				model.getDocobj(),
				model.getUrl(),
				"0"
		});
	}
	
	public int delete(Integer attchId){
		String sql = "update ingrc_attch set delflag=1 where atchid=?";
		return getJdbcTemplate().update(sql, new Object[]{attchId});
	}
	
	public List<MitigationControlAttachmentDto> listControlAttch(String controlId){
		String sql = "select refid, atchid, name, type, size, url, docobj from ingrc_attch where refid=? and delflag=0";
		return getJdbcTemplate().query(sql,  new Object[]{controlId}, new RowMapper<MitigationControlAttachmentDto>(){

			public MitigationControlAttachmentDto mapRow(ResultSet result,
					int arg1) throws SQLException {
				return new MitigationControlAttachmentDto(
						result.getString("refid"), 
						result.getInt("atchid"), 
						null, 
						result.getString("name"), 
						result.getString("type"), 
						result.getString("size"), 
						result.getString("url"),
						result.getString("docobj"));
			}
			
		});
	}
}
