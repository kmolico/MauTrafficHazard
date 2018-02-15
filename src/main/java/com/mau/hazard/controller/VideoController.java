package com.mau.hazard.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mau.hazard.model.Video;
import com.mau.hazard.service.VideoService;



@Controller
@SessionAttributes({"video"})
public class VideoController {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	Video video;
	
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

}
