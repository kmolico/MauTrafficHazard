package com.mau.hazard.dao;

import java.util.List;

import com.mau.hazard.model.Result;
import com.mau.hazard.model.Test;
import com.mau.hazard.model.Video;

public interface VideoDao {
	
	Video getVideoDetails(String videoId);
	List<Video> getTutorialVideoList();
	List<Video> getTestVideoList();
	Test getTestContents();
	void createResultEntry(Result result);
	void updateResultScore(Result result);
	int getCurrentAttempt(String principal);
	int getCountIncompleteVideo(String principal, int attempt);
	List<String> getUattemptedVideoId(String principal, int attempt);
	List<Result> getResult(String principal, int attempt);
	

}
