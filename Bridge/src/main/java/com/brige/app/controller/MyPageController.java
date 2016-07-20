package com.brige.app.controller;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.brige.app.domain.AlbumVO;

@Controller
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public ModelAndView Upload(AlbumVO vo, HttpServletRequest request, HttpSession session) {
		logger.info("���ε��ϱ�");

		ModelAndView mav = new ModelAndView("/upload/upload_1");
		/*
		 * MultipartFile uploadImg = vo.getUploadImg(); if(uploadImg != null){
		 * try { byte [] fileData = uploadImg.getBytes(); FileOutputStream
		 * output = new FileOutputStream("E:/upload_img/images/");
		 * output.write(fileData); } catch (IOException e) {
		 * 
		 * e.printStackTrace(); } }
		 */
		return mav;
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String Upload_Add() {
		logger.info("�� �߰�");
		return "/upload/upload_2";
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