
package com.bridge.app.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.service.PlayerService;

@Controller
public class PlayerController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private PlayerService service;

	@RequestMapping(value = "player", method = RequestMethod.GET)
	public ModelAndView showPlayer(@RequestParam(required = false) String val) throws Exception {
		logger.info("It is playertest");
		System.out.println(val + "호출");
		MusicVO vo = new MusicVO();
		vo.setMusicNumber(Integer.parseInt(val));
		MusicVO music = service.getMusic(vo);
		String tag = "<li>여기여기" + val + "," + music.getMusicVideo() + "</li>";
		ModelAndView mav = new ModelAndView("/player/playertest");
		mav.addObject("val", tag);
		mav.addObject("music", music);
		return mav;
	}
	
	@RequestMapping(value = "player", method = RequestMethod.POST)
	public ModelAndView showPlayerTag(@RequestParam(required = false) String val) throws Exception {
		logger.info("It is playertest");
		System.out.println(val + "호출POST");
		MusicVO vo = new MusicVO();
		vo.setMusicNumber(Integer.parseInt(val));
		MusicVO music = service.getMusic(vo);
		String tag = "<li>여기여기" + val + "," + music.getMusicVideo() + "</li>";
		ModelAndView mav = new ModelAndView("/player/playertest");
		mav.addObject("val", tag);
		mav.addObject("music", music);
		return mav;
	}
}
