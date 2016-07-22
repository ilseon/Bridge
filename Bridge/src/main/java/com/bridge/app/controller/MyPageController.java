package com.bridge.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bridge.app.service.AlbumService;
import com.bridge.app.service.ArtistService;
import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.ArtistVO;

@Controller
public class MyPageController {

	@Inject
	private AlbumService albumservice;

	@Inject
	private ArtistService artistservice;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String Upload() throws Exception {
		logger.info("It is upoad");
		return "/upload/upload_1";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String Upload_Album(AlbumVO album, ArtistVO artist) throws Exception {
		logger.info("It is upoad_album");
		// Map<AlbumVO, ArtistVO> album_artist = new HashMap<AlbumVO,
		// ArtistVO>();
		logger.info(artist.getArtistname() + "," + artist.getArtistnumber() + "," + artist.getArtistgenre() + ","
				+ artist.getArtisttype() + "," + artist.getUsernumber());
		artistservice.ArtistInsert(artist);
		albumservice.AlbumInsert(album);

		return "/upload/upload_2";
	}

	@RequestMapping(value = "upload2", method = RequestMethod.GET)
	public String Upload_Music(AlbumVO vo) throws Exception {

		logger.info("It is upoad_2");
		return "/upload/upload_2";
	}

	@RequestMapping(value = "upload2", method = RequestMethod.POST)
	public String Upload_Add() {
		logger.info("It is upoad_music");
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

	@RequestMapping(value = "upload_artist")
	public String Upload_Artist() {

		logger.info("It is artist_regist");
		return "/upload/upload_artist";
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