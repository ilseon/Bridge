/*
 * 작성자 - 조일선
 * 내용 - 가수 댓글 컨트롤러
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 
 * 변경내용 - 
 */
package com.bridge.app.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.AlbumReplyVO;
import com.bridge.app.service.AlbumReplyService;


@Controller
public class AlbumReplyController {
	@Autowired
	private AlbumReplyService service;
	
	@RequestMapping(value="albumReplyWrite")
	@ResponseBody
	public String replyWrite(@ModelAttribute AlbumReplyVO vo, HttpSession session) throws Exception{			
		// 댓글 작성 시 세션을 통한 userNumber저장
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		session = attr.getRequest().getSession();		
		vo.setUserNumber((int)session.getAttribute("usernumber"));
		
		service.writeReply(vo);
		if(vo.getReplyNumber()==0)
			service.updateReplyGroupNumber();
		return "success";
	}
	
	@RequestMapping(value="albumGetReplyList")	
	@ResponseBody
	public List<AlbumReplyVO> getReplyList(@RequestParam int start, int end, int albumNumber) throws Exception{		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("albumNumber", albumNumber);
		return service.getReplyList(map);
	}
	
	@RequestMapping(value="albumDeleteReply")	
	@ResponseBody
	public String deleteReply(@Valid int replyNumber) throws Exception{			
		service.deleteReply(replyNumber);
		return "success";
	}
	
}
