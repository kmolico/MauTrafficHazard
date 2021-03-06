package com.mau.hazard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/admin/videos", method = RequestMethod.GET)
	public String showAllUsers(Model model) {

		logger.debug("showAllVideos()");
		//model.addAttribute("users", userService.findAll());
		return "admin/listVideos";

	}
	
	@RequestMapping(value = "/admin/videos/add", method = RequestMethod.GET)
	public String addVideo(Model model) {

		logger.debug("addVideo()");
		//model.addAttribute("users", userService.findAll());
		return "admin/addVideo";

	}

}
