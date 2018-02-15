package com.mau.hazard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mau.hazard.dao.VideoDao;
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

}
