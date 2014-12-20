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

import com.ingrc.performa.model.MenuMasterLeftModel;
import com.ingrc.performa.web.dto.ComboboxHelperDto;
import com.ingrc.performa.web.dto.MenuMasterDto;

@Repository("menuMasterLeftDao")
public class MenuMasterLeftDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer insert(MenuMasterLeftModel model){;
		String sql = "insert into ingrc_menu_master_left(displayname,url,description,parent_id,menu_master_id) values (?,?,?,?,?)";
		return getJdbcTemplate().update(sql, new Object[]{model.getDisplayname(), model.getUrl(), model.getDescription(), model.getParentId(), model.getMenuMasterId()});
	}
	
	public Integer update(MenuMasterLeftModel model){
		String sql = "update ingrc_menu_master_left set displayname=?, url=?, description=?, parent_id=?, menu_master_id=? where id=?";
		return getJdbcTemplate().update(sql, new Object[]{model.getDisplayname(), model.getUrl(), model.getDescription(), model.getParentId(), model.getMenuMasterId(), model.getId()});
	}
	
	public Integer delete(Integer id){
		String checkSql = "select count(*) as cnt from ingrc_menu_master_left where parent_id=?";
		int cnt=0;
		try {
			cnt = getJdbcTemplate().queryForObject(checkSql, new Object[] {id}, Integer.class);
		} catch (EmptyResultDataAccessException ex){}
		
		if (cnt>0){
			return -1;
		}
		String sql = "delete from ingrc_menu_master_left where id=?";
		return getJdbcTemplate().update(sql, new Object[]{id});
	}
	
	public MenuMasterLeftModel getMenuMasterLeftById(Integer id){
		String sql = "select id,displayname,url,description,parent_id,menu_master_id from ingrc_menu_master_left where id=?";
		try {
		return getJdbcTemplate().queryForObject(sql, new Object[]{id}, new RowMapper<MenuMasterLeftModel>(){

			public MenuMasterLeftModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				MenuMasterLeftModel model = new MenuMasterLeftModel();
				model.setId(result.getInt("id"));
				model.setDisplayname(result.getString("displayname"));
				model.setUrl(result.getString("url"));
				model.setDescription(result.getString("description"));
				model.setParentId(result.getInt("parent_id"));
				model.setMenuMasterId(result.getInt("menu_master_id"));
				return model;
			}
			
		});
		} catch (EmptyResultDataAccessException ex){
			return null;
		}
	}
	
	public List<ComboboxHelperDto> getComboboxValueMaster(Integer menuMasterId){
		String sql = "select distinct id,displayname from ingrc_menu_master_left where parent_id=0 and menu_master_id=? order by id";
		try {
		return getJdbcTemplate().query(sql, new Object[]{menuMasterId}, new RowMapper<ComboboxHelperDto>(){

			public ComboboxHelperDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				ComboboxHelperDto dto = new ComboboxHelperDto();
				dto.setKey(result.getString("id"));
				dto.setValue(result.getString("displayname"));
				return dto;
			}
			
		});
		} catch (EmptyResultDataAccessException ex){
			return null;
		}
	}
	
	public List<MenuMasterDto> listAll(Integer menuMasterId){
		String sql = "select id, displayname, url, display from vw_menu_master_left where menu_master_id=? order by orderbyfield";
		try {
		return getJdbcTemplate().query(sql, new Object[]{menuMasterId}, new RowMapper<MenuMasterDto>(){

			public MenuMasterDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				MenuMasterDto model = new MenuMasterDto();
				model.setId(result.getInt("id"));
				model.setDisplayname(result.getString("displayname"));
				model.setUrl(result.getString("url"));
				model.setMenulevel(result.getString("display"));
				return model;
			}
			
		});
		} catch (EmptyResultDataAccessException ex){
			return null;
		}
	}
	
	public String getMenuLeftAsStringXML(int masterMenuId){
		StringBuilder sql = new StringBuilder();
		sql.append(" select CAST((");
		sql.append("		SELECT ");
		sql.append("			'pages-app' AS [id],");
		sql.append("			'nav nav-pills nav-stacked' as [class],");
		sql.append("			( ");
		sql.append("			SELECT");
		sql.append("				('#' + REPLACE(O.DISPLAYNAME, ' ', '')) AS [a/@href],");
		sql.append("				'collapse' AS [a/@class],");
		sql.append("				'collapse' AS [a/@data-toggle],");
		sql.append("				'pages-app' AS [a/@data-parent],");
		sql.append("				(O.DISPLAYNAME) AS [a],");
		sql.append("				'fa fa-angle-down pull-right' as [a/i/@class],");
		sql.append("				'panel-collapse collapse  list-unstyled' AS [ul/@class],");
		sql.append("				'menu' AS [ul/@role],");
		sql.append("				REPLACE(O.DISPLAYNAME, ' ', '') AS [ul/@id],");
		sql.append("				(");
		sql.append("					   SELECT ");
		sql.append("							I.URL AS [a/@href],");
		sql.append("							I.DISPLAYNAME AS [a]");
		sql.append("					   FROM   VW_MENU_MASTER_LEFT I");
		sql.append("					   WHERE  I.PARENT_ID = O.ID AND I.MENU_MASTER_ID = O.MENU_MASTER_ID");
		sql.append("					   ORDER BY I.ORDERBYFIELD");
		sql.append("					   FOR XML PATH('li'), TYPE");
		sql.append("					 ) AS [ul]");
		sql.append("			  FROM   VW_MENU_MASTER_LEFT O");
		sql.append("			  WHERE O.MENU_MASTER_ID=? and O.PARENT_ID = 0 ");
		sql.append("			  ORDER BY O.ORDERBYFIELD");
		sql.append("			  FOR XML PATH ('li'), TYPE ");
		sql.append("		) FOR XML RAW('ul')");
		sql.append("	) as VARCHAR(MAX)) AS XMLSTRING");
		return getJdbcTemplate().queryForObject(sql.toString(), new Object[]{masterMenuId}, String.class);
	}
	
	
	
	
	
}
