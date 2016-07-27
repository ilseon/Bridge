/*
 �ۼ��� - ��ȿ��
���� - ��Ʈ ��Ʈ�ѷ� ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - view�������� �̵��ϴ� ��Ʈ�ѷ� �ۼ�
 */
package com.bridge.app.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
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
		int usernumber;
		if(WebUtils.getSessionAttribute(req, "usernumber")!=null){
			usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
			view.addAttribute("likeList", like.searchAll(usernumber));
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
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		PlaylistVO plist = new PlaylistVO();
		plist.setMusicNumber(musicnumber);
		plist.setUserNumber(usernumber);
		
		playlist.regist(plist);
		
		return "redirect:/chart";
	}
	
	@RequestMapping(value="/myalbum_sev", method=RequestMethod.GET)
	public String registPlaylist_sev(@RequestParam("playlistall") String playlistall, HttpServletRequest req, Model view) throws Exception{
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		Map plist = new HashMap();
		plist.put("usernumber", usernumber);
		List<Integer> playListAll = new ArrayList();
		String[] play = playlistall.split(",");
		for(int i=1;i<play.length;i++){
			playListAll.add(Integer.parseInt(play[i]));
		}
		
		plist.put("playListAll", playListAll);
		
		playlist.registAll(plist);
		return "redirect:/chart";
	}
	
	public String real_path(HttpServletRequest req){
		String realpath=null;
		String folderPath =req.getSession().getServletContext().getRealPath("/upload/music/");
		
		realpath=folderPath+"\\";
		/*String[] paths=folderPath.split("\\");
		for(int i =0;i<paths.length;i++){//javascript 내에서도 활용할 수 있도록 절대 경로 변경.
			logger.info(paths[i]+i+"번째");
			realpath+=paths[i]+"/";
		}
		logger.info(realpath+"real_path메서드");*/
		return realpath;
	}
	
	@RequestMapping("/download_modal")
	public String download_modal(@RequestParam("musicnumber") int musicnumber, Model view, HttpServletRequest req) throws Exception{
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		Map download_check = new HashMap();//이전에 다운받은 기록이 있는지 체크.
		download_check.put("userNumber", usernumber);
		
		List<Integer> musicnumbers = new ArrayList();
		musicnumbers.add(musicnumber);
		download_check.put("musicNumbers", musicnumbers);
		
		List<Integer> already = download.music_already(download_check);
		
		MusicVO music_check = music.searchMusic(musicnumber);
		
		if(already.isEmpty()){		
			view.addAttribute("music", music_check);
			return "/chart/modal/download_modal";
		}else{
			List<String> musicfiles = new ArrayList();
			musicfiles.add(music_check.getMusicFile());
			req.setAttribute("musicfiles", musicfiles);

			req.setAttribute("realpath", real_path(req));
			return "/chart/modal/download_all";
		}
	}
	
	@RequestMapping("/download_modal_sev")
	public ModelAndView download_modal_sev(@RequestParam("playlistAll") List<Integer> playlistAll, HttpServletRequest req) throws Exception{
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		Map download_check = new HashMap();//이전에 다운받은 기록이 있는지 체크.
		download_check.put("userNumber", usernumber);
	
		download_check.put("musicNumbers", playlistAll);
		
		List<Integer> already = download.music_already(download_check);
		
		//MusicVO music_check = music.searchMusic(musicnumber);
		
		if(already.isEmpty()){
			HashMap map = new HashMap();
			map.put("playlistAll", playlistAll);
			List<MusicVO> music = download.search_sev(map);
			ModelAndView view = new ModelAndView("/chart/modal/download_modal");
			view.addObject("playlistAll", music);
			return view;
		}else{
			/*List<String> musicfiles = new ArrayList();
			musicfiles.add(music_check.getMusicFile());
			req.setAttribute("musicfiles", musicfiles);*/

			req.setAttribute("realpath", real_path(req));
			ModelAndView view = new ModelAndView("/chart/modal/download_all");
			return view;
		}
		
	}
	
	@RequestMapping("/download_music")
	public String downloadMusic(@RequestParam("musicnumber") int musicnumber, HttpServletRequest req, Model view) throws Exception{
		
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		
		/*Map download_check = new HashMap();//이전에 다운받은 기록이 있는지 체크.
		download_check.put("userNumber", usernumber);*/
		
		Map musicnumbers = new HashMap();
		List<Integer> music_n = new ArrayList();
		music_n.add(musicnumber);
		musicnumbers.put("musicnumbers", music_n);
		logger.info("11");
		/*download_check.put("musicNumbers", musicnumbers);
		
		List<Integer> already = download.music_already(download_check);*/
		
		DownloadVO dlist = new DownloadVO();//받은 값을 VO에 넣는다.
		dlist.setMusicNumber(musicnumber);
		dlist.setUserNumber(usernumber);
		
		//if(already.isEmpty()){//이전에 다운로드 받은 기록이 있으면 새롭게 download관련 필드를 update하지 않도록 조건 설정.
			download.registOne(dlist);
			logger.info("22");
			music.download_update(musicnumbers);
			logger.info("33");
		//}
		
		MusicVO vo = music.searchMusic(musicnumber);//음원의 실제 파일 정보 받아오기.
		List<String> musicfiles = new ArrayList();
		musicfiles.add(vo.getMusicFile());
		req.setAttribute("musicfiles", musicfiles);
		
		String realpath=real_path(req);
		
		req.setAttribute("realpath", realpath);
		
		view.addAttribute("music", vo);
		
		return "/chart/modal/pay_success";
	}
	
	@RequestMapping("/download_music_sev")
	public String downloadMusicSev(String musicnumbers, HttpServletRequest req, Model view) throws Exception{
		
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		
		Map dlist = new HashMap();
		dlist.put("usernumber", usernumber);
		
		List<Integer> playListAll = new ArrayList();
		List<Integer> new_download = new ArrayList();
		String[] play = musicnumbers.split(",");
		for(int i=1;i<play.length;i++){
			playListAll.add(Integer.parseInt(play[i]));
			new_download.add(Integer.parseInt(play[i]));
			logger.info(play[i]+"downloadmusicsev");
		}
		
		Map download_check = new HashMap();//이전에 다운받은 기록이 있는지 체크.
		download_check.put("userNumber", usernumber);
		
		download_check.put("musicNumbers", playListAll);
		
		List<Integer> already = download.music_already(download_check);
		
		if(!already.isEmpty()){
			for(int i=0;i<already.size();i++){
				new_download.remove(already.get(i));
			}
			dlist.put("playlistAll", new_download);
			Map musicnumbers_update = new HashMap();
			musicnumbers_update.put("musicnumbers", new_download);
			
			download.registSeveral(dlist);
			music.download_update(musicnumbers_update);
			dlist.remove("playlistAll");
			
		}
		
		dlist.put("playlistAll", playListAll);
		
		String folderPath =req.getSession().getServletContext().getRealPath("/upload/music/");
		logger.info(folderPath);
		String realpath=null;
		realpath=folderPath+"\\";
		
		req.setAttribute("realpath", realpath);

		
		
		List<MusicVO> vo = download.search_sev(dlist);
		
		List<String> musicfiles = new ArrayList<String>();
		for(int i=0;i<vo.size();i++){
			musicfiles.add(vo.get(i).getMusicFile());
		}
		logger.info(musicfiles.get(0)+"musicfile");
		req.setAttribute("musicfiles", musicfiles);
		
		view.addAttribute("download_list", vo);
		return "/chart/modal/pay_success";
	}
	
	@RequestMapping("/like_music")
	public String likeMusic(@RequestParam("musicnumber") int musicnumber, HttpServletRequest req, Model view) throws Exception{
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		LikeVO lList = new LikeVO();
		lList.setMusicNumber(musicnumber);
		lList.setUserNumber(usernumber);

		like.regist(lList);
		
		return "redirect:/chart";
	}
	
	@RequestMapping("/like_music_cancel")
	public String likeMusicCancel(@RequestParam("musicnumber") int musicnumber, HttpServletRequest req, Model view) throws Exception{
		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
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
	
	@RequestMapping("/pay_modal")
	public String pay_success(List<Integer> musicnumbers, Model view) throws Exception{
		view.addAttribute("musicnumbers", musicnumbers);
		return "/chart/modal/pay_modal";
	}
	
	@RequestMapping("/download_all")
	public String download_file(@RequestParam("musicfiles") String musicfile, @RequestParam("realpath") String realpath, HttpServletRequest req){
		String music_f = musicfile.replace("[","");
		music_f=music_f.replace("]", "");
		String[] music_f_name=music_f.split(",");
		List<String> musicfiles = new ArrayList();
		for(int i=0;i<music_f_name.length;i++){
			musicfiles.add(music_f_name[i].trim());
			logger.info(music_f_name+"download_all");
		}
		req.setAttribute("musicfiles", musicfiles);
		req.setAttribute("realpath", realpath);
		return "/chart/modal/download_all";
	}
	

}
