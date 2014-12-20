package com.ingrc.performa.dao;

import java.io.File;
import java.io.FileFilter;
import java.io.FilenameFilter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.ingrc.performa.model.INGRCAcFuncModel;
import com.ingrc.performa.model.INGRCBPRModel;
import com.ingrc.performa.model.INGRCLoginModel;
import com.ingrc.performa.model.INGRCORGModel;
import com.ingrc.performa.model.INGRCSPRModel;
import com.ingrc.performa.model.INGRCTASSRModel;
import com.ingrc.performa.model.INGRCTCTYModel;
import com.ingrc.performa.model.INGRCTOwnModel;
import com.ingrc.performa.model.INGRCTOwnTModel;
import com.ingrc.performa.model.INGRCTRCATModel;
import com.ingrc.performa.model.INGRCTRTYModel;
import com.ingrc.performa.model.INGRCTableNameModel;
import com.ingrc.performa.model.INGRCUGRPModel;
import com.ingrc.performa.web.dto.TOwnAndTOwnTDto;

@Repository("dataReferenceDao")
public class DataReferenceDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;

	@Autowired
	public void init(DataSource dataSource) {
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}

	public List<INGRCBPRModel> getBPRList() {
		String sql = "select bprc,text from ingrc_tbpr order by bprc";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCBPRModel>() {

			public INGRCBPRModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				INGRCBPRModel model = new INGRCBPRModel(result
						.getString("bprc"), result.getString("text"));
				return model;
			}

		});
	}

	public List<INGRCSPRModel> getSPRList(String bprc) {
		String sql = "select bprc,sbpr,text from ingrc_tspr where bprc=? order by sbpr";

		return getJdbcTemplate().query(sql, new Object[] { bprc },
				new RowMapper<INGRCSPRModel>() {

					public INGRCSPRModel mapRow(ResultSet result, int arg1)
							throws SQLException {
						INGRCSPRModel model = new INGRCSPRModel(result
								.getString("bprc"), result.getString("sbpr"),
								result.getString("text"));
						return model;
					}

				});
	}

	public List<INGRCSPRModel> getSPRList() {
		String sql = "select bprc,sbpr,text from ingrc_tspr order by sbpr";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCSPRModel>() {

			public INGRCSPRModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				INGRCSPRModel model = new INGRCSPRModel(result
						.getString("bprc"), result.getString("sbpr"), result
						.getString("text"));
				return model;
			}

		});
	}

	public List<INGRCTRCATModel> getTRCATList() {
		String sql = "select level, text, color from ingrc_trcat order by level";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCTRCATModel>() {

			public INGRCTRCATModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTRCATModel(result.getString("level"), result
						.getString("text"), result.getString("color"));
			}

		});
	}

	public List<INGRCTRTYModel> getTRTYList() {
		String sql = "select rtype,text from ingrc_trty order by rtype";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCTRTYModel>() {

			public INGRCTRTYModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTRTYModel(result.getString("rtype"), result
						.getString("text"));
			}
		});
	}

	public List<INGRCTASSRModel> getTASSRList() {
		String sql = "select assr,text from ingrc_tassr order by assr";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCTASSRModel>() {

			public INGRCTASSRModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTASSRModel(result.getString("assr"), result
						.getString("text"));
			}

		});
	}

	public List<INGRCTCTYModel> getTCTYList() {
		String sql = "select ctype, text from ingrc_tcty order by text";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCTCTYModel>() {

			public INGRCTCTYModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTCTYModel(result.getString("ctype"), result
						.getString("text"));
			}

		});
	}

	public List<INGRCORGModel> getORGList() {
		String sql = "select orgc, name from ingrc_torg order by name";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCORGModel>() {

			public INGRCORGModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCORGModel(result.getString("orgc"), result
						.getString("name"));
			}

		});
	}

	public List<INGRCTOwnModel> getRiskOwner() {
		String sql = "select owner, username from ingrc_town where roner=1 order by username";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCTOwnModel>() {

			public INGRCTOwnModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTOwnModel(result.getString("owner"), result
						.getString("username"));
			}

		});
	}

	public List<INGRCUGRPModel> getUGrpList() {
		String sql = "select class, text from ingrc_ugrp order by text";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCUGRPModel>() {

			public INGRCUGRPModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCUGRPModel(result.getString("class"), result
						.getString("text"));
			}

		});
	}

	private INGRCTOwnModel getTown(String username) throws EmptyResultDataAccessException{
		String sql = "select owner,username,roner,coner,soner,scner,cdby,cdon,upby,upon from ingrc_town where username=?";
		return getJdbcTemplate().queryForObject(sql,
				new Object[] { username }, new RowMapper<INGRCTOwnModel>() {

					public INGRCTOwnModel mapRow(ResultSet result, int arg1)
							throws SQLException {
						return new INGRCTOwnModel(result.getString("owner"),
								result.getString("username"), result
										.getString("roner"), result
										.getString("coner"), result
										.getString("soner"), result
										.getString("scner"), result
										.getString("cdby"), result
										.getString("cdon"), result
										.getString("upby"), result
										.getString("upon"));
					}
				});
	}
	
	public List<TOwnAndTOwnTDto> getTOwnAndTOwnTList(String username) {
		String sql = "select ownty,ownn,lang,text from ingrc_townt";

		List<INGRCTOwnTModel> townt = getJdbcTemplate().query(sql,
				new RowMapper<INGRCTOwnTModel>() {

					public INGRCTOwnTModel mapRow(ResultSet result, int arg1)
							throws SQLException {
						return new INGRCTOwnTModel(result.getString("ownty"),
								result.getString("ownn"), result
										.getString("lang"), result
										.getString("text"));
					}
				});



		List<TOwnAndTOwnTDto> lst = new ArrayList<TOwnAndTOwnTDto>();
		INGRCTOwnModel town = new INGRCTOwnModel();
		try {
			town = this.getTown(username);
		} catch (EmptyResultDataAccessException e) {
			town = null;
		}
		
		if (town != null) {

			for (INGRCTOwnTModel val : townt) {
				TOwnAndTOwnTDto townAndtownt = new TOwnAndTOwnTDto();
				if (val.getOwnty().equalsIgnoreCase("CO")) {
					townAndtownt.setOwnty(val.getOwnty());
					townAndtownt.setOwnn(val.getOwnn());
					townAndtownt.setText(val.getText());
					townAndtownt.setStatus(town.getConer());
				}
				if (val.getOwnty().equalsIgnoreCase("RO")) {
					townAndtownt.setOwnty(val.getOwnty());
					townAndtownt.setOwnn(val.getOwnn());
					townAndtownt.setText(val.getText());
					townAndtownt.setStatus(town.getRoner());
				}
				if (val.getOwnty().equalsIgnoreCase("SC")) {
					townAndtownt.setOwnty(val.getOwnty());
					townAndtownt.setOwnn(val.getOwnn());
					townAndtownt.setText(val.getText());
					townAndtownt.setStatus(town.getScner());
				}
				if (val.getOwnty().equalsIgnoreCase("SO")) {
					townAndtownt.setOwnty(val.getOwnty());
					townAndtownt.setOwnn(val.getOwnn());
					townAndtownt.setText(val.getText());
					townAndtownt.setStatus(town.getSoner());
				}

				lst.add(townAndtownt);
			}

		} else {
			for (INGRCTOwnTModel val : townt) {
				TOwnAndTOwnTDto townAndtownt = new TOwnAndTOwnTDto();
				if (val.getOwnty().equalsIgnoreCase("RO")) {
					townAndtownt.setOwnty(val.getOwnty());
					townAndtownt.setOwnn(val.getOwnn());
					townAndtownt.setText(val.getText());

				}
				if (val.getOwnty().equalsIgnoreCase("CO")) {
					townAndtownt.setOwnty(val.getOwnty());
					townAndtownt.setOwnn(val.getOwnn());
					townAndtownt.setText(val.getText());

				}
				if (val.getOwnty().equalsIgnoreCase("SC")) {
					townAndtownt.setOwnty(val.getOwnty());
					townAndtownt.setOwnn(val.getOwnn());
					townAndtownt.setText(val.getText());

				}
				if (val.getOwnty().equalsIgnoreCase("SO")) {
					townAndtownt.setOwnty(val.getOwnty());
					townAndtownt.setOwnn(val.getOwnn());
					townAndtownt.setText(val.getText());

				}
				lst.add(townAndtownt);
			}
		}
		return lst;
	}
	
	public List<INGRCTOwnModel> getControlOwner(){
		String sql = "select owner, username from ingrc_town where coner=1 order by username";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCTOwnModel>(){

			public INGRCTOwnModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTOwnModel(result.getString("owner"), result.getString("username"));
			}
			
		});

	}
	
	public List<INGRCTableNameModel> getAccessControlTableNameList(){
		String sql = "select tablename, label from ingrc_tablename order by tablename";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCTableNameModel>(){

			public INGRCTableNameModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCTableNameModel(result.getString("tablename"), result.getString("label"));
			}
			
		});
	}
	
	public List<String> getFileList(String path){
		List<String> files = new ArrayList<String>();
		File file =  new File(path);

		File[] listOfFiles = file.listFiles();
		Arrays.sort(listOfFiles);
	    for (int i = 0; i < listOfFiles.length; i++) {
	        if (listOfFiles[i].isFile()) {
	          files.add(listOfFiles[i].getName());
	        } 
	    }
	    return files;
	}
	
	public List<String> getFileReportPDFList(String path,String prefixname,String ext){
		List<String> files = new ArrayList<String>();
		File file =  new File(path);
		GenericExtFilter filter = new GenericExtFilter(prefixname,ext);
		File[] listOfFiles = file.listFiles(filter);
		Arrays.sort(listOfFiles);
	    for (int i = 0; i < listOfFiles.length; i++) {
	        if (listOfFiles[i].isFile()) {
	          files.add(listOfFiles[i].getName());
	        } 
	    }
	    return files;
	}
	
	public class GenericExtFilter implements FilenameFilter {
		 
		private String ext;
		private String reportname;
 
		public GenericExtFilter(String reportname,String ext) {
			this.ext = ext;
			this.reportname = reportname;
		}
 
		public boolean accept(File dir, String name) {
			
			if(name.toLowerCase().startsWith(reportname.toLowerCase()) && 
			   name.toLowerCase().endsWith(ext.toLowerCase())){
				return true;
			}else{
				return false;
			}
				
		}
	}
	
	public List<INGRCAcFuncModel> getAcFuncList(){
		String sql = "select fid,text from ingrc_ac_func order by text";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCAcFuncModel>(){

			public INGRCAcFuncModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCAcFuncModel(result.getString("fid"), result.getString("text"));
			}
			
		});
	}
	
	public static void main(String[] args) {
		DataReferenceDao dao = new DataReferenceDao();
		List<String> a = dao.getFileReportPDFList("/home/among/fun-life/workspace-tutorial/dataupload", "agr",".del");
		System.out.println(a);
	}
	
}
