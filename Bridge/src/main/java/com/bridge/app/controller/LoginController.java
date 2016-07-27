/*
작성자 - 김민정
내용 - 로그인/로그아웃
시작날짜 - 2016/07/17
수정날짜 - 2016/07/27
변경내용 - 로그인시 화면 깨지는것 해결 및 로그인 실패시 이동 페이지
*/

package com.bridge.app.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.UserVO;
import com.bridge.app.persistence.UserDAO;
import com.bridge.app.service.DownloadService;
import com.bridge.app.service.UserService;

@Controller
@SessionAttributes({ "userid", "usernumber" })
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private UserService service;

	// 로그인 메서드
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@Valid UserVO uservo, BindingResult result, Model model) {
		logger.info("It is login : " + uservo.getUserId());
		logger.info("It is login : " + uservo.getUserPassword());

		if (result.hasErrors()) {
			logger.info("login error ");
			return "redirect:/";
		}

		try {
			UserVO vo = service.readLogin(uservo.getUserId(), uservo.getUserPassword());

			System.out.println(vo.getUserNumber());

			model.addAttribute("userid", vo.getUserId());
			model.addAttribute("usernumber", vo.getUserNumber());
			model.addAttribute("loginmsg",2);
			logger.info("login se :  ");

		} catch (Exception e) { // 로그인실패시
			logger.info("login fail ");
			model.addAttribute("loginmsg",1);
			return "/login/loginfail";
		}
		return "redirect:/";
	}

	// 아이디 및 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "loginsearch")
	public String loginSearch() {
		logger.info("It is loginsearch");
		return "/login/loginsearch";
	}
	
	// 로그인 실패시 이동 페이지
	@RequestMapping(value = "loginfail")
	public String loginfail() {
		logger.info("It is loginfail");
		return "/login/loginfail";
	}
	

	// 로그아웃 메서드
	@RequestMapping("logout")
	public String logout(SessionStatus session) {
		logger.info("It is logout");
		session.setComplete();
		return "redirect:/";
	}


	// 아이디 찾기 메서드
	@RequestMapping(value = "searchid", method = RequestMethod.POST)
	public String Searchid(@Valid UserVO uservo, BindingResult result, Model model) {
		logger.info("It is searchid : " + uservo.getUserName());
		logger.info("It is searchid : " + uservo.getUserBirthday());

		if (result.hasErrors()) {
			logger.info("search error ");
			return "/login/loginsearch";
		}
		try {
			UserVO vo = service.searchId(uservo.getUserName(), uservo.getUserBirthday());
			model.addAttribute("idmsg", 2);
			model.addAttribute("usersearchid", vo.getUserId());

			logger.info("search se :  ");

		} catch (Exception e) {
			logger.info("search fail ");
			model.addAttribute("idmsg", 1);
			return "/login/loginsearch";
		}
		return "/login/loginsearch";
	}

	// 비밀번호 찾기 메서드
	@RequestMapping(value = "usersearchpassword", method = RequestMethod.POST)
	public String Searchpassword(@Valid UserVO uservo, BindingResult result, Model model) {
		logger.info("It is searchpassword : " + uservo.getUserId());
		logger.info("It is searchemail : " + uservo.getUserEmail());

		if (result.hasErrors()) {
			logger.info("search error ");
			return "/login/loginsearch";
		}
		try {
			UserVO vo = service.searchPassword(uservo.getUserId(), uservo.getUserEmail());
			
			model.addAttribute("passwordmsg",2);
			model.addAttribute("usersearchpassword", vo.getUserPassword());
			logger.info("pw search se :  ");
		} catch (Exception e) {
			model.addAttribute("passwordmsg",1);
			logger.info("search fail ");
			return "/login/loginsearch";
		}
		return "/login/loginsearch";
	}

}