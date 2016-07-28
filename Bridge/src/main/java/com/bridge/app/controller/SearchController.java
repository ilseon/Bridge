package com.bridge.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bridge.app.service.UserService;


@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private UserService service;

	// 검색후 이동 페이지
	@RequestMapping(value = "headersearch")
	public String headersearch() {
		logger.info("It is headersearch");
		return "/include/searchresult";
	}
	
	
}
