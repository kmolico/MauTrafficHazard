package com.mau.hazard.dao;

import java.util.List;

import com.mau.hazard.model.Video;

public interface VideoDao {
	
	Video getVideoDetails(String videoId);
	List<Video> getTutorialVideoList();
	
	

}
