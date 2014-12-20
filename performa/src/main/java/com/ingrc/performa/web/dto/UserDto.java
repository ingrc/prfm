package com.ingrc.performa.web.dto;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.ingrc.performa.model.INGRCLoginModel;
import com.ingrc.performa.model.INGRCTOwnModel;
import com.ingrc.performa.model.INGRCUserModel;

public class UserDto {
	private String username;
	@NotNull @NotEmpty
	private String firstname;
	@NotNull @NotEmpty
	private String lastname;
	@NotNull @NotEmpty
	private String vclass;
	private String cdby;
	private String cdon;
	private String upby;
	private String upon;
	private String email;
	private String phone;
	private String ext;
	private String mobile;
	private String function;
	private String department;
	private String room;
	private String floor;
	private String building;
	@NotNull @NotEmpty
	private String orgc;
	private LoginDto logindto;
	private TOwnDto towndto;
	
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public UserDto(String username, String firstname, String lastname,
			String vclass, String cdby, String cdon, String upby, String upon,
			String email, String phone, String ext, String mobile,
			String function, String department, String room, String floor,
			String building, String orgc, LoginDto logindto, TOwnDto towndto) {
		super();
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.vclass = vclass;
		this.cdby = cdby;
		this.cdon = cdon;
		this.upby = upby;
		this.upon = upon;
		this.email = email;
		this.phone = phone;
		this.ext = ext;
		this.mobile = mobile;
		this.function = function;
		this.department = department;
		this.room = room;
		this.floor = floor;
		this.building = building;
		this.orgc = orgc;
		this.logindto = logindto;
		this.towndto = towndto;
	}



	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getFirstname() {
		return firstname;
	}


	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getVclass() {
		return vclass;
	}


	public void setVclass(String vclass) {
		this.vclass = vclass;
	}


	public String getCdby() {
		return cdby;
	}


	public void setCdby(String cdby) {
		this.cdby = cdby;
	}


	public String getCdon() {
		return cdon;
	}


	public void setCdon(String cdon) {
		this.cdon = cdon;
	}


	public String getUpby() {
		return upby;
	}


	public void setUpby(String upby) {
		this.upby = upby;
	}


	public String getUpon() {
		return upon;
	}


	public void setUpon(String upon) {
		this.upon = upon;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getExt() {
		return ext;
	}


	public void setExt(String ext) {
		this.ext = ext;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getFunction() {
		return function;
	}


	public void setFunction(String function) {
		this.function = function;
	}


	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public String getRoom() {
		return room;
	}


	public void setRoom(String room) {
		this.room = room;
	}


	public String getFloor() {
		return floor;
	}


	public void setFloor(String floor) {
		this.floor = floor;
	}


	public String getBuilding() {
		return building;
	}


	public void setBuilding(String building) {
		this.building = building;
	}


	public String getOrgc() {
		return orgc;
	}


	public void setOrgc(String orgc) {
		this.orgc = orgc;
	}


	public LoginDto getLogindto() {
		return logindto;
	}


	public void setLogindto(LoginDto logindto) {
		this.logindto = logindto;
	}


	public TOwnDto getTowndto() {
		return towndto;
	}


	public void setTowndto(TOwnDto towndto) {
		this.towndto = towndto;
	}


	@Override
	public String toString() {
		return "UserDto [username=" + username + ", firstname=" + firstname
				+ ", lastname=" + lastname + ", vclass=" + vclass + ", cdby="
				+ cdby + ", cdon=" + cdon + ", upby=" + upby + ", upon=" + upon
				+ ", email=" + email + ", phone=" + phone + ", ext=" + ext
				+ ", mobile=" + mobile + ", function=" + function
				+ ", department=" + department + ", room=" + room + ", floor="
				+ floor + ", building=" + building + ", orgc=" + orgc
				+ ", logindto=" + logindto + ", towndto=" + towndto+"]";
	}



	public void constructDto(INGRCUserModel model){
		this.username = model.getUsername();
		this.firstname = model.getFirstname();
		this.lastname = model.getLastname();
		this.vclass = model.getVclass();
		this.cdby = model.getCdby();
		this.cdon = model.getCdon();
		this.upby = model.getUpby();
		this.upon = model.getUpon();
		this.email = model.getEmail();
		this.phone = model.getPhone();
		this.ext = model.getExt();
		this.mobile = model.getMobile();
		this.function = model.getFunction();
		this.department = model.getDepartment();
		this.room = model.getRoom();
		this.floor = model.getFloor();
		this.building = model.getBuilding();
		this.orgc = model.getOrgc();
		LoginDto lgdto = new LoginDto();
		lgdto.setUsername(model.getUsername());
		
	}
	
	public void constructModel(INGRCUserModel model,INGRCLoginModel modelLogin, INGRCTOwnModel modelTOwn){
		model.setUsername(this.username);
		model.setFirstname(this.firstname);
		model.setLastname(this.lastname);
		model.setVclass(this.vclass);
		model.setCdby(this.cdby);
		model.setCdon(this.cdon);
		model.setUpby(this.upby);
		model.setUpon(this.upon);
		model.setEmail(this.email);
		model.setPhone(this.phone);
		model.setExt(this.ext);
		model.setMobile(this.mobile);
		model.setFunction(this.function);
		model.setDepartment(this.department);
		model.setRoom(this.room);
		model.setFloor(this.floor);
		model.setBuilding(this.building);
		model.setOrgc(this.orgc);
		
//		modelLogin.setUsername(this.username);
//		modelLogin.setLock(this.logindto.getLock());
//		modelLogin.setPassword(this.getLogindto().getPassword());
//		modelLogin.setCdby(this.getLogindto().getCdby());
//		modelLogin.setCdon(this.getLogindto().getCdon());
//		modelLogin.setUpby(this.getLogindto().getUpby());
//		modelLogin.setUpon(this.getLogindto().getUpon());
//		modelLogin.setTrdat(this.getLogindto().getTrdat());
//		modelLogin.setLtime(this.getLogindto().getLtime());
	    
		modelTOwn.setUsername(this.username);
		modelTOwn.setOwner(this.getTowndto().getOwner());
		modelTOwn.setRoner(this.getTowndto().getRoner());
		modelTOwn.setConer(this.getTowndto().getConer());
		modelTOwn.setSoner(this.getTowndto().getSoner());
		modelTOwn.setScner(this.getTowndto().getScner());
		modelTOwn.setCdby(this.getTowndto().getCdby());
		modelTOwn.setCdon(this.getTowndto().getCdon());
		modelTOwn.setUpby(this.getTowndto().getUpon());
		modelTOwn.setUpon(this.getTowndto().getUpon());
		
	}
}
