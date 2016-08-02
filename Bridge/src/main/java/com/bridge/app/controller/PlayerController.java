
package com.bridge.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.service.PlayerService;

@Controller
@SessionAttributes("val")
public class PlayerController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private PlayerService service;
	ArrayList<MusicVO> list=new ArrayList<>();
	
	int cnt=0;
	@RequestMapping(value = "player", method = RequestMethod.GET)
	public ModelAndView showPlayer(@RequestParam(required = false) String val,Model model) throws Exception {
		logger.info("It is playertest");
		System.out.println(val + "호출");
		MusicVO vo = new MusicVO();
		vo.setMusicNumber(Integer.parseInt(val));
		MusicVO music = service.getMusic(vo);
		list.add(music);
		System.out.println(list.size()+"호출횟수");
		model.addAttribute("val", val);
		String tag = "<li>여기여기" + val + "," + music.getMusicVideo() + "</li>";
		ModelAndView mav = new ModelAndView("/player/playertest");
		mav.addObject("val", tag);
		mav.addObject("music", music);
		mav.addObject("list",list);
		return mav;
	}
	

	
	@RequestMapping(value = "player", method = RequestMethod.POST)
	public ModelAndView showPlayerTag(@RequestParam(required = false) String val,Model model) throws Exception {
		logger.info("It is playertest");
		System.out.println(val + "호출POST");
		
		MusicVO vo = new MusicVO();
		vo.setMusicNumber(Integer.parseInt(val));
		MusicVO music = service.getMusic(vo);
		String tag = "<li>여기여기" + val + "," + music.getMusicVideo() + "</li>";
		model.addAttribute("id", "admin");
		ModelAndView mav = new ModelAndView("/player/playertest");
		mav.addObject("val", tag);
		mav.addObject("music", music);
		return mav;
	}
	
	@RequestMapping("delplayer")
	public void delPlayer(){
		System.out.println("awdawwdaadad");
		list.removeAll(list);
	}
}
