/*
 작성자 - 정효진
내용 - 차트 컨트롤러 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-22
변경내용 - view페이지로 이동하는 컨트롤러 작성
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
import com.bridge.app.domain.MusicVO;
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
	public String chart(String genre, Model view, HttpServletRequest req) throws Exception{
		logger.info("chart");
		int userNumber;
		if(WebUtils.getSessionAttribute(req, "userNumber")!=null){
			userNumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
			view.addAttribute("likeList", like.searchAll(userNumber));
		}	
		if(genre==null){
			view.addAttribute("musicList", music.searchAll(100));
		}else{
			Map map = new HashMap();
			map.put("limit", 100);
			if(genre.equals("indie")){
				logger.info(genre+"인디");
				map.put("genre", "인디");
				view.addAttribute("genre","indie");
			}else if(genre.equals("rnb")){
				map.put("genre", "알앤비");
				view.addAttribute("genre","rnb");
			}else if(genre.equals("hiphop")){
				map.put("genre", "힙합");
				view.addAttribute("genre","hiphop");
			}else if(genre.equals("el")){
				map.put("genre", "일렉트로닉");
				view.addAttribute("genre","el");
			}else if(genre.equals("rnm")){
				map.put("genre", "락/메탈");
				view.addAttribute("genre","rnm");
			}else if(genre.equals("jazz")){
				map.put("genre", "재즈");
				view.addAttribute("genre","jazz");
			}else if(genre.equals("bdp")){
				map.put("genre", "발라드/댄스/팝");
				view.addAttribute("genre","bdp");
			}
			
			view.addAttribute("musicList", music.searchGenre(map));
		}
		
		view.addAttribute("page","main");
		return "/chart/chart_main";
	}
	
	@RequestMapping("/myalbum_modal")
	public String myalbum_modal(@RequestParam("musicnumber") int musicnumber, Model view) throws Exception{
		view.addAttribute("music", music.searchMusic(musicnumber));
		return "/chart/modal/myalbum_modal";
	}
	
	@RequestMapping("/myalbum_modal_sev")
	public String myalbum_modal_sev(@RequestParam("playlistAll") List<Integer> playlistAll, Model view) throws Exception{
		HashMap map = new HashMap();
		map.put("playlistAll", playlistAll);
		List<MusicVO> music = download.search_sev(map);
		view.addAttribute("playlistAll", music);
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
	
	@RequestMapping(value="/myalbum_sev", method=RequestMethod.GET)
	public String registPlaylist_sev(@RequestParam("playlistall") String playlistall, HttpServletRequest req, Model view) throws Exception{
		int usernumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
		Map plist = new HashMap();
		plist.put("userNumber", usernumber);
		List<Integer> playListAll = new ArrayList();
		String[] play = playlistall.split(",");
		for(int i=1;i<play.length;i++){
			playListAll.add(Integer.parseInt(play[i]));
		}
		
		plist.put("playListAll", playListAll);
		
		playlist.registAll(plist);
		return "redirect:/chart";
	}
	
	@RequestMapping("/download_modal")
	public String download_modal(@RequestParam("musicnumber") int musicnumber, Model view) throws Exception{
		view.addAttribute("music", music.searchMusic(musicnumber));
		return "/chart/modal/download_modal";
	}
	
	@RequestMapping("/download_modal_sev")
	public ModelAndView download_modal_sev(@RequestParam("playlistAll") List<Integer> playlistAll, HttpServletRequest req) throws Exception{
		HashMap map = new HashMap();
		map.put("playlistAll", playlistAll);
		List<MusicVO> music = download.search_sev(map);
		ModelAndView view = new ModelAndView("/chart/modal/download_modal");
		view.addObject("playlistAll", music);
		return view;
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
	public String downloadMusicSev(String musicnumbers, HttpServletRequest req, Model view) throws Exception{
		
		int usernumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
		Map dlist = new HashMap();
		dlist.put("userNumber", usernumber);
		List<Integer> playListAll = new ArrayList();
		String[] play = musicnumbers.split(",");
		for(int i=1;i<play.length;i++){
			playListAll.add(Integer.parseInt(play[i]));
		}
		
		dlist.put("playListAll", playListAll);

		download.registSeveral(dlist);
		view.addAttribute("download_now", "download_now");
		view.addAttribute("download_list", playListAll);
		return "redirect:/chart";
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
	
	@RequestMapping("/like_music_cancel")
	public String likeMusicCancel(@RequestParam("musicnumber") int musicnumber, HttpServletRequest req, Model view) throws Exception{
		int usernumber = Integer.parseInt((String)WebUtils.getSessionAttribute(req, "userNumber"));
		LikeVO lList = new LikeVO();
		lList.setMusicNumber(musicnumber);
		lList.setUserNumber(usernumber);

		like.remove(lList);
		
		return "redirect:/chart";
	}
	
	
	@RequestMapping("new_album")
	public String new_album(Model view) throws Exception{
		AlbumVO aList = new AlbumVO();
		view.addAttribute("albumList", album.searchAll(30));
		return "/album/new_album";
	}
	
	@RequestMapping("/chart_genre")
	public String music_genre(String genre, Model view) throws Exception{
		Map map = new HashMap();
		map.put("limit", 100);
		if(genre.equals("indie")){
			map.put("genre", "인디");
			view.addAttribute("genre","indie");
		}else if(genre.equals("rnb")){
			map.put("genre", "알앤비");
			view.addAttribute("genre","rnb");
		}else if(genre.equals("hiphop")){
			map.put("genre", "힙합");
			view.addAttribute("genre","hiphop");
		}else if(genre.equals("el")){
			map.put("genre", "일렉트로닉");
			view.addAttribute("genre","el");
		}else if(genre.equals("rnm")){
			map.put("genre", "락/메탈");
			view.addAttribute("genre","rnm");
		}else if(genre.equals("jazz")){
			map.put("genre", "재즈");
			view.addAttribute("genre","jazz");
		}else if(genre.equals("bdp")){
			map.put("genre", "발라드/댄스/팝");
			view.addAttribute("genre","bdp");
		}
		
		view.addAttribute("musicList", music.searchGenre(map));
		return "redirect:/chart";
	}
	
	@RequestMapping("/pay_modal")
	public String pay_success(List<Integer> musicnumbers, Model view) throws Exception{
		view.addAttribute("musicnumbers", musicnumbers);
		return "/chart/modal/pay_modal";
	}
	
	@RequestMapping("/player")
	public String showPlayer() throws Exception{	
		return "/player/playertest";
	}
	

}