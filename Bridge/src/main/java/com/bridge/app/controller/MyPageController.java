package com.bridge.app.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bridge.app.service.AlbumService;
import com.bridge.app.service.ArtistService;
import com.bridge.app.service.MusicService;
import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.ArtistVO;
import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.FileUpload;

@Controller
public class MyPageController {
	@Inject
	private FileUpload upload;
	@Inject
	private AlbumService albumservice;
	@Inject
	private ArtistService artistservice;
	@Inject
	private MusicService musicservice;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String Upload() throws Exception {
		logger.info("It is upload_artist");
		return "/upload/upload_artist";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public ModelAndView Upload_Artist(/* @RequestParam("artistImg") MultipartFile file,*/ @ModelAttribute ArtistVO artist, Model model) throws Exception {

		logger.info("현재 페이지는 It is upload_artist");
		logger.info(artist.toString());
		/*
		        String filename = file.getOriginalFilename();
		        //실제 파일을 업로드하기 위한 파일 객체 생성
		        File f = new File("c:\\upload\\"+"_"+filename);
		        //한번에 한해서 동일한 파일이 존재하면 이름에 (1) ,
		        //(나중에)2번째에도 검사해서 이름을 편해보고, 확장자 앞에 다른 이름을 추가하도록 해보자 
		        if(f.exists()){
		            f = new File("c:\\upload\\"+"_"+filename+"(1)");
		        }        	    
		        try {
		            file.transferTo(f);
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		
		 * MultipartFile file = multipartRequest.getFile("artistImg"); String
		 * fileName = file.getOriginalFilename(); Calendar cal =
		 * Calendar.getInstance(); String filetype =
		 * fileName.substring(fileName.lastIndexOf("."),fileName.length());
		 * String replaceName = cal.getTimeInMillis()+filetype;
		 * 
		 * String path = "/Bridge/src/main/webapp/resources/upload";
		 * 
		 * upload.fileUpload(file, httpSession);
		 */
		ModelAndView mav =new ModelAndView("/upload/upload_album");
		artistservice.ArtistInsert(artist);
		return mav;
	}

	@RequestMapping(value = "upload2", method = RequestMethod.POST)
	public ModelAndView Upload_Album(@ModelAttribute AlbumVO album, @ModelAttribute ArtistVO artist) throws Exception {

		logger.info("현재 페이지는 It is upoad_album");
		logger.info("아티스트 값 : " + artist.toString());
		logger.info("앨범 값 : " + album.toString());

		ModelAndView mav = new ModelAndView("/upload/upload_music");
		return mav;
	}

	@RequestMapping(value = "upload3", method = RequestMethod.POST)
	public ModelAndView Upload_Music(@ModelAttribute AlbumVO album, @ModelAttribute ArtistVO artist,
			@ModelAttribute MusicVO music) throws Exception {

		logger.info("현재 페이지는 It is upoad_music");
		logger.info("아티스트 값 : " + artist.toString());
		logger.info("앨범 값 : " + album.toString());

		ModelAndView mav = new ModelAndView("/upload/mytrack");

		/*
		 * AlbumVO album = new AlbumVO();
		 * album.setAlbumName((String)request.getAttribute("albumName"));
		 * album.setAlbumType((String)request.getAttribute("albumType"));
		 * album.setAlbumDate((String)request.getAttribute("albumDate"));
		 * album.setArtistNumber(Integer.parseInt((String)
		 * request.getAttribute("ArtistNumber")));
		 * album.setAlbumImg((String)request.getAttribute("albumDate"));
		 * album.setAlbumContent((String)request.getAttribute("albumDate"));
		 */
		albumservice.AlbumInsert(album);
		musicservice.regist(music);
		return mav;
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