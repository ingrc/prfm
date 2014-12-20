package com.ingrc.performa.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.BatchUpdateException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.ingrc.performa.web.dto.AccessControlRestoreDBFromFileDto;

@Repository("accessControlDao")
public class AccessControlRestoreDBFromFileDao extends JdbcDaoSupport {
	private static final Logger logger = Logger
			.getLogger(AccessControlRestoreDBFromFileDao.class);
	private String currentDate;

	@Autowired
	private DataSource dataSource;

	@Autowired
	public void init(DataSource dataSource) {
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer updateLastUploadDate(Date uploadDate, String tableName){
		String sql = "update INGRC_TABLENAME set uploaddate=? where tablename=?";
		return getJdbcTemplate().update(sql, new Object[]{uploadDate, tableName});
	}

	public Integer save(AccessControlRestoreDBFromFileDto accessControl) {
		
		int result = 0, result2 = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/YYYY HH:MM");
		Date dt = new Date(System.currentTimeMillis());
		currentDate = sdf.format(dt);
		String tableName = accessControl.getTablename();


		String sqltableconf = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME =?";
		List<Map<String, Object>> rows = getJdbcTemplate().queryForList(
				sqltableconf, new Object[] { tableName });
		String fields = "";
		String valFields = "";
		int countFields = rows.size();
		int countGenerateFields = 1;

		if (countFields == 0) {
			accessControl.setInfo("tblnotexist");
			return 0;
		}
		// create structure sql
		for (Map<String, Object> row : rows) {
			if (countGenerateFields++ == countFields) {
				fields = fields + row.get("COLUMN_NAME");
				valFields = valFields + "?";
			} else {
				fields = fields + row.get("COLUMN_NAME") + ",";
				valFields = valFields + "?,";
			}
		}

		// update tablename status info
		getJdbcTemplate().update(
				"update ingrc_tablename set stat=? where tablename=?",
				new Object[] { "On Progress...", tableName });

		if (tableName != null && tableName.equalsIgnoreCase("SAP_AGR_1016B")) {
			this.doTableSAP_AGR_1016B(accessControl, fields, valFields,
					countFields);
		}

		if (tableName != null && tableName.equalsIgnoreCase("SAP_AGR_AGRS")) {
			this.doTableSAP_AGR_AGRS(accessControl, fields, valFields,
					countFields);
		}

		if (tableName != null && tableName.equalsIgnoreCase("SAP_AGR_DEFINE")) {
			this.doTableSAP_AGR_DEFINE(accessControl, fields, valFields,
					countFields);
		}
		// SAP_AGR_PROF
		if (tableName != null && tableName.equalsIgnoreCase("SAP_AGR_PROF")) {
			this.doTableSAP_AGR_PROF(accessControl, fields, valFields,
					countFields);
		}
		// SAP_AGR_USERS
		if (tableName != null && tableName.equalsIgnoreCase("SAP_AGR_USERS")) {
			this.doTableSAP_AGR_USERS(accessControl, fields, valFields,
					countFields);
		}
		// SAP_TACT
		if (tableName != null && tableName.equalsIgnoreCase("SAP_TACT")) {
			this.doTableSAP_TACT(accessControl, fields, valFields,
					countFields);
		}
		// SAP_TACTT
		if (tableName != null && tableName.equalsIgnoreCase("SAP_TACTT")) {
			this.doTableSAP_TACTT(accessControl, fields, valFields,
					countFields);
		}
		// SAP_TOBJ
		if (tableName != null && tableName.equalsIgnoreCase("SAP_TOBJ")) {
			this.doTableSAP_TOBJ(accessControl, fields, valFields,
					countFields);
		}
		// SAP_TSTC
		if (tableName != null && tableName.equalsIgnoreCase("SAP_TSTC")) {
			this.doTableSAP_TSTC(accessControl, fields, valFields,
					countFields);
		}
		// SAP_TSTCT
		if (tableName != null && tableName.equalsIgnoreCase("SAP_TSTCT")) {
			this.doTableSAP_TSTCT(accessControl, fields, valFields,
					countFields);
		}
		// SAP_USR02
		if (tableName != null && tableName.equalsIgnoreCase("SAP_USR02")) {
			this.doTableSAP_USR02(accessControl, fields, valFields,
					countFields);
		}
		// SAP_UST04
		if (tableName != null && tableName.equalsIgnoreCase("SAP_UST04")) {
			this.doTableSAP_UST04(accessControl, fields, valFields,
					countFields);
		}
		// SAP_UST10C
		if (tableName != null && tableName.equalsIgnoreCase("SAP_UST10C")) {
			this.doTableSAP_UST10C(accessControl, fields, valFields,
					countFields);
		}
		// SAP_UST10S
		if (tableName != null && tableName.equalsIgnoreCase("SAP_UST10S")) {
			this.doTableSAP_UST10S(accessControl, fields, valFields,
					countFields);
		}
		// SAP_UST12
		if (tableName != null && tableName.equalsIgnoreCase("SAP_UST12")) {
			this.doTableSAP_UST12(accessControl, fields, valFields, countFields);
		}
	
		// PA0001 52
		if (tableName != null && tableName.equalsIgnoreCase("SAP_PA0001")) {
			
			this.doTableSAP_PA0001(accessControl, fields, valFields, countFields);
		}
		// T500P 15
		if (tableName != null && tableName.equalsIgnoreCase("SAP_T500P")) {
			this.doTableSAP_T500P(accessControl, fields, valFields, countFields);
		}
		// T527X 7
		if (tableName != null && tableName.equalsIgnoreCase("SAP_T527X")) {
			this.doTableSAP_T527X(accessControl, fields, valFields, countFields);
		}
		// T528T 8
		if (tableName != null && tableName.equalsIgnoreCase("SAP_T528T")) {
			this.doTableSAP_T528T(accessControl, fields, valFields, countFields);
		}
		// V_USERNAME 7
		if (tableName != null && tableName.equalsIgnoreCase("SAP_V_USERNAME")) {
			this.doTableSAP_V_USERNAME(accessControl, fields, valFields, countFields);
		}
		if (tableName != null && tableName.equalsIgnoreCase("SAP_DEVACCESS")){
			this.doTableSAP_DEVACCESS(accessControl, fields, valFields, countFields);
		}
		if (tableName != null && tableName.equalsIgnoreCase("SAP_AGR_TCODES")){
			this.doTableSAP_AGR_TCODES(accessControl, fields, valFields, countFields);
		}
		if (tableName != null && tableName.equalsIgnoreCase("SAP_AGR_TEXTS")){
			this.doTableSAP_AGR_TEXTS(accessControl, fields, valFields, countFields);
		}
		if (tableName != null && tableName.equalsIgnoreCase("SAP_DBTABLOG")){
			this.doTableSAP_DBTABLOG(accessControl, fields, valFields, countFields);
		}
		if (tableName != null && tableName.equalsIgnoreCase("SAP_PA0003")){
			this.doTableSAP_PA0003(accessControl, fields, valFields, countFields);
		}
		if (tableName != null && tableName.equalsIgnoreCase("SAP_TPFHT")){
			this.doTableSAP_TPFHT(accessControl, fields, valFields, countFields);
		}
		if (tableName != null && tableName.equalsIgnoreCase("SAP_TPFET")){
			this.doTableSAP_TPFET(accessControl, fields, valFields, countFields);
		}
		if (tableName != null && tableName.equalsIgnoreCase("SAP_PA0000")){
			this.doTableSAP_PA0000(accessControl, fields, valFields, countFields);
		}
		
		getJdbcTemplate().update(
				"update ingrc_tablename set stat=? where tablename=?",
				new Object[] { "Finish", tableName });

		return result & result2;

	}

	private Integer doTableSAP_AGR_1016B(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;// csvReader.readNext().length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
				// e1.printStackTrace();
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
				// e1.printStackTrace();
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;
			// while ((row = csvReader.readNext()) != null) {
			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					// countSuccess=0;
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
				// e.printStackTrace();
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate().update(
					update2,
					new Object[] { localFilenName, countSuccess, useraccess,
							currentDate, tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}

	private Integer doTableSAP_AGR_AGRS(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;// csvReader.readNext().length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
				// e1.printStackTrace();
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
				// e1.printStackTrace();
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;
			// while ((row = csvReader.readNext()) != null) {
			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					// countSuccess=0;
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
				// e.printStackTrace();
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}

	private Integer doTableSAP_AGR_DEFINE(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;// csvReader.readNext().length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
				// e1.printStackTrace();
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
				// e1.printStackTrace();
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					psu.setString(9, row[8]);
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					psu.setString(12, row[11]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {

					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
				// e.printStackTrace();
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}

	private Integer doTableSAP_AGR_PROF(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					// countSuccess=0;
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}

	private Integer doTableSAP_AGR_USERS(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					psu.setInt(9, Integer.parseInt(row[8]));
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_TACT(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();
		
		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_TACTT(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_TOBJ(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					psu.setString(9, row[8]);
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					psu.setString(12, row[11]);
					psu.setString(13, row[12]);
					psu.setString(14, row[13]);
					psu.setString(15, row[14]);
					
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_TSTC(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_TSTCT(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_USR02(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setInt(8, Integer.parseInt(row[7]));
					psu.setInt(9, Integer.parseInt(row[8]));
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					psu.setString(12, row[11]);
					psu.setString(13, row[12]);
					psu.setString(14, row[13]);
					psu.setString(15, row[14]);
					psu.setString(16, row[15]);
					psu.setString(17, row[16]);
					psu.setString(18, row[17]);
					psu.setString(19, row[18]);
					psu.setString(20, row[19]);
					psu.setString(21, row[20]);
					psu.setString(22, row[21]);
					psu.setString(23, row[22]);
					psu.setString(24, row[23]);
					psu.setString(25, row[24]);
					psu.setString(26, row[25]);
					psu.setString(27, row[26]);
					psu.setString(28, row[27]);
					psu.setString(29, row[28]);
					psu.setString(30, row[29]);
					psu.setString(31, row[30]);
					psu.setString(32, row[31]);
					psu.setString(33, row[32]);
					psu.setString(34, row[33]);
					psu.setInt(35, Integer.parseInt(row[34]));
					psu.setString(36, row[35]);
					psu.setString(37, row[36]);
					psu.setInt(38, Integer.parseInt(row[37]));
					psu.setString(39, row[38]);
					psu.setString(40, row[39]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_UST04(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_UST10C(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_UST10S(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_UST12(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_PA0001(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;
			System.out.println("COUNT="+countTab+":"+countFields);
			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					psu.setString(9, row[8]);
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					psu.setString(12, row[11]);
					psu.setString(13, row[12]);
					psu.setString(14, row[13]);
					psu.setString(15, row[14]);
					psu.setString(16, row[15]);
					psu.setString(17, row[16]);
					psu.setString(18, row[17]);
					psu.setString(19, row[18]);
					psu.setString(20, row[19]);
					psu.setString(21, row[20]);
					psu.setString(22, row[21]);
					psu.setString(23, row[22]);
					psu.setString(24, row[23]);
					psu.setString(25, row[24]);
					psu.setString(26, row[25]);
					psu.setString(27, row[26]);
					psu.setString(28, row[27]);
					psu.setString(29, row[28]);
					psu.setString(30, row[29]);
					psu.setString(31, row[30]);
					psu.setString(32, row[31]);
					psu.setString(33, row[32]);
					psu.setString(34, row[33]);
					psu.setString(35, row[34]);
					psu.setString(36, row[35]);
					psu.setString(37, row[36]);
					psu.setString(38, row[37]);
					psu.setString(39, row[38]);
					psu.setString(40, row[39]);
					psu.setString(41, row[40]);
					psu.setString(42, row[41]);
					psu.setString(43, row[42]);
					psu.setString(44, row[43]);
					psu.setString(45, row[44]);
					psu.setString(46, row[45]);
					psu.setString(47, row[46]);
					psu.setString(48, row[47]);
					psu.setString(49, row[48]);
					psu.setString(50, row[49]);
					psu.setString(51, row[50]);
					psu.setString(52, row[51]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_T500P(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					psu.setString(9, row[8]);
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					psu.setString(12, row[11]);
					psu.setString(13, row[12]);
					psu.setString(14, row[13]);
					psu.setString(15, row[14]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_T527X(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_T528T(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}

	private Integer doTableSAP_V_USERNAME(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_DEVACCESS(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_AGR_TCODES(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_AGR_TEXTS(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;

			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_DBTABLOG(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		System.out.println("start SAP_DBTABLOG");
		logger.debug("start SAP_DBTABLOG");
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;
			logger.debug("CSV -> ["+countTab+"] -> "+csvReader.readLine());

//			if (countTab != countFields) {
//				logger.debug("field not match!!!");
//				accessControl.setInfo("fieldnotmatch");
//				csvReader.close();
//				return 0;
//			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
//					psu.setString(5, null);
					psu.setString(5, row[5]);
					psu.setString(6, row[6]);
					psu.setString(7, row[7]);
					psu.setString(8, row[8]);
					psu.setString(9, row[9]);
					psu.setString(10, row[10]);
					psu.setString(11, row[11]);
					psu.setString(12, row[12]);
//					psu.setString(14, null);
					
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_PA0000(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;
			System.out.println("COUNT="+countTab+":"+countFields);
			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					psu.setString(9, row[8]);
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					psu.setString(12, row[11]);
					psu.setString(13, row[12]);
					psu.setString(14, row[13]);
					psu.setString(15, row[14]);
					psu.setString(16, row[15]);
					psu.setString(17, row[16]);
					psu.setString(18, row[17]);
					psu.setString(19, row[18]);
					psu.setString(20, row[19]);
					psu.setString(21, row[20]);
					psu.setString(22, row[21]);
					psu.setString(23, row[22]);
					psu.setString(24, row[23]);
					psu.setString(25, row[24]);
					psu.setString(26, row[25]);
					psu.setString(27, row[26]);
					psu.setString(28, row[27]);

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_TPFHT(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("d/M/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;
			System.out.println("COUNT="+countTab+":"+countFields);
			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
//				e1.printStackTrace();
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
//				e1.printStackTrace();
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					psu.setString(9, row[8]);
					
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					psu.setString(12, row[11]);
					
					psu.setString(13, row[12]);
					psu.setString(14, row[13]);
					psu.setString(15, row[14]);
					psu.setString(16, row[15]);
					psu.setString(17, row[16]);
					
					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
//					ex.printStackTrace();
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
//				ex.printStackTrace();
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
//				e.printStackTrace();
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_TPFET(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;
			System.out.println("COUNT="+countTab+":"+countFields);
			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					psu.setString(9, row[8]);
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	private Integer doTableSAP_PA0003(
			AccessControlRestoreDBFromFileDto accessControl, String fields,
			String valFields, Integer countFields) {
		int result = 0;
		int countTab = 0;
		String useraccess = accessControl.getUseraccess();
		String tableName = accessControl.getTablename();
		String localFilenName = accessControl.getFilename();

		String sqldel = "delete from " + tableName;
		result = getJdbcTemplate().update(sqldel);

		String sql = "insert into " + accessControl.getTablename() + " ("
				+ fields + ") values(" + valFields + ")";

		try {
			String[] row = null;
			File file = new File(accessControl.getFilepath() + File.separator
					+ accessControl.getFilename());

			BufferedReader csvReader = new BufferedReader(new FileReader(file));

			countTab = csvReader.readLine().split("\t", -1).length;
			System.out.println("COUNT="+countTab+":"+countFields);
			if (countTab != countFields) {
				accessControl.setInfo("fieldnotmatch");
				csvReader.close();
				return 0;
			}

			PreparedStatement psu = null;
			try {
				psu = getConnection().prepareStatement(sql);
			} catch (CannotGetJdbcConnectionException e1) {
				logger.error("Jdbc connection Exception:" + e1.getMessage());
			} catch (SQLException e1) {
				logger.error("IO Exception 3:" + e1.getMessage());
			}
			final int batchSize = 1000;
			int count = 0;
			int countSuccess = 0;
			int countUnSuccess = 0;
			int[] success = null;
			String line = null;

			while ((line = csvReader.readLine()) != null) {
				row = line.split("\t", -1);
				try {
					psu.setString(1, row[0]);
					psu.setString(2, row[1]);
					psu.setString(3, row[2]);
					psu.setString(4, row[3]);
					psu.setString(5, row[4]);
					psu.setString(6, row[5]);
					psu.setString(7, row[6]);
					psu.setString(8, row[7]);
					psu.setString(9, row[8]);
					psu.setString(10, row[9]);
					psu.setString(11, row[10]);
					psu.setString(12, row[11]);
					psu.setString(13, row[12]);
					psu.setString(14, row[13]);
					psu.setString(15, row[14]);
					psu.setString(16, row[15]);
					psu.setString(17, row[16]);
					psu.setString(18, row[17]);
					psu.setString(19, row[18]);
					psu.setString(20, row[19]);
					psu.setString(21, row[20]);
					psu.setString(22, row[21]);
					psu.setString(23, row[22]);
					psu.setString(24, row[23]);
					psu.setString(25, row[24]);
					psu.setString(26, row[25]);
					psu.setString(27, row[26]);
					psu.setString(28, row[27]);
					psu.setString(29, row[28]);
					psu.setString(30, row[29]);
					psu.setString(31, row[30]);
					psu.setString(32, row[31]);
					psu.setString(33, row[32]);
					psu.setString(34, row[33]);
					psu.setString(35, row[34]);
					psu.setString(36, row[35]);
					psu.setString(37, row[36]);
					psu.setString(38, row[37]);
					psu.setString(39, row[38]);
					psu.setString(40, row[39]);
					psu.setString(41, row[40]);
					psu.setString(42, row[41]);
					psu.setString(43, row[42]);
					psu.setString(44, row[43]);
					psu.setString(45, row[44]);
					psu.setString(46, row[45]);
					psu.setString(47, row[46]);

					psu.addBatch();

					if (++count % batchSize == 0) {
						success = psu.executeBatch();
						for (int suc : success) {
							countSuccess = countSuccess + suc;
						}
					}
					System.out.println("Counter=" + count);
				} catch (BatchUpdateException ex) {
					int[] updateCount = ex.getUpdateCounts();
					for (int i : updateCount) {
						if (i == Statement.EXECUTE_FAILED) {
							countUnSuccess++;
						} else {
							countSuccess++;
						}
					}
				} catch (SQLException e) {
					logger.error("IO Exception 2:" + e.getMessage());
				}
			}
			try {
				success = psu.executeBatch();
				for (int suc : success) {
					countSuccess = countSuccess + suc;
				}

				getConnection().commit();
			} catch (BatchUpdateException ex) {
				int[] updateCount = ex.getUpdateCounts();
				for (int i : updateCount) {
					if (i == Statement.EXECUTE_FAILED) {
						countUnSuccess++;
					} else {
						countSuccess++;
					}
				}
			} catch (SQLException e) {
				logger.error("SQL Exception 1:" + e.getMessage());
			}
			csvReader.close();
			accessControl.setFilesize(String.valueOf(file.length() / 1024));
			accessControl.setActualrecord(countSuccess);
			accessControl.setTotalrecord(count);

			String update2 = "update ingrc_tablename set filename=?,totalrecord=?,upby=?,upon=? "
					+ "where tablename=?";
			getJdbcTemplate()
					.update(update2,
							new Object[] { localFilenName, countSuccess, useraccess, currentDate,
									tableName });

			result = countSuccess;
		} catch (IOException e) {
			logger.error("IO Exception 1:" + e.getMessage());
			result = 0;
		}
		return result;
	}
	
	
	
	public List<AccessControlRestoreDBFromFileDto> list() {
		String sql = "select tablename,label,filename,totalrecord,stat,uploaddate from ingrc_tablename";

		return getJdbcTemplate().query(sql,
				new RowMapper<AccessControlRestoreDBFromFileDto>() {

					public AccessControlRestoreDBFromFileDto mapRow(
							ResultSet result, int arg1) throws SQLException {
						AccessControlRestoreDBFromFileDto dto = new AccessControlRestoreDBFromFileDto(
								result.getString("tablename"), result
										.getString("label"), result
										.getString("filename"), result
										.getInt("totalrecord"));
						dto.setStat(result.getString("stat"));
						dto.setUploadDate(result.getTimestamp("uploaddate"));
						return dto;
					}
				});
	}
}
