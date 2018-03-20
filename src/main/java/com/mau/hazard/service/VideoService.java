package com.mau.hazard.service;

import java.util.List;

import com.mau.hazard.model.Result;
import com.mau.hazard.model.Video;

public interface VideoService {

	Video getVideoDetails(String videoId);
	List<Video> getTutorialVideoList();
	List<Video> getTestVideoList();
	void createResultEntry(int attempt);
	List<String> getUnattemptedVideoId(int attempt);
	int getAttempt();
	void saveScore(String hazardId, int score);
	List<Result> getResult(int attempt);
}
