package com.woo.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	
	@RequestMapping(value="video")
	public String showVideo(){
		return "/video/video";

	}
	
	@RequestMapping(value="chart.video")
	public String showChartVideo(){
		return "/chart/chart_video";

	}
		
	@RequestMapping(value="player")
	public String showplayer(){
		return "/player/player";

	}
		


	
}
