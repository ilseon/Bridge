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
	
	//�α����� ���ִ� �޼���
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(){
		logger.info("It is login");
		return "home";
	} 
	 
	
	//���̵� ��й�ȣ ã��ÿ� �������� �̵����ִ� �޼���
	@RequestMapping(value="loginsearch")
	public String loginSearch(){
		logger.info("It is loginsearch");
		return "/login/loginsearch";
	}
	
	//�α׾ƿ��� ���ִ� �޼���
	  @RequestMapping("/logout")
	   public String logout(HttpServletRequest req){
	      req.getSession().invalidate();
	      return "home";
	   }
	
  

	
	
	
	


}
