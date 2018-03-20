package com.mau.hazard.model;

public class Result {
	
	public Result() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Result(String userId, String testId, int attemptNumber, String videoId, String hazardId, int score,
			String dateTime) {
		super();
		this.userId = userId;
		this.testId = testId;
		this.attemptNumber = attemptNumber;
		this.videoId = videoId;
		this.hazardId = hazardId;
		this.score = score;
		this.dateTime = dateTime;
	}
	private String userId;
	private String testId;
	private int attemptNumber;
	private String videoId;
	private String hazardId;
	private int score;
	private String dateTime;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTestId() {
		return testId;
	}
	public void setTestId(String testId) {
		this.testId = testId;
	}
	public int getAttemptNumber() {
		return attemptNumber;
	}
	public void setAttemptNumber(int attemptNumber) {
		this.attemptNumber = attemptNumber;
	}
	public String getHazardId() {
		return hazardId;
	}
	public void setHazardId(String hazardId) {
		this.hazardId = hazardId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	

}
