package com.mau.hazard.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Video {
	private String videoId;
	private String catId;
	private String subCatId;
	private String videoType;
	private String videoUrl;
	private String thumbnailUrl;
	private int numberHazards;
	private int difficulty;
	private String difficultyDesc;
	
	private List<HazardTimeFrame> listTimeFrame = new ArrayList<>();
	
	
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getCatId() {
		return catId;
	}
	public void setCatId(String catId) {
		this.catId = catId;
	}
	public String getSubCatId() {
		return subCatId;
	}
	public void setSubCatId(String subCatId) {
		this.subCatId = subCatId;
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
	public int getNumberHazards() {
		return numberHazards;
	}
	public void setNumberHazards(int numberHazards) {
		this.numberHazards = numberHazards;
	}
	public List<HazardTimeFrame> getListTimeFrame() {
		return listTimeFrame;
	}
	public void setListTimeFrame(List<HazardTimeFrame> listTimeFrame) {
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
