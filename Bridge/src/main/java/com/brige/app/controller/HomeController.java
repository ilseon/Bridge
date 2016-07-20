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
		view.addAttribute("page","main");
		return "/chart/chart_main";
	}

	@RequestMapping(value="test")
	public String albumDetail(Model view){
		view.addAttribute("page","album");
		return "/chart/chart_main";
	}
	
	@RequestMapping(value="test2")
	public String artistDetail(Model view){
		view.addAttribute("page","artist");
		return "/chart/chart_main";

	}
	
	@RequestMapping("chart.video")
	public String video(Model view){
		view.addAttribute("page","video");
		return "/chart/chart_main";
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

