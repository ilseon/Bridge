
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

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.AlbumDAOImpl;
import com.bridge.app.service.AlbumService;
import com.bridge.app.service.LikeService;
import com.bridge.app.service.MusicService;
import com.bridge.app.controller.HomeController;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private MusicService music;
	
	@Inject
	private AlbumService album;

	@RequestMapping(value = "/")
	public String home(Model view) throws Exception {
		logger.info("It is Main");
		
		view.addAttribute("musicList",music.searchAll(10));
	
		
		AlbumVO aList = new AlbumVO();
		view.addAttribute("albumList", album.searchAll(12));
		
		return "home";
	}

}
