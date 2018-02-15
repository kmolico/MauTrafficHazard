package com.mau.hazard.model;

public class HazardTimeFrame {
	private double start;
	private double end;
	
	public HazardTimeFrame(double start, double end) {
		this.start = start;
		this.end = end;
	}
	public double getStart() {
		return start;
	}
	public void setStart(double start) {
		this.start = start;
	}
	public double getEnd() {
		return end;
	}
	public void setEnd(double end) {
		this.end = end;
	}

}
