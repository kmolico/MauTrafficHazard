package com.mau.hazard.model;

public class Hazard {
	private String hazardId;
	private double hazardStart;
	private double hazardEnd;
	private String hazardDesc;
	private String hazardCatId;
	private String hazardSubCatId;
	
	
	public Hazard(String hazardId, double hazardStart, double hazardEnd, String hazardCatId, String hazardSubCatId, String hazardDesc) {
		this.setHazardId(hazardId);
		this.hazardStart = hazardStart;
		this.hazardEnd = hazardEnd;
		this.hazardCatId = hazardCatId;
		this.hazardSubCatId = hazardSubCatId;
		this.hazardDesc = hazardDesc;
	}
	public double getHazardStart() {
		return hazardStart;
	}
	public void setHazardStart(double hazardStart) {
		this.hazardStart = hazardStart;
	}
	public double getHazardEnd() {
		return hazardEnd;
	}
	public void setHazardEnd(double hazardEnd) {
		this.hazardEnd = hazardEnd;
	}
	public String getHazardDesc() {
		return hazardDesc;
	}
	public void setHazardDesc(String hazardDesc) {
		this.hazardDesc = hazardDesc;
	}
	public String getHazardCatId() {
		return hazardCatId;
	}
	public void setHazardCatId(String hazardCatId) {
		this.hazardCatId = hazardCatId;
	}
	public String getHazardSubCatId() {
		return hazardSubCatId;
	}
	public void setHazardSubCatId(String hazardSubCatId) {
		this.hazardSubCatId = hazardSubCatId;
	}
	public String getHazardId() {
		return hazardId;
	}
	public void setHazardId(String hazardId) {
		this.hazardId = hazardId;
	}
}
