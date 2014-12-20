package com.ingrc.performa.model;


public class INGRCUserModel {
	
	private String username;
	private String firstname;
	private String lastname;
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
	private String orgc;
	
	public INGRCUserModel(){
		super();
		// TODO Auto-generated constructor stub
	}
	public INGRCUserModel(String username, String firstname, String lastname,
			String vclass, String cdby, String cdon, String upby, String upon,
			String email, String phone, String ext, String mobile,
			String function, String department, String room, String floor,
			String building, String orgc) {
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
	@Override
	public String toString() {
		return "INGRCUserModel [username=" + username + ", firstname="
				+ firstname + ", lastname=" + lastname + ", vclass=" + vclass
				+ ", cdby=" + cdby + ", cdon=" + cdon + ", upby=" + upby
				+ ", upon=" + upon + ", email=" + email + ", phone=" + phone
				+ ", ext=" + ext + ", mobile=" + mobile + ", function="
				+ function + ", department=" + department + ", room=" + room
				+ ", floor=" + floor + ", building=" + building + ", orgc="
				+ orgc + "]";
	}
	
	

}
