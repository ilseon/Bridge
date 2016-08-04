
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
import com.bridge.app.service.MusicService;
import com.bridge.app.service.PlayerService;

@Controller
@SessionAttributes("val")
public class PlayerController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private PlayerService service;
	@Autowired
	private MusicService player;
	ArrayList<MusicVO> list=new ArrayList<>();
	
	int cnt=0;
	@RequestMapping(value = "player", method = RequestMethod.GET)
	public ModelAndView showPlayer(@RequestParam(required = false) String val,Model model) throws Exception {
		logger.info("It is playertest");
		System.out.println(val + "호출");
		MusicVO vo = new MusicVO();
		vo.setMusicNumber(Integer.parseInt(val));
		MusicVO music = service.getMusic(vo);
		System.out.println(val+"값");
		player.play_update(vo.getMusicNumber());
		list.add(music);
		System.out.println(list.size()+"호출횟수");
		model.addAttribute("val", val);
		ModelAndView mav = new ModelAndView("/player/playertest");
		mav.addObject("music", music);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value = "playerAll", method = RequestMethod.GET)
	public ModelAndView showMuliPlayer(@RequestParam(required = false) List<Integer> playlistAll) throws Exception{

		MusicVO vo = new MusicVO();
		System.out.println(playlistAll.size()+"크기");
		ModelAndView mav = new ModelAndView("/player/playertest");
		for(int i=0;i<playlistAll.size();i++){
		vo.setMusicNumber(playlistAll.get(i).intValue());
		list.add(service.getMusic(vo));
		player.play_update(playlistAll.get(i).intValue());

		System.out.println(list.get(i).getMusicVideo());
		System.out.println(list.size()+"크기");
		}	
		mav.addObject("list",list);
		return mav;	
	}	

	@RequestMapping("delplayer" )
	public void delPlayer(){
		list.removeAll(list);
	}
	
	@RequestMapping(value = "delplayermulti",method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView delPlayerMulti(@RequestParam(required = false) List<Integer> playAll){
		MusicVO vo = new MusicVO();
		//System.out.println(playAll.size()+"삭제크디");
		//System.out.println(playAll.get(0).intValue()+"삭제넘버");
		ModelAndView mav = new ModelAndView("/player/playertest");
		for(int i=0;i<playAll.size();i++){
			
		list.remove(playAll.get(i).intValue());

		}	
		mav.addObject("list",list);
		return mav;	
	}
}
