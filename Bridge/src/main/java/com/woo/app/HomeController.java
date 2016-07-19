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



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="test")
	public String albumDetail(){
		return "/album/album_detail";
	}
	
	@RequestMapping(value="test2")
	public String artistDetail(){
		return "/artist/artist_detail";
	}
	
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(){
		logger.info("chart");
		return "/chart/chart_main";
	}
	
	@RequestMapping(value="/chart", method=RequestMethod.POST)
	public String chart_genre(){
		return "/chart/chart_main";
	}
	
}


