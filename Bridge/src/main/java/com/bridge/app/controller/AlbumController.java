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

import com.bridge.app.service.AlbumService;
 

@Controller
public class AlbumController {
	@Autowired
	private AlbumService service;

	@RequestMapping(value="album_detail")
	public String albumDetail(Model model) throws Exception{
		model.addAttribute(service.getAlbumOne());
		return "/album/album_detail";
	}	
}
