package com.bridge.app.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bridge.app.domain.UserVO;
import com.bridge.app.service.UserService;


@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService Service;

	@RequestMapping(value="/user.add", method=RequestMethod.GET)
	public String user_add_get() {
		return "user/user";
	}
	@RequestMapping(value="/user.add", method=RequestMethod.POST)
	public ModelAndView user_add_post(UserVO vo)throws Exception{
		vo.setUserBirthday(vo.getYear() + "-" + vo.getMonth() + "-" + vo.getDay());
		vo.setUserPhone(vo.getTel1() + "-" + vo.getTel2() + "-" + vo.getTel3());
		vo.setUserEmail(vo.getUseremail1() + vo.getUseremail2());
		
		vo.setUserType(0);
		logger.info("user : " + vo.getUserName());
		Service.insertUser(vo);
		ModelAndView mav = new ModelAndView("/user/User_add_compleate");
		mav.addObject("username", vo.getUserName());
		
		return mav;
	};
}