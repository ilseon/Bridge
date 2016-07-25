/*
 �ۼ��� - ��ȿ��
���� - ��Ʈ ��Ʈ�ѷ� ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - view�������� �̵��ϴ� ��Ʈ�ѷ� �ۼ�
 */
package com.bridge.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.DownloadVO;
import com.bridge.app.domain.LikeVO;
import com.bridge.app.domain.PlaylistVO;
import com.bridge.app.service.AlbumService;
import com.bridge.app.service.DownloadService;
import com.bridge.app.service.LikeService;
import com.bridge.app.service.MusicService;
import com.bridge.app.service.PlaylistService;



@Controller
public class ChartController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);
	
	@Inject
	private PlaylistService playlist;
	
	@Inject
	private MusicService music;
	
	@Inject
	private LikeService like;
	
	@Inject
	private DownloadService download;
	
	@Inject
	private AlbumService album;
	
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(Model view, HttpServletRequest req) throws Exception{
		logger.info("chart");
		int userNumber;
		if(WebUtils.getSessionAttribute(req, "userNumber")!=null){
			userNumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
			view.addAttribute("likeList", like.searchAll(userNumber));
		}	
		logger.info("123456");
		view.addAttribute("musicList", music.searchAll(100));
		view.addAttribute("page","main");
		return "/chart/chart_main";
	}
	
	@RequestMapping("/myalbum_modal")
	public String myalbum_modal(@RequestParam("musicnumber") int musicnumber, Model view) throws Exception{
		view.addAttribute("musicnumber", musicnumber);
		return "/chart/modal/myalbum_modal";
	}
	
	@RequestMapping(value="/myalbum", method=RequestMethod.GET)
	public String registPlaylist(@RequestParam("musicnumber") int musicnumber, HttpServletRequest req, Model view) throws Exception{
		int usernumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
		PlaylistVO plist = new PlaylistVO();
		plist.setMusicNumber(musicnumber);
		plist.setUserNumber(usernumber);
		
		playlist.regist(plist);
		
		return "redirect:/chart";
	}
	
	@RequestMapping("/download_modal")
	public String download_modal(@RequestParam("musicnumber") int musicnumber, Model view) throws Exception{
		view.addAttribute("music", music.searchMusic(musicnumber));
		return "/chart/modal/download_modal";
	}
	
	@RequestMapping("/download_modal_sev")
	public String download_modal_sev(@RequestParam("playlistAll") ArrayList<Integer> playlistAll, Model view, HttpServletRequest req) throws Exception{
		logger.info(playlistAll.get(0)+"");
		Map map = new HashMap();
		map.put("playlistAll", playlistAll);
		int usernumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
		map.put("usernumber", usernumber);
		view.addAttribute("playlistAll", download.registSeveral(map));
		//mav.addObject("playlistAll", playlistAll);
		return "/chart/modal/download_modal";
	}
	
	@RequestMapping("/download_music")
	public String downloadMusic(@RequestParam("musicnumber") int musicnumber, HttpServletRequest req, Model view) throws Exception{
		
		int usernumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
		DownloadVO dlist = new DownloadVO();
		dlist.setMusicNumber(musicnumber);
		dlist.setUserNumber(usernumber);
		
		download.registOne(dlist);
		return "redirect:/chart";
	}
	
	@RequestMapping("/download_music_sev")
	public String downloadMusicSev(List<Integer> musicnumbers, HttpServletRequest req, Model view) throws Exception{
		
		int usernumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
		DownloadVO dlist = new DownloadVO();
		dlist.setUserNumber(usernumber);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNumber", usernumber);
		map.put("musicnumbers", musicnumbers);
		
		download.registSeveral(map);
		return "/chart";
	}
	
	@RequestMapping("/like_music")
	public String likeMusic(@RequestParam("musicnumber") int musicnumber, HttpServletRequest req, Model view) throws Exception{
		int usernumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
		LikeVO lList = new LikeVO();
		lList.setMusicNumber(musicnumber);
		lList.setUserNumber(usernumber);

		like.regist(lList);
		
		return "redirect:/chart";
	}
	
	
	@RequestMapping("new_album")
	public String new_album(Model view) throws Exception{
		AlbumVO aList = new AlbumVO();
		view.addAttribute("albumList", album.searchAll(30));
		return "/album/new_album";
	}
	

}
