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
		logger.info("���ε� ������");
		return "uplaod/upload_1";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String Upload_Album(AlbumVO vo, HttpServletRequest request) throws Exception {
		logger.info("�ٹ� ���ε�");
		service.AlbumInsert(vo, request);	
		return "/upload/upload_2";
	}

	@RequestMapping(value = "upload2", method = RequestMethod.GET)
	public String Upload_Music(AlbumVO vo,  Model model) throws Exception {
		logger.info("���� ���ε� ������");	
		return "uplaod/upload_2";
	}

	@RequestMapping(value = "upload2", method = RequestMethod.POST)
	public String Upload_Add() {
		logger.info("���� ���ε�");
		return "/upload/mytrack";
	}
	
	@RequestMapping(value = "mytrack", method = RequestMethod.GET)
	public String MyTrack_() {
		logger.info("��Ʈ��");
		return "/upload/mytrack";
	}

	@RequestMapping(value = "mytrack_detail")
	public String MyTrack_Detail() {
		logger.info("��Ʈ��_�󼼺���");
		return "/upload/mytrack_detail";
	}

	@RequestMapping(value = "upload_artist")
	public String Upload_Artist() {
		logger.info("��Ƽ��Ʈ ���");
		return "/upload/upload_artist";
	}

	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String PassWordConfirm() {
		logger.info("��������_��й�ȣ Ȯ��");
		return "/modify/password_check";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String Modify() {
		logger.info("������������");
		return "/modify/modify";
	}

	@RequestMapping(value = "withdrawal", method = RequestMethod.GET)
	public String PassWordWithdrawal() {
		logger.info("Ż��_��й�ȣ Ȯ��");
		return "/modify/password_check2";
	}

	@RequestMapping(value = "withdrawal", method = RequestMethod.POST)
	public String Withdrawal() {
		logger.info("ȸ��Ż��");
		return "/modify/withdrawal";
	}

	@RequestMapping(value = "confirm")
	public String Confirm() {
		logger.info("ȸ��Ż����");
		return "/modify/confirm";
	}

	@RequestMapping(value = "like_song")
	public String LikeSong() {
		logger.info("�����ϴ� ��");
		return "/mypage/like_song";
	}

	@RequestMapping(value = "like_album")
	public String LikeAlbum() {
		logger.info("�����ϴ� �ٹ�");
		return "/mypage/like_album";
	}

	@RequestMapping(value = "myalbum")
	public String Myalbum() {
		logger.info("���ٹ�");
		return "/mypage/myalbum";
	}

	@RequestMapping(value = "download")
	public String Download() {
		logger.info("�ٿ�ε���");
		return "/mypage/download";
	}

	@RequestMapping(value = "payment")
	public String Payment() {
		logger.info("��������");
		return "/payment/payment";
	}
}