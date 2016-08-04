/*
 * 작성자 - 조일선
 * 내용 - 가수 정보 컨트롤러
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 
 * 변경내용 - 
 */

package com.bridge.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bridge.app.service.AlbumService;
import com.bridge.app.service.ArtistReplyService;
import com.bridge.app.service.ArtistService;
import com.bridge.app.service.MusicService;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService service;
	
	@Autowired
	private MusicService musicService;
	
	@Autowired
	private ArtistReplyService artistService;

	@Autowired
	private AlbumService albumService;
	
	@RequestMapping(value="artist_detail")
	public String artistDetail(Model model, @RequestParam int artistNumber) throws Exception{
		model.addAttribute(service.getArtistOne(artistNumber));		
		model.addAttribute("musicList", musicService.getArtistMusic(artistNumber));		
		model.addAttribute("videoList", musicService.getArtistMusicVideo(artistNumber));	
		model.addAttribute("replyCnt", artistService.countArtist(artistNumber));		
		model.addAttribute("albumList", albumService.getArtistAlbum(artistNumber));		
		model.addAttribute("page", "artist");
		return "/chart/chart_main";
	}
	

	
}