package com.bridge.app.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bridge.app.service.AlbumService;
import com.bridge.app.domain.AlbumVO;

@Controller
public class MyPageController {

	@Inject
	private AlbumService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);	
	
	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String Upload() throws Exception {
		logger.info("업로드 페이지");
		return "uplaod/upload_1";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String Upload_Album(AlbumVO vo, HttpServletRequest request) throws Exception {
		logger.info("앨범 업로드");
		service.AlbumInsert(vo, request);	
		return "/upload/upload_2";
	}

	@RequestMapping(value = "upload2", method = RequestMethod.GET)
	public String Upload_Music(AlbumVO vo,  Model model) throws Exception {
		logger.info("음원 업로드 페이지");	
		return "uplaod/upload_2";
	}

	@RequestMapping(value = "upload2", method = RequestMethod.POST)
	public String Upload_Add() {
		logger.info("음원 업로드");
		return "/upload/mytrack";
	}
	
	@RequestMapping(value = "mytrack", method = RequestMethod.GET)
	public String MyTrack_() {
		logger.info("내트랙");
		return "/upload/mytrack";
	}

	@RequestMapping(value = "mytrack_detail")
	public String MyTrack_Detail() {
		logger.info("내트랙_상세보기");
		return "/upload/mytrack_detail";
	}

	@RequestMapping(value = "upload_artist")
	public String Upload_Artist() {
		logger.info("아티스트 등록");
		return "/upload/upload_artist";
	}

	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String PassWordConfirm() {
		logger.info("정보수정_비밀번호 확인");
		return "/modify/password_check";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String Modify() {
		logger.info("개인정보수정");
		return "/modify/modify";
	}

	@RequestMapping(value = "withdrawal", method = RequestMethod.GET)
	public String PassWordWithdrawal() {
		logger.info("탈퇴_비밀번호 확인");
		return "/modify/password_check2";
	}

	@RequestMapping(value = "withdrawal", method = RequestMethod.POST)
	public String Withdrawal() {
		logger.info("회원탈퇴");
		return "/modify/withdrawal";
	}

	@RequestMapping(value = "confirm")
	public String Confirm() {
		logger.info("회원탈퇴동의");
		return "/modify/confirm";
	}

	@RequestMapping(value = "like_song")
	public String LikeSong() {
		logger.info("좋아하는 곡");
		return "/mypage/like_song";
	}

	@RequestMapping(value = "like_album")
	public String LikeAlbum() {
		logger.info("좋아하는 앨범");
		return "/mypage/like_album";
	}

	@RequestMapping(value = "myalbum")
	public String Myalbum() {
		logger.info("내앨범");
		return "/mypage/myalbum";
	}

	@RequestMapping(value = "download")
	public String Download() {
		logger.info("다운로드함");
		return "/mypage/download";
	}

	@RequestMapping(value = "payment")
	public String Payment() {
		logger.info("결제내역");
		return "/payment/payment";
	}
}