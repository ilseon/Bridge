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
		logger.info("?��로드?���?");
		return "/upload/upload";
	}
	
	@RequestMapping(value="upload",  method = RequestMethod.POST)
	public String Upload_Add(){
		logger.info("�? 추�?");
		return "/upload/upload";
	}
		
	@RequestMapping(value="mytrack",  method = RequestMethod.GET)
	public String MyTrack_(){
		logger.info("?��?��?��");
		return "/upload/mytrack";
	}
	
	@RequestMapping(value="mytrack_detail")
	public String MyTrack_Detail(){
		logger.info("?��?��?��_?��?��보기");
		return "/upload/mytrack_detail";
	}
	
	@RequestMapping(value="upload_artist")
	public String Upload_Artist(){
		logger.info("?��?��?��?�� ?���?");
		return "/upload/upload_artist";
	}
	
	@RequestMapping(value="modify",  method = RequestMethod.GET)
	public String PassWordConfirm(){
		logger.info("?��보수?��_비�?번호 ?��?��");
		return "/modify/password_check";
	}
		
	@RequestMapping(value="modify",  method = RequestMethod.POST)
	public String Modify(){
		logger.info("개인?��보수?��");
		return "/modify/modify";
	}
	
	@RequestMapping(value="withdrawal", method = RequestMethod.GET)
	public String PassWordWithdrawal(){
		logger.info("?��?��_비�?번호 ?��?��");
		return "/modify/password_check2";
	}
	
	@RequestMapping(value="withdrawal", method = RequestMethod.POST)
	public String Withdrawal(){
		logger.info("?��?��?��?��");
		return "/modify/withdrawal";
	}
	
	@RequestMapping(value="confirm")
	public String Confirm(){
		logger.info("?��?��?��?��?��?��");
		return "/modify/confirm";
	}
		
	@RequestMapping(value="like_song")
	public String LikeSong(){
		logger.info("좋아?��?�� �?");
		return "/mypage/like_song";
	}
	
	@RequestMapping(value="like_album")
	public String LikeAlbum(){
		logger.info("좋아?��?�� ?���?");
		return "/mypage/like_album";
	}
	
	@RequestMapping(value="myalbum")
	public String Myalbum(){
		logger.info("?��?���?");
		return "/mypage/myalbum";
	}
	
	@RequestMapping(value="download")
	public String Download(){
		logger.info("?��?��로드?��");
		return "/mypage/download";
	}

	@RequestMapping(value="payment")
	public String Payment(){
		logger.info("결제?��?��");
		return "/payment/payment";
	}	
}
