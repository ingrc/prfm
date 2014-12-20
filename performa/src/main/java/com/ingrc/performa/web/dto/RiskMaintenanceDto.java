package com.ingrc.performa.web.dto;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.math.NumberUtils;
import org.hibernate.validator.constraints.Length;

import com.ingrc.performa.model.INGRCRASSRModel;
import com.ingrc.performa.model.INGRCRiskModel;

public class RiskMaintenanceDto {

	private Integer active;
	@NotNull @Length(max=8)
	private String riskId;
	@NotNull
	private String riskType;
	@NotNull
	private String riskLevel;
	@NotNull
	private List<String> financialAssertions;
	@NotNull
	private String businessProcess;
	@NotNull
	private String subProcess;
	@NotNull
	private String riskDescription;
	@NotNull
	private String controlObjective;
	
	private String fid1;
	private String fid2;
	private String fid3;
	private String fid4;
	private String fid5;
	
	public RiskMaintenanceDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RiskMaintenanceDto(Integer active, String riskId, String riskType,
			String riskLevel, List<String> financialAssertions,
			String businessProcess, String subProcess, String riskDescription,
			String controlObjective, 
			String fid1, String fid2,String fid3,String fid4,String fid5) {
		super();
		this.active = active;
		this.riskId = riskId;
		this.riskType = riskType;
		this.riskLevel = riskLevel;
		this.financialAssertions = financialAssertions;
		this.businessProcess = businessProcess;
		this.subProcess = subProcess;
		this.riskDescription = riskDescription;
		this.controlObjective = controlObjective;
		this.fid1 =fid1;
		this.fid2 =fid2;
		this.fid3 =fid3;
		this.fid4 =fid4;
		this.fid5 =fid5;
	}
	public Integer getActive() {
		return active;
	}
	public void setActive(Integer active) {
		this.active = active;
	}
	public String getRiskId() {
		return riskId;
	}
	public void setRiskId(String riskId) {
		this.riskId = riskId;
	}
	public String getRiskType() {
		return riskType;
	}
	public void setRiskType(String riskType) {
		this.riskType = riskType;
	}
	public String getRiskLevel() {
		return riskLevel;
	}
	public void setRiskLevel(String riskLevel) {
		this.riskLevel = riskLevel;
	}
	public List<String> getFinancialAssertions() {
		return financialAssertions;
	}
	public void setFinancialAssertions(List<String> financialAssertions) {
		this.financialAssertions = financialAssertions;
	}
	public String getBusinessProcess() {
		return businessProcess;
	}
	public void setBusinessProcess(String businessProcess) {
		this.businessProcess = businessProcess;
	}
	public String getSubProcess() {
		return subProcess;
	}
	public void setSubProcess(String subProcess) {
		this.subProcess = subProcess;
	}
	public String getRiskDescription() {
		return riskDescription;
	}
	public void setRiskDescription(String riskDescription) {
		this.riskDescription = riskDescription;
	}
	public String getControlObjective() {
		return controlObjective;
	}
	public void setControlObjective(String controlObjective) {
		this.controlObjective = controlObjective;
	}
	
	
	public String getFid1() {
		return fid1;
	}
	public void setFid1(String fid1) {
		this.fid1 = fid1;
	}
	public String getFid2() {
		return fid2;
	}
	public void setFid2(String fid2) {
		this.fid2 = fid2;
	}
	public String getFid3() {
		return fid3;
	}
	public void setFid3(String fid3) {
		this.fid3 = fid3;
	}
	public String getFid4() {
		return fid4;
	}
	public void setFid4(String fid4) {
		this.fid4 = fid4;
	}
	public String getFid5() {
		return fid5;
	}
	public void setFid5(String fid5) {
		this.fid5 = fid5;
	}
	
	@Override
	public String toString() {
		return "RiskMaintenanceDto [active=" + active + ", riskId=" + riskId
				+ ", riskType=" + riskType + ", riskLevel=" + riskLevel
				+ ", financialAssertions=" + financialAssertions
				+ ", businessProcess=" + businessProcess + ", subProcess="
				+ subProcess + ", riskDescription=" + riskDescription
				+ ", controlObjective=" + controlObjective + ", fid1=" + fid1
				+ ", fid2=" + fid2 + ", fid3=" + fid3 + ", fid4=" + fid4
				+ ", fid5=" + fid5 + "]";
	}
	public void constructModel(INGRCRiskModel model, List<INGRCRASSRModel> financialModel){
		if (this.riskId != null){
			model.setRiskid(this.riskId);
			if (this.financialAssertions.size()>0){
				for (String assr:financialAssertions){
					financialModel.add(new INGRCRASSRModel(assr, this.riskId));
				}
			}
		}
		if (this.active == null){
			model.setStat("0");
		} else {
			model.setStat(String.valueOf(this.active));
		}
		model.setRtype(this.riskType);
		model.setLevel(this.riskLevel);
		model.setBprc(this.businessProcess);
		model.setSbpr(this.subProcess);
		model.setCobj(controlObjective);
		model.setText(riskDescription);
		model.setFid1(fid1);
		model.setFid2(fid2);
		model.setFid3(fid3);
		model.setFid4(fid4);
		model.setFid5(fid5);
			
	}
	
	public void constructDto(INGRCRiskModel model, List<INGRCRASSRModel> financialModel){
		this.riskId = model.getRiskid();
		this.active = NumberUtils.toInt(model.getStat(), 0);
		this.riskType = model.getRtype();
		this.riskLevel = model.getLevel();
		this.businessProcess = model.getBprc();
		this.subProcess = model.getSbpr();
		this.controlObjective = model.getCobj();
		this.riskDescription = model.getText();
		this.fid1 = model.getFid1();
		this.fid2 = model.getFid2();
		this.fid3 = model.getFid3();
		this.fid4 = model.getFid4();
		this.fid5 = model.getFid5();
		
		this.financialAssertions = new ArrayList<String>();
		for(INGRCRASSRModel assr:financialModel){
			this.financialAssertions.add(assr.getAssr());
		}
	}
	
}
