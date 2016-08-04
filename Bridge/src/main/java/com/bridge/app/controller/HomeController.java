/*
작성자 - 김민정
내용 - 메인페이지 관련 
시작날짜 - 2016/07/19
수정날짜 - 2016/08/02
변경내용 - 주석 수정
*/

package com.bridge.app.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.AlbumDAOImpl;
import com.bridge.app.service.AlbumService;
import com.bridge.app.service.LikeService;
import com.bridge.app.service.MusicService;
import com.bridge.app.controller.HomeController;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private MusicService music;
	
	@Inject
	private AlbumService album;
	
	
	//메인화면을 보여주는 메서드
	@RequestMapping(value = "/")
	public String home(Model view) throws Exception {
		logger.info("It is Main");
		
		//인기차트 10개을 보여줌
		view.addAttribute("musicList",music.searchAll(10));
	
		//최신앨범 12개을 보여줌
		AlbumVO aList = new AlbumVO();
		view.addAttribute("albumList", album.searchAll(12));
		
		return "home";
		
	}

}