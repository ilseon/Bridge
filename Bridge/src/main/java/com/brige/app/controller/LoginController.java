package com.brige.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//로그인을 해주는 메서드
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(){
		logger.info("It is login");
		return "home";
	} 
	 
	
	//아이디 비밀번호 찾기시에 페이지를 이동해주는 메서드
	@RequestMapping(value="loginsearch")
	public String loginSearch(){
		logger.info("It is loginsearch");
		return "/login/loginsearch";
	}
	
	//로그아웃을 해주는 메서드
	  @RequestMapping("/logout")
	   public String logout(HttpServletRequest req){
	      req.getSession().invalidate();
	      return "home";
	   }
	
  

	
	
	
	


}
