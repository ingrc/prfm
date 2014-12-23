package com.ingrc.performa.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class INGRCSqlScriptModel {

	private Integer id;
	@NotNull @NotEmpty
	private String name;
	@NotNull @NotEmpty
	private String sqlScript;
	@Min(value=1)
	private Integer ordo;
	public INGRCSqlScriptModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCSqlScriptModel(int id, String name, String sqlScript, int ordo) {
		super();
		this.id = id;
		this.name = name;
		this.sqlScript = sqlScript;
		this.ordo = ordo;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSqlScript() {
		return sqlScript;
	}
	public void setSqlScript(String sqlScript) {
		this.sqlScript = sqlScript;
	}
	public Integer getOrdo() {
		return ordo;
	}
	public void setOrdo(Integer ordo) {
		this.ordo = ordo;
	}
	
	
}
