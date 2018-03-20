package com.mau.hazard.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.mau.hazard.dao.VideoDao;
import com.mau.hazard.model.Hazard;
import com.mau.hazard.model.Result;
import com.mau.hazard.model.Test;
import com.mau.hazard.model.Video;
@Service("videoService")
public class VideoServiceImpl implements VideoService{
	
	
	VideoDao videoDao;
	
	@Autowired
	public void setVideoDao(VideoDao videoDao) {
		this.videoDao = videoDao;
	}

	@Override
	public Video getVideoDetails(String videoId) {
		return videoDao.getVideoDetails(videoId);
	}

	@Override
	public List<Video> getTutorialVideoList() {
		return videoDao.getTutorialVideoList();
	}
	
	@Override
	public List<Video> getTestVideoList() {
		return videoDao.getTestVideoList();
	}
	
	@Override
	public void createResultEntry(int attempt) {
		int remainingVideos = videoDao.getCountIncompleteVideo(getPrincipal(), attempt);
		if(remainingVideos == 0) {
			Test aTest = videoDao.getTestContents();
			Result aResult = null;
			if(aTest != null) {
				for (Video video : aTest.getVideos()) {
					for (Hazard aHazard : video.getListTimeFrame()) {
						aResult = new Result(getPrincipal(), aTest.getTestId(), attempt, video.getVideoId(), aHazard.getHazardId(), -1, LocalDateTime.now().toString());
						videoDao.createResultEntry(aResult);
					}
				}
				
			}
			else {
				//No active test
			}
		}
	}
	
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	@Override
	public List<String> getUnattemptedVideoId(int attempt) {
		List<String> videoIds = videoDao.getUattemptedVideoId(getPrincipal(), attempt);
		return videoIds;
	}

	@Override
	public int getAttempt() {
		int currentAttempt = videoDao.getCurrentAttempt(getPrincipal());
		if(currentAttempt > 0) {
			int remainingVideos = getCountRemainigVideos(currentAttempt);
			return remainingVideos == 0 ? currentAttempt + 1: currentAttempt;
		}
		else {
			return currentAttempt + 1;
		}
	}
	
	@Override
	public int getCountRemainigVideos(int currentAttempt) {
		return videoDao.getCountIncompleteVideo(getPrincipal(), currentAttempt);
	}

	@Override
	public void saveScore(String hazardId, int score) {
		int attempt = videoDao.getCurrentAttempt(getPrincipal());
		Result result = new Result(getPrincipal(), "", attempt, "", hazardId, score, LocalDateTime.now().toString());
		videoDao.updateResultScore(result);
		
	}

	@Override
	public List<Result> getResult(int attempt) {
		if(attempt == 0 ) {
			attempt = videoDao.getCurrentAttempt(getPrincipal());
		}
		return videoDao.getResult(getPrincipal(), attempt);
	}

}
