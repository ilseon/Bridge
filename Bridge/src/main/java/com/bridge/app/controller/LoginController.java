/*
작성자 - 김민정
내용 - 로그인/로그아웃
시작날짜 - 2016/07/17
수정날짜 - 2016/08/02
변경내용 - 주석 수정
*/

package com.bridge.app.controller;

import java.util.Properties;
import java.util.Random;

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

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Controller
@SessionAttributes({ "userid", "usernumber" })
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private UserService service;

	// 로그인 메서드
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@Valid UserVO uservo, BindingResult result, Model model) {
		logger.info("It is login : " + uservo.getUserId()+ uservo.getUserPassword());

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
			logger.info("login success  ");

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
		logger.info("It is searchid : " + uservo.getUserName()+ uservo.getUserBirthday());

		if (result.hasErrors()) {
			logger.info("search error ");
			return "/login/loginsearch";
		}
		try {
			UserVO vo = service.searchId(uservo.getUserName(), uservo.getUserBirthday());
			model.addAttribute("idmsg", 2);
			model.addAttribute("usersearchid", vo.getUserId());

			logger.info("search success  ");

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
		logger.info("It is searchpassword : " + uservo.getUserId() + uservo.getUserEmail());
		String temp_pass=null;
		if (result.hasErrors()) {
			logger.info("search error ");
			return "/login/loginsearch";
		}
		try {
			UserVO vo = service.searchPassword(uservo.getUserId(), uservo.getUserEmail());
			logger.info(vo.getUserEmail()+"+유저이메일찾기");
			model.addAttribute("passwordmsg",2);
			mail_pw(vo);//임시비밀번호로 회원 정보 업데이트.
			logger.info("pw search success  ");
		} catch (Exception e) {
			model.addAttribute("passwordmsg",1);
			logger.info("search fail ");
			return "/login/loginsearch";
		}
		return "/login/loginsearch";
	}
	
	public void mail_pw(UserVO vo) throws Exception{
        // 메일 관련 정보
        String host = "smtp.gmail.com";
        String username = "2saStaff@gmail.com";
        String password = "20160628";
        
        String temp_pass=temporaryPassword();
        vo.setUserPassword(temp_pass);
        
        logger.info(vo.getUserPassword()+"임시비번");
        
        service.update_pw(vo);//비밀번호 업데이트
        // 메일 내용
        String recipient = vo.getUserEmail();
        String subject = "요청하신 'Bridge' 사이트의 임시 비밀 번호 입니다";
        String body = "요청하신 임시 비밀번호는   "+temp_pass+"   입니다. 로그인 후 비밀번호를 즉시 바꿔 주세요!";
         
        //properties 설정
        Properties props = new Properties();
        props.put("mail.smtps.auth", "true");
        // 메일 세션
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session);
 
        // 메일 관련
        msg.setSubject(subject);
        msg.setText(body);
        msg.setFrom(new InternetAddress(username));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        
        // 발송 처리
        Transport transport = session.getTransport("smtps");
        transport.connect(host, username, password);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close(); 
        
    }


public static String temporaryPassword() {
	StringBuffer buffer = new StringBuffer();
	Random random = new Random();
			
	String chars[] = ("A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(","));
			
	for (int i = 0; i < 8; i++) {
		buffer.append(chars[random.nextInt(chars.length)]);
	}
	
	return buffer.toString();
	
}

}