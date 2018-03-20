package com.mau.hazard.model;

import java.util.ArrayList;
import java.util.List;

public class Test {
	
	private String testId;
	private String testStatus;
	private List<Video> videos = new ArrayList<>();
	
	public String getTestId() {
		return testId;
	}
	public void setTestId(String testId) {
		this.testId = testId;
	}
	public String getTestStatus() {
		return testStatus;
	}
	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}
	public List<Video> getVideos() {
		return videos;
	}
	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}
	
}
