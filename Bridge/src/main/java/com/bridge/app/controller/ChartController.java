package com.bridge.app.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.PlaylistVO;
import com.bridge.app.service.PlaylistService;


@Controller
public class ChartController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);
	
	@Inject
	private PlaylistService playlist;
	
	@RequestMapping(value="/myalbum", method=RequestMethod.GET)
	public String registPlaylist(@RequestParam int musicnumber, HttpServletRequest req, Model view) throws Exception{
		int usernumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
		PlaylistVO plist = new PlaylistVO();
		plist.setMusicNumber(musicnumber);
		plist.setUserNumber(usernumber);
		
		playlist.regist(plist);
		view.addAttribute("page","main");
		return "/chart/chart_main";
	}
}
