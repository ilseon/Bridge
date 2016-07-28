package com.bridge.app.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.domain.Paging;
import com.bridge.app.domain.VideoVO;
import com.bridge.app.service.MusicService;
import com.bridge.app.service.UserService;


@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MusicService service;
	


	// 검색후 이동 페이지
	@RequestMapping(value = "headersearch")
	public String headersearch(Model model, @RequestParam String headersearch, @RequestParam String bno) throws Exception {		
	    Paging paging = new Paging();
	    paging.setPageNo(Integer.parseInt(bno));
	    paging.setPageSize(10);	       	     
	    paging.setStart((Integer.parseInt(bno)- 1) * paging.getPageSize());
	    paging.setEnd(Integer.parseInt(bno)*paging.getPageSize());	           
	    paging.setSearch(headersearch);	    
	    
		model.addAttribute("searchList", service.searchHeader(paging));		
	    paging.setTotalCount(service.searchCount(paging));   
	    model.addAttribute("paging", paging);
		return "/include/searchresult";
	}
	
	
}
