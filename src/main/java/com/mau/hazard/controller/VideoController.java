package com.mau.hazard.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mau.hazard.model.Result;
import com.mau.hazard.model.Video;
import com.mau.hazard.service.VideoService;



@Controller
@SessionAttributes({"video", "attempt"})
public class VideoController {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	Video video;
	
	/*@ModelAttribute("attempt")
	public int getAttempt(){
	    return 0;
	}*/
	
	@RequestMapping(value = "/tutorial/{videoId}", method = RequestMethod.GET)
	public ModelAndView playVideo(@PathVariable("videoId") String videoId) {
		
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		ModelAndView model = new ModelAndView("videoPlayer");
		video = videoService.getVideoDetails(videoId);
		try {
			json = mapper.writeValueAsString(video);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addObject("videoDetails", json);
		model.addObject("testMode", false);
		model.addObject("remainingVideo", 0);
		return model;

	}
	
	@RequestMapping(value = "/tutorial", method = RequestMethod.GET)
	public ModelAndView tutorial() {
		
		List<Video> videos = videoService.getTutorialVideoList();		
		ModelAndView model = new ModelAndView("tutorial");
		model.addObject("listVideos", videos);
		return model;
	}
	
	@RequestMapping(value = "/getTutorialVideo", method = RequestMethod.GET)
	@ResponseBody public FileSystemResource getPreview3(HttpServletResponse response) {
	    return new FileSystemResource(video.getVideoUrl());
	}
	
	@RequestMapping(value = "/test/load", method = RequestMethod.GET)
	public ModelAndView loadTest(@ModelAttribute("attempt") int attempt) {
		
		//insert into result
		//return 1 video detail randomly
		videoService.createResultEntry(attempt);
		List<String> videoIds = videoService.getUnattemptedVideoId(attempt);
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		ModelAndView model = new ModelAndView("videoPlayer");
		video = videoService.getVideoDetails(getRandomVideo(videoIds));
		try {
			json = mapper.writeValueAsString(video);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addObject("videoDetails", json);
		model.addObject("testMode", true);
		model.addObject("remainingVideo", videoIds.size() - 1);
		return model;
	}
	
	
	@RequestMapping(value = "/test/saveScore", method = RequestMethod.POST)
	@ResponseBody
	public void saveScore(@RequestParam String hazardId, @RequestParam int score) {
		videoService.saveScore(hazardId, score);
	}
	
	@RequestMapping(value = "/getNextVideo", method = RequestMethod.GET)
	public ModelAndView getNextVideo(@ModelAttribute("attempt") int attempt) {
		List<String> videoIds = videoService.getUnattemptedVideoId(attempt);
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		ModelAndView model = new ModelAndView("videoPlayer");
		video = videoService.getVideoDetails(getRandomVideo(videoIds));
		try {
			json = mapper.writeValueAsString(video);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addObject("videoDetails", json);
		model.addObject("testMode", true);
		model.addObject("remainingVideo", videoIds.size() - 1);
		return model;
	}
	
	@RequestMapping(value = "/getResult", method = RequestMethod.GET)	
	public ModelAndView getResult(@ModelAttribute("attempt") int attempt) {
		
		List<Result> result = videoService.getResult(attempt);		
		ModelAndView model = new ModelAndView("result");
		model.addObject("resultList", result);
		double totalScore = 0;
		String outcome;
		for (Result aResult : result) {
			totalScore = totalScore + aResult.getScore();
		}
		if((totalScore/(result.size()*5))*100 >= 60) {
			outcome = "PASS";
		}
		else {
			outcome = "FAIL";
		}
		model.addObject("totalScore", totalScore);
		model.addObject("outcome", outcome);
		return model;
	}
	
	private String getRandomVideo(List<String> videoIds) {
		if(videoIds != null && videoIds.size() > 0) {
			Random randomizer = new Random();
			String randomVideoId = videoIds.get(randomizer.nextInt(videoIds.size()));
			return randomVideoId;
		}else {
			return "";
		}
	}

}
