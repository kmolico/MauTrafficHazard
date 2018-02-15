package com.mau.hazard.service;

import java.util.List;

import com.mau.hazard.model.Video;

public interface VideoService {

	Video getVideoDetails(String videoId);
	List<Video> getTutorialVideoList();
}
