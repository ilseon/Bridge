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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bridge.app.domain.ArtistReplyVO;
import com.bridge.app.service.ArtistReplyService;
import com.bridge.app.service.ArtistService;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService service;

	@RequestMapping(value="artist_detail")
	public String artistDetail(Model model) throws Exception{
		model.addAttribute(service.getArtistOne());
		return "/artist/artist_detail";
	}
	

	
}
