package com.ingrc.performa.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("reportDataGeneratorDao")
public class ReportDataGeneratorDao extends JdbcDaoSupport {

	@Autowired
	private DataSource dataSource;

	@Autowired
	public void init(DataSource dataSource) {
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public void execScript(String sql){
		getJdbcTemplate().execute(sql);
	}
}
