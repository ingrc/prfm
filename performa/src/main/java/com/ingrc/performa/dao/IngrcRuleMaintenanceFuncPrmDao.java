package com.ingrc.performa.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
import com.ingrc.performa.model.INGRCFuncPrmModel;
import com.ingrc.performa.model.SAPFieldsModel;
import com.ingrc.performa.model.SAPTOBJModel;
import com.ingrc.performa.model.SAPTOBJTModel;
import com.ingrc.performa.model.SAPTSTCModel;
import com.ingrc.performa.web.dto.RuleMaintenanceAcFActDto;
import com.ingrc.performa.web.dto.RuleMaintenanceFuncPrmDto;

@Repository("ingrcRuleMaintenanceFuncPrmDao")
public class IngrcRuleMaintenanceFuncPrmDao extends JdbcDaoSupport {
	@Autowired
	private DataSource dataSource;

	@Autowired
	public void init(DataSource dataSource) {
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}

	public Integer save(INGRCFuncPrmModel model) {
		String insertSql = "insert into ingrc_ac_fprm (bprc,fid,tcode,object,field,from_val,to_val,search_type,status) "
				+ "values (?,?,?,?,?,?,?,?,?)";
		return getJdbcTemplate().update(
				insertSql,
				new Object[] { model.getBprc(), model.getFid(),
						model.getTcode(), model.getObject(), model.getField(),
						model.getFrom_val(), model.getTo_val(),
						model.getSearch_type(), model.getStatus() });
	}

	public Integer update(INGRCFuncPrmModel model) {
		String update = "update ingrc_ac_fprm set from_val=?,to_val=?,search_type=?,status=? "
				+ "where bprc=? AND fid=? AND tcode=? AND object=? AND field=?";
		return getJdbcTemplate().update(
				update,
				new Object[] { model.getFrom_val(), model.getTo_val(),
						model.getSearch_type(), model.getStatus(),
						model.getBprc(), model.getFid(), model.getTcode(),
						model.getObject(), model.getField() });
	}

	public Integer delete(String bprc, String fid, String tcode, String object,
			String field) {
		String sql = "delete from ingrc_ac_fprm where bprc=? AND fid=? AND tcode=? AND object=? AND field=?";
		int result = getJdbcTemplate().update(sql,
				new Object[] { bprc, fid, tcode, object, field });

		return result;
	}

	// undefine
	public List<RuleMaintenanceFuncPrmDto> list(String bprc, String fid,
			String tcode) {
		String sql = "select A.bprc,A.fid,A.tcode,A.object,A.field,A.from_val,A.to_val,A.search_type,A.status "
				+ "from ingrc_ac_fprm A "
				+ "where A.bprc=? AND A.fid=? AND A.tcode=? ";
		logger.info(sql);
		return getJdbcTemplate().query(sql, new Object[] { bprc, fid, tcode },
				new RowMapper<RuleMaintenanceFuncPrmDto>() {

					public RuleMaintenanceFuncPrmDto mapRow(ResultSet result,
							int arg1) throws SQLException {
						return new RuleMaintenanceFuncPrmDto(result
								.getString("bprc"), result.getString("fid"),
								result.getString("tcode"), result
										.getString("object"), result
										.getString("field"), result
										.getString("from_val"), result
										.getString("to_val"), result
										.getString("search_type"), result
										.getString("status"));
					}
				});
	}

	public RuleMaintenanceFuncPrmDto getById(String bprc, String fid, String tcode, String object,String field) {
		String sql = "select bprc, fid, tcode, object, field, from_val, to_val, search_type, status "
				+ "from ingrc_ac_fprm "
				// + "left join ingrc_ac_func B on A.fid=B.fid "
				// + "left join sap_tstc C on A.tcode = C.tcode "
				+ "where bprc=? AND fid=? AND tcode=? AND object=? AND field=?";
		System.out.println("masuk="+bprc+":"+fid+":"+tcode+":"+object+":"+field);
		System.out.println("masuk="+sql);
		return getJdbcTemplate().queryForObject(sql,
				new Object[] { bprc, fid, tcode, object, field },
				new RowMapper<RuleMaintenanceFuncPrmDto>() {

					public RuleMaintenanceFuncPrmDto mapRow(ResultSet result,
							int arg1) throws SQLException {
						return new RuleMaintenanceFuncPrmDto(
								result.getString("bprc"), 
								result.getString("fid"),
								result.getString("tcode"), 
								result.getString("object"), 
								result.getString("field"), 
								result.getString("from_val"), 
								result.getString("to_val"), 
								result.getString("search_type"), 
								result.getString("status"));
					}
				});
	}

	// _AC_FACT
	public List<RuleMaintenanceFuncPrmDto> listFunctionAction(String fid) {
		String sql = "select A.tcode,C.ttext " + "from ingrc_ac_fact A "
				+ "left join sap_tstct C on A.tcode = C.tcode "
				+ "where A.fid=? " + "order by A.fid,A.tcode";
		return getJdbcTemplate().query(sql, new Object[] { fid },
				new RowMapper<RuleMaintenanceFuncPrmDto>() {

					public RuleMaintenanceFuncPrmDto mapRow(ResultSet result,
							int arg1) throws SQLException {
						return new RuleMaintenanceFuncPrmDto(result
								.getString("tcode"), result.getString("ttext"));
					}
				});
	}

	public List<INGRCBPRModel> listBusinessProcess() {
		String sql = "select bprc, text from ingrc_tbpr order by bprc";
		return getJdbcTemplate().query(sql, new RowMapper<INGRCBPRModel>() {

			public INGRCBPRModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new INGRCBPRModel(result.getString("bprc"), result
						.getString("text"));
			}

		});
	}

	public List<SAPTOBJTModel> listObjectT() {
		String sql = "select object, ttext from sap_tobjt order by object";
		return getJdbcTemplate().query(sql, new RowMapper<SAPTOBJTModel>() {

			public SAPTOBJTModel mapRow(ResultSet result, int arg1)
					throws SQLException {
				return new SAPTOBJTModel(result.getString("object"), result
						.getString("ttext"));
			}

		});
	}

	public List<SAPFieldsModel> listField(String object) {
		List<SAPFieldsModel> tm = new ArrayList<SAPFieldsModel>();
		SAPFieldsModel ob = new SAPFieldsModel();
		SAPTOBJModel tmp = this.listObject(object);
		if (tmp.getFiel0() != null && !tmp.getFiel0().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel0(), tmp.getFiel0()));
		if (tmp.getFiel1() != null && !tmp.getFiel1().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel1(), tmp.getFiel1()));
		if (tmp.getFiel2() != null && !tmp.getFiel2().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel2(), tmp.getFiel2()));
		if (tmp.getFiel3() != null && !tmp.getFiel3().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel3(), tmp.getFiel3()));
		if (tmp.getFiel4() != null && !tmp.getFiel4().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel4(), tmp.getFiel4()));
		if (tmp.getFiel5() != null && !tmp.getFiel5().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel5(), tmp.getFiel5()));
		if (tmp.getFiel6() != null && !tmp.getFiel6().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel6(), tmp.getFiel6()));
		if (tmp.getFiel7() != null && !tmp.getFiel7().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel7(), tmp.getFiel7()));
		if (tmp.getFiel8() != null && !tmp.getFiel8().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel8(), tmp.getFiel8()));
		if (tmp.getFiel9() != null && !tmp.getFiel9().equalsIgnoreCase(""))
			tm.add(new SAPFieldsModel(tmp.getFiel9(), tmp.getFiel9()));
		return tm;
	}

	public SAPTOBJModel listObject(String object) {
		String sql = "select objct, fiel1, fiel2, fiel3, fiel4, fiel5, fiel6, fiel7, fiel8, fiel9, fiel0 from sap_tobj "
				+ "where objct=?";
		try {
			return getJdbcTemplate().queryForObject(sql,
					new Object[] { object }, new RowMapper<SAPTOBJModel>() {

						public SAPTOBJModel mapRow(ResultSet result, int arg1)
								throws SQLException {

							return new SAPTOBJModel(result.getString("objct"),
									result.getString("fiel1"), result
											.getString("fiel2"), result
											.getString("fiel3"), result
											.getString("fiel4"), result
											.getString("fiel5"), result
											.getString("fiel6"), result
											.getString("fiel7"), result
											.getString("fiel8"), result
											.getString("fiel9"), result
											.getString("fiel0"));
						}
					});
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}

	}

	public SAPTSTCModel getByTcode(String tcode) {
		String sql = "select tcode,pgmna from sap_tstc " + "where tcode=?";
		try {
			return getJdbcTemplate().queryForObject(sql,
					new Object[] { tcode }, new RowMapper<SAPTSTCModel>() {

						public SAPTSTCModel mapRow(ResultSet result, int arg1)
								throws SQLException {
							return new SAPTSTCModel(result.getString("tcode"),
									result.getString("pgmna"));
						}
					});
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}

	}

}
