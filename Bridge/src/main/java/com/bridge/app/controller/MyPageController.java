/**
작성자 - 이주연
내용 - MyPageController
시작날짜 - 2016/07/17
수정날짜 - 2016/07/25
변경내용 - 
 */

package com.bridge.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.ArtistVO;
import com.bridge.app.domain.DownloadVO;
import com.bridge.app.domain.LikeVO;
import com.bridge.app.domain.MusicVO;
import com.bridge.app.domain.PlaylistVO;
import com.bridge.app.persistence.DownloadDAO;
import com.bridge.app.service.AlbumService;
import com.bridge.app.service.ArtistService;
import com.bridge.app.service.DownloadService;
import com.bridge.app.service.LikeService;
import com.bridge.app.service.MusicService;
import com.bridge.app.service.PlaylistService;

@Controller
public class MyPageController {

	@Inject
	private ArtistService artistservice;
	@Inject
	private AlbumService albumservice;
	@Inject
	private MusicService musicservice;
	@Inject
	private PlaylistService playservice;
	@Inject
	private LikeService likeservice;
	@Inject
	private DownloadService downservice;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String Upload(HttpServletRequest req, Model model) throws Exception {
		logger.info("업로드 시작");
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");			
		model.addAllAttributes(artistservice.selectAritst(userNumber));
		if(artistservice.selectAritst(userNumber) == null){
			return "/upload/upload_artist";
		}else{		
			return "/upload/upload_artist";
		}
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public ModelAndView Upload_Artist(HttpServletRequest req, Model model) throws Exception {

		logger.info("아티스트 등록  페이지");
		ModelAndView mav = new ModelAndView("/upload/upload_album");
		artistservice.regist(req);
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		int artistNumber = artistservice.selectAritstNumber(userNumber);
		model.addAttribute("artistNumber", artistNumber);
		logger.info("아티스트 번호"+artistNumber+"");
		return mav;
	}

	@RequestMapping(value = "upload2", method = RequestMethod.POST)
    public String Upload_Album(HttpServletRequest req) throws Exception {
          
       logger.info("앨범 등록 페이지");
       albumservice.regist(req);
       logger.info("앨범 등록 완료");
       return "/upload/upload_music";
    }
	
	@RequestMapping(value = "upload3", method = RequestMethod.POST)
	public String Upload_Music(HttpServletRequest req, @RequestParam int counter,  @RequestParam String albumName, Model model) throws Exception {

		logger.info("뮤직 등록 페이지");
		List<MusicVO> musicList = musicservice.registSeveral(req, counter, albumName);		
		//view.addAllAttributes(musicList);
		logger.info("뮤직 등록 완료");
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

	@RequestMapping(value = "artist_update", method = RequestMethod.GET)
	public String Update_artist() throws Exception {
		logger.info("아티스트 수정");
		return "/upload/artist_update";
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
	public String LikeSong(HttpServletRequest req, Model view) throws Exception {

		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		// List<LikeVO> LikeList = new ArrayList();
		// LikeList = likeservice.searchMusic(userNumber);

		List<LikeVO> like = likeservice.searchMusic(userNumber);
		view.addAllAttributes(like);
		logger.info("It is like_song");
		return "/mypage/like_song";
	}

	/* 앨범에 대한 좋아요 이동 
	 * @RequestMapping(value = "like_album") public String
	 * LikeAlbum(HttpServletRequest req, Model view) throws Exception {
	 * 
	 * int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
	 * likeservice.searchAlbum(userNumber); logger.info("It is like_album");
	 * return "/mypage/like_album"; }
	 */
		
	@RequestMapping(value = "my_album")
	public String myAlbum(HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		List<PlaylistVO> myalbum = playservice.searchAlbum(userNumber);
		view.addAllAttributes(myalbum);
		logger.info("It is myalbum");
		return "/mypage/myalbum";
	}

	@RequestMapping(value = "download")
	public String Download(HttpServletRequest req, Model view) throws Exception {
		int userNumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		List<DownloadVO> download = downservice.searchList(userNumber);
		view.addAllAttributes(download);
		logger.info("It is download");
		return "/mypage/download";
	}

	@RequestMapping(value = "payment")
	public String Payment() {

		logger.info("It is payment");
		return "/payment/payment";
	}
}