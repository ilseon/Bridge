

package com.bridge.app.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.AlbumDAOImpl;
import com.bridge.app.service.LikeService;
import com.bridge.app.service.MusicService;

@Controller
public class HomeController {
		@Inject
		private MusicService music;
		
		@Inject
		private LikeService like;
	
	   @Inject
	   private AlbumDAOImpl test;
	   
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public String home() {
	      logger.info("It is Main");
	      //test.test();
	      return "home";
	   }
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	
	@RequestMapping(value="login")
	public String loginSearch(){
		logger.info("It is loginsearch");
		return "/login/loginsearch";
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
	
	@RequestMapping("video")
	public String showvideo(){
		return "/video/video";
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
		
}

