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

import com.ingrc.performa.model.MenuMasterModel;
import com.ingrc.performa.web.dto.ComboboxHelperDto;
import com.ingrc.performa.web.dto.MenuMasterDto;

@Repository("menuMasterDao")
public class MenuMasterDao extends JdbcDaoSupport{
	
	@Autowired
	private DataSource dataSource;
 
	@Autowired
    public void init(DataSource dataSource) {
        setJdbcTemplate(new JdbcTemplate(dataSource));
    }
	public Integer insert(MenuMasterModel menuMaster){
		String insertSql = "insert into ingrc_menu_master (displayname, url, description, parent_id) values (?,?,?,?)";
		return getJdbcTemplate().update(insertSql, 
				new Object[]{menuMaster.getDisplayname(),menuMaster.getUrl(),menuMaster.getDescription(),menuMaster.getParentId()});
	}
	
	public Integer update(MenuMasterModel model){
		String update = "update ingrc_menu_master set displayname=?, url=?, description=?, parent_id=? where id=?";
		return getJdbcTemplate().update(update, new Object[]{model.getDisplayname(), model.getUrl(), model.getDescription(), model.getParentId(), model.getId()});
	}
	
	public Integer delete(Integer id){
		String checkSql = "select count(*) as cnt from ingrc_menu_master where parent_id=?";
		int cnt=0;
		try {
			cnt = getJdbcTemplate().queryForObject(checkSql, new Object[] {id}, Integer.class);
		} catch (EmptyResultDataAccessException ex){}
		
		if (cnt>0){
			return -1;
		}
		
		checkSql = "select count(*) as cnt from ingrc_menu_master_left where menu_master_id=?";
		cnt=0;
		try {
			cnt = getJdbcTemplate().queryForObject(checkSql, new Object[] {id}, Integer.class);
		} catch (EmptyResultDataAccessException ex){}
		
		if (cnt>0){
			return -1;
		}
		
		String sql = "delete from ingrc_menu_master where id=?";
		return getJdbcTemplate().update(sql, new Object[]{id});
	}
	
	public MenuMasterModel getMenuMasterById(String id){
		String sql = "select id, displayname, description, url, parent_id from ingrc_menu_master where id=?";
		try {
		return getJdbcTemplate().queryForObject(sql, new Object[]{id}, new RowMapper<MenuMasterModel>(){

			public MenuMasterModel mapRow(ResultSet result, int num)
					throws SQLException {
				MenuMasterModel model = new MenuMasterModel();
				model.setId(result.getInt("id"));
				model.setDisplayname(result.getString("displayname"));
				model.setDescription(result.getString("description"));
				model.setUrl(result.getString("url"));
				model.setParentId(result.getInt("parent_id"));
				return model;
			}
			
		});
		} catch (EmptyResultDataAccessException ex){
			return null;
		}
	}
	
	public List<ComboboxHelperDto> getComboboxValueMenuMaster(){
		String sql = "select distinct id,displayname from ingrc_menu_master where parent_id = 0 order by id";
		try {
		return getJdbcTemplate().query(sql, new RowMapper<ComboboxHelperDto>(){

			public ComboboxHelperDto mapRow(ResultSet result, int row)
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
	
	public List<MenuMasterDto> listAll(){
//		String selectSql = "select id,displayname, url, description, (select c.displayname from ingrc_menu_master c where c.id=m.parent_id) as parent from ingrc_menu_master m";
		String sql = "select id, displayname, url, display from vw_menu_master ORDER BY OrderByField";
		try {
		return getJdbcTemplate().query(sql, new RowMapper<MenuMasterDto>(){

			public MenuMasterDto mapRow(ResultSet result, int row)
					throws SQLException {
				MenuMasterDto model = new MenuMasterDto();
				model.setId(result.getInt("id"));
				model.setUrl(result.getString("url"));
				model.setDisplayname(result.getString("displayname"));
				model.setMenulevel(result.getString("display"));
				return model;
			}
			
		});
		} catch (EmptyResultDataAccessException ex){
			return null;
		}
	}
	
	public String getMenuAsStringXML(){
		StringBuilder sql = new StringBuilder();
		sql.append("select CAST((");
		sql.append("		SELECT 'nav navbar-nav navbar-left' as [class],");
		sql.append("			( ");
		sql.append("			SELECT");
		sql.append("				(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then");
		sql.append("					'dropdown' ");
		sql.append("				end  ");
		sql.append("				) as [@class],");
		sql.append("				(case when (O.URL IS NOT NULL OR O.URL <> '') then (O.URL + '?mntop=' + cast(O.ID as VARCHAR)) else '' end )  AS [a/@href],");
		sql.append("				(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then");
		sql.append("					'dropdown-toggle' ");
		sql.append("				end  ");
		sql.append("				) as [a/@class],");
		sql.append("				(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then");
		sql.append("					'dropdown' ");
		sql.append("				end  ");
		sql.append("				) as [a/@data-toggle],");
		sql.append("				(O.DISPLAYNAME) AS [a],");
		sql.append("				(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then");
		sql.append("					'caret' ");
		sql.append("				end  ");
		sql.append("				) as [a/b/@class],");
		sql.append("				(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then");
		sql.append("					'dropdown-menu' ");
		sql.append("				end  ");
		sql.append("				) as [ul/@class],");
		sql.append("				(");
		sql.append("					   SELECT ");
		sql.append("							  (case when (I.URL IS NOT NULL OR I.URL <> '') then (I.URL + '?mntop=' + cast(I.ID as VARCHAR)) else '' end ) AS [a/@href],");
		sql.append("							  I.DISPLAYNAME AS [a]");
		sql.append("					   FROM   VW_MENU_MASTER I");
		sql.append("					   WHERE  I.PARENT_ID = O.ID");
		sql.append("					   ORDER BY I.ORDERBYFIELD");
		sql.append("					   FOR XML PATH('li'), TYPE");
		sql.append("					 ) AS [ul]");
		sql.append("			  FROM   VW_MENU_MASTER O");
		sql.append("			  WHERE O.PARENT_ID = 0");
		sql.append("			  ORDER BY O.ORDERBYFIELD");
		sql.append("			  FOR XML PATH ('li'), TYPE");
		sql.append("		) FOR XML RAW('ul')");
		sql.append("	) as VARCHAR(MAX)) AS XMLSTRING");
			
		return getJdbcTemplate().queryForObject(sql.toString(), String.class);
	}
	
}
