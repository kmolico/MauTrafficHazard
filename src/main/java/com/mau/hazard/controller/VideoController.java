package com.mau.hazard.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class VideoController {
	
	@RequestMapping(value = "/{id}/tutorial", method = RequestMethod.GET)
	@ResponseBody public FileSystemResource getPreview3(@PathVariable("id") String id, HttpServletResponse response) {
	    //String path = repositoryService.findVideoLocationById(id);
	    return new FileSystemResource("C:\\Hazards\\Hazards_"+id+".mp4");
	}
	//17060012
	//10020003

}
