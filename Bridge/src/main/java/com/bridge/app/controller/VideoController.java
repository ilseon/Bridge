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
import org.springframework.ui.Model;
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
	public ModelAndView list(@RequestParam String bno,@RequestParam String searchType,@RequestParam String search) throws Exception {
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
	        paging.setSearchType(searchType);
	        paging.setSearch(search);
	        
	        System.out.println(paging.getStart()+"시작");
	        System.out.println(paging.getEnd()+"끝");
	        
	        System.out.println(searchType+"타입");
	        System.out.println(search+"검색");

	        List<VideoVO> listtotal1=service.getVideoTotal();
	        System.out.println(listtotal1.size()+"크기");
	        
			
			paging.setTotalCount(listtotal1.size());
			mav.addObject("paging",paging);
			if(searchType.equals(null)&&search.equals(null)){
				
				List<VideoVO> listtotal=service.getVideoTotal(paging);
				mav.addObject("list",listtotal);
			}else{
				List<VideoVO> list=service.getVideoList(paging);
			mav.addObject("list",list);
			System.out.println(list.get(0).getMusicSubject()+"뮤지비디오");
			}
			return mav;
	    } catch (Exception e) {
	    	System.out.println(e);
	    	return mav;
	    }
	}
	
	@RequestMapping("chart_video")
	public String showChartVideo(Model model) throws SQLException{
		ModelAndView mav=new ModelAndView("/video/chart_video");
		System.out.println("asdawdawd");
		
		model.addAttribute("list",service.getChartVideoTotal());
		model.addAttribute("page","video");
		return "/chart/chart_main";
	}
	
	@RequestMapping("iframe")
	public String showIframe(@RequestParam String video,Model model){
		System.out.println(video);
		model.addAttribute("video",video);
		return "/video/iframe";
	}
}
