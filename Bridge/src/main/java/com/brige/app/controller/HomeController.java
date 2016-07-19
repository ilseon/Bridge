package com.brige.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("It is Main");
		return "home";
	}
	
	@RequestMapping(value="login")
	public String loginSearch(){
		logger.info("It is loginsearch");
		return "/login/loginsearch";
	}

	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(Model view){
		logger.info("chart");
		view.addAttribute("page","/WEB-INF/views/chart/chart_now.jsp");
		return "/chart/chart_main";
	}

	@RequestMapping(value="test")
	public String albumDetail(){
		return "/album/album_detail";
	}
	
	@RequestMapping(value="test2")
	public String artistDetail(){
		return "/artist/artist_detail";

	}
	
	@RequestMapping("chart.video")
	public String video(){
		return "/chart/chart_video";
	}
	
	@RequestMapping("player")
	public String showplayer(){
		return "/player/player";
	}
	
	@RequestMapping("new_album")
	public String new_album(){
		return "/album/new_album";
	}
	
}

