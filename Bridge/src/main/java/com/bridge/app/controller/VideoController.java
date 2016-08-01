/*
 * 작성자 - 우병수
 * 내용 - 비디오 게시물 컨트롤러
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 2016/07/22
 * 변경내용 - 
 */
package com.bridge.app.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bridge.app.domain.Paging;
import com.bridge.app.domain.VideoVO;
import com.bridge.app.persistence.VideoDAO;
import com.bridge.app.service.SearchService;
import com.bridge.app.service.SearchServiceImpl;


@Controller
public class VideoController {
	
	@Autowired
	private SearchService service;
	
//게시물조회과 페이징 담당하는 메소드
	@RequestMapping(value="/video", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam String bno) throws Exception {
		ModelAndView mav = new ModelAndView("/video/videolist");
		System.out.println(bno+"번호");
	    try {
	    
	        Paging paging = new Paging();	        
	        paging.setPageNo(Integer.parseInt(bno));
	        paging.setPageSize(10);
	       
	        System.out.println("endpageno"+paging.getEndPageNo()+",finalpageno"+paging.getFinalPageNo()+",firstpageno"+paging.getFirstPageNo()+",nestpageno"+paging.getNextPageNo()
	        		+",pageno"+paging.getPageNo()+",pagesize"+paging.getPageSize()+",prevpageno"+paging.getPrevPageNo()+",startpageno"+paging.getStartPageNo()
	        		);
	        paging.setStart(( Integer.parseInt(bno)- 1) * paging.getPageSize());
	        paging.setEnd( Integer.parseInt(bno)*paging.getPageSize());
	        
	        System.out.println(paging.getStart()+"시작");
	        System.out.println(paging.getEnd()+"끝");

			List<VideoVO> list=service.getVideoList(paging);
			List<VideoVO> listtotal=service.getVideoTotal();
			paging.setTotalCount(listtotal.size());
			mav.addObject("paging",paging);
			mav.addObject("list",list);
			return mav;
	    } catch (Exception e) {
	    	System.out.println(e);
	    	return mav;
	    }
	}
}
