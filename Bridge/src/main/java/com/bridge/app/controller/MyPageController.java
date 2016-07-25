package com.bridge.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@RequestMapping(value="upload",  method = RequestMethod.GET)
	public String Upload(){
		logger.info("?—…ë¡œë“œ?•˜ê¸?");
		return "/upload/upload";
	}
	
	@RequestMapping(value="upload",  method = RequestMethod.POST)
	public String Upload_Add(){
		logger.info("ê³? ì¶”ê?");
		return "/upload/upload";
	}
		
	@RequestMapping(value="mytrack",  method = RequestMethod.GET)
	public String MyTrack_(){
		logger.info("?‚´?Š¸?™");
		return "/upload/mytrack";
	}
	
	@RequestMapping(value="mytrack_detail")
	public String MyTrack_Detail(){
		logger.info("?‚´?Š¸?™_?ƒ?„¸ë³´ê¸°");
		return "/upload/mytrack_detail";
	}
	
	@RequestMapping(value="upload_artist")
	public String Upload_Artist(){
		logger.info("?•„?‹°?Š¤?Š¸ ?“±ë¡?");
		return "/upload/upload_artist";
	}
	
	@RequestMapping(value="modify",  method = RequestMethod.GET)
	public String PassWordConfirm(){
		logger.info("? •ë³´ìˆ˜? •_ë¹„ë?ë²ˆí˜¸ ?™•?¸");
		return "/modify/password_check";
	}
		
	@RequestMapping(value="modify",  method = RequestMethod.POST)
	public String Modify(){
		logger.info("ê°œì¸? •ë³´ìˆ˜? •");
		return "/modify/modify";
	}
	
	@RequestMapping(value="withdrawal", method = RequestMethod.GET)
	public String PassWordWithdrawal(){
		logger.info("?ƒˆ?‡´_ë¹„ë?ë²ˆí˜¸ ?™•?¸");
		return "/modify/password_check2";
	}
	
	@RequestMapping(value="withdrawal", method = RequestMethod.POST)
	public String Withdrawal(){
		logger.info("?šŒ?›?ƒˆ?‡´");
		return "/modify/withdrawal";
	}
	
	@RequestMapping(value="confirm")
	public String Confirm(){
		logger.info("?šŒ?›?ƒˆ?‡´?™?˜");
		return "/modify/confirm";
	}
		
	@RequestMapping(value="like_song")
	public String LikeSong(){
		logger.info("ì¢‹ì•„?•˜?Š” ê³?");
		return "/mypage/like_song";
	}
	
	@RequestMapping(value="like_album")
	public String LikeAlbum(){
		logger.info("ì¢‹ì•„?•˜?Š” ?•¨ë²?");
		return "/mypage/like_album";
	}
	
	@RequestMapping(value="myalbum")
	public String Myalbum(){
		logger.info("?‚´?•¨ë²?");
		return "/mypage/myalbum";
	}
	
	@RequestMapping(value="download")
	public String Download(){
		logger.info("?‹¤?š´ë¡œë“œ?•¨");
		return "/mypage/download";
	}

	@RequestMapping(value="payment")
	public String Payment(){
		logger.info("ê²°ì œ?‚´?—­");
		return "/payment/payment";
	}	
}
