package com.brige.app.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.brige.app.persistence.AlbumDAOImpl;



@Controller
public class HomeController {
	
	   @Inject
	   private AlbumDAOImpl test;
	   
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public String home() {
	      logger.info("It is Main");
	      test.test();
	      return "home";
	   }
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	
	@RequestMapping(value="login")
	public String loginSearch(){
		logger.info("It is loginsearch");
		return "/login/loginsearch";
	}

	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(){
		logger.info("chart");
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
	
	@RequestMapping("video")
	public String showvideo(){
		return "/video/video";
	}
	
	@RequestMapping("chart.video")
	public String video(){
		return "/chart/chart_video";
	}
	
	@RequestMapping("player")
	public String showplayer(){
		return "/player/player";
	}
	
}

