/*
 * 작성자 - 조일선
 * 내용 - 가수 정보 컨트롤러
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 
 * 변경내용 - 
 */

package com.bridge.app.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import com.bridge.app.service.AlbumReplyService;
import com.bridge.app.service.AlbumService;
import com.bridge.app.service.LikeService;
import com.bridge.app.service.MusicService;
 

@Controller
public class AlbumController {
	@Autowired
	private AlbumService service;
	
	@Autowired
	private MusicService musicService;
	
	@Autowired
	private AlbumReplyService replyService;
	
	@Autowired
	private LikeService likeService;

	@RequestMapping(value="album_detail")
	public String albumDetail(Model model, @RequestParam int albumNumber, HttpServletRequest req) throws Exception{
		model.addAttribute(service.getAlbumOne(albumNumber));
		model.addAttribute("musicList", musicService.getAlbumMusic(albumNumber));		
		model.addAttribute("videoList", musicService.getAlbumMusicVideo(albumNumber));		
		model.addAttribute("replyCnt", replyService.countAlbum(albumNumber));
		
		 if(WebUtils.getSessionAttribute(req, "usernumber")!=null){
	         int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
	         model.addAttribute("likeList", likeService.searchAll(usernumber));
	      }   
		model.addAttribute("page", "album");
		return "/chart/chart_main";
		}	
}