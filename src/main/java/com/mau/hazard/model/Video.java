package com.mau.hazard.model;

import java.util.ArrayList;
import java.util.List;
import com.mau.hazard.model.Hazard;

import org.springframework.stereotype.Component;

@Component
public class Video {
	public Video() {
		super();
	}
	public Video(String videoId, String videoType, String videoUrl, String thumbnailUrl, int difficulty,
			String difficultyDesc, List<Hazard> listTimeFrame) {
		super();
		this.videoId = videoId;
		this.videoType = videoType;
		this.videoUrl = videoUrl;
		this.thumbnailUrl = thumbnailUrl;
		this.difficulty = difficulty;
		this.difficultyDesc = difficultyDesc;
		this.listTimeFrame = listTimeFrame;
	}
	private String videoId;
	private String videoType;
	private String videoUrl;
	private String thumbnailUrl;
	private int difficulty;
	private String difficultyDesc;
	
	private List<Hazard> listTimeFrame = new ArrayList<>();
	
	
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	public List<Hazard> getListTimeFrame() {
		return listTimeFrame;
	}
	public void setListTimeFrame(List<Hazard> listTimeFrame) {
		this.listTimeFrame = listTimeFrame;
	}
	public String getVideoType() {
		return videoType;
	}
	public void setVideoType(String videoType) {
		this.videoType = videoType;
	}
	public int getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}
	public String getDifficultyDesc() {
		return difficultyDesc;
	}
	public void setDifficultyDesc(String difficultyDesc) {
		this.difficultyDesc = difficultyDesc;
	}
	
	
	


}
