/**
작성자 - 이주연
내용 - MyPageController
시작날짜 - 2016/07/17
수정날짜 - 2016/07/25
변경내용 - 
 */

package com.bridge.app.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bridge.app.service.AlbumService;
import com.bridge.app.service.ArtistService;
import com.bridge.app.service.MusicService;

@Controller
public class MyPageController {
	
	@Inject
	private ArtistService artistservice;
	@Inject
	private AlbumService albumservice;
	@Inject
	private MusicService musicservice;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String Upload() throws Exception {
		logger.info("업로드 시작");
		return "/upload/upload_artist";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String Upload_Artist(HttpServletRequest req) throws Exception {

		logger.info("아티스트 등록");
		//artistservice.regist(req);
		return "/upload/upload_album";		
	}
	@RequestMapping(value = "upload2", method = RequestMethod.POST)
	public String Upload_Album() throws Exception {

	logger.info("앨범 등록");
	return "/upload/upload_music";
	}
	
	@RequestMapping(value = "upload3", method = RequestMethod.POST)
	public String Upload_Music(HttpServletRequest req) throws Exception {

	logger.info("뮤직등록");

	albumservice.regist(req);
	musicservice.regist(req);
	return "/upload/mytrack";
	}
	
	
	@RequestMapping(value = "mytrack", method = RequestMethod.GET)
	public String MyTrack_() {
		logger.info("It is mytrack");
		return "/upload/mytrack";
	}

	@RequestMapping(value = "mytrack_detail")
	public String MyTrack_Detail() {

		logger.info("It is mytrack_datail");
		return "/upload/mytrack_detail";
	}

	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String PassWordConfirm() {

		logger.info("It is password_check");
		return "/modify/password_check";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String Modify() {

		logger.info("It is modify");
		return "/modify/modify";
	}

	@RequestMapping(value = "withdrawal", method = RequestMethod.GET)
	public String PassWordWithdrawal() {

		logger.info("It is password_check2");
		return "/modify/password_check2";
	}

	@RequestMapping(value = "withdrawal", method = RequestMethod.POST)
	public String Withdrawal() {
		logger.info("It is withdrawal");
		return "/modify/withdrawal";
	}

	@RequestMapping(value = "confirm")
	public String Confirm() {

		logger.info("It is confirm");
		return "/modify/confirm";
	}

	@RequestMapping(value = "like_song")
	public String LikeSong() {

		logger.info("It is like_song");
		return "/mypage/like_song";
	}

	@RequestMapping(value = "like_album")
	public String LikeAlbum() {

		logger.info("It is like_album");
		return "/mypage/like_album";
	}

	@RequestMapping(value = "myalbum")
	public String Myalbum() {

		logger.info("It is myalbum");
		return "/mypage/myalbum";
	}

	@RequestMapping(value = "download")
	public String Download() {

		logger.info("It is download");
		return "/mypage/download";
	}

	@RequestMapping(value = "payment")
	public String Payment() {

		logger.info("It is payment");
		return "/payment/payment";
	}
}