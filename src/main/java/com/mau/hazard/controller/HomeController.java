package com.mau.hazard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mau.hazard.model.Feedback;
import com.mau.hazard.model.User;
import com.mau.hazard.service.FeedbackService;
import com.mau.hazard.service.VideoService;
import com.mau.hazard.validator.FeedbackFormValidator;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({"attempt"})
public class HomeController {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private FeedbackService feedbackService;
	
	@Autowired
	FeedbackFormValidator feedbackFormValidator;

	//Set a form validator
	@InitBinder("feedbackForm")
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(feedbackFormValidator);
	}
	
	@ModelAttribute("attempt")
	public int getAttempt(){
	    return 0;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		model.addAttribute("greeting", "Hi, Welcome to mysites");
		return "welcome";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "admin/adminHome";
	}
	
	@RequestMapping(value = "/db", method = RequestMethod.GET)
	public String dbaPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "dba";
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
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
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView test() {
		//List<Video> videos = videoService.getTestVideoList();	
		int attempt = videoService.getAttempt();
		int remainingVideos = videoService.getCountRemainigVideos(attempt);
		ModelAndView model = new ModelAndView("test");
		model.addObject("attempt", attempt);
		model.addObject("videoCount", remainingVideos);
		model.addObject("user", getPrincipal());
		return model;
	}
	
	@RequestMapping(value = "/feedback", method = RequestMethod.GET)
	public String loadFeedback(Model model) {
		logger.debug("loadFeedback()");

		Feedback feedback = new Feedback();

		model.addAttribute("feedbackForm", feedback);
		return "feedback";
	}
	
	@RequestMapping(value = "/feedback/save	", method = RequestMethod.POST)
	public String saveFeedback(@ModelAttribute("feedbackForm") @Validated Feedback feedback, BindingResult result) {
		
		if (result.hasErrors()) {
			return "feedback";
		} else {
			feedbackService.saveFeedback(feedback);
			return "redirect:/";
		}
	}
	
}
