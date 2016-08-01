/*
 * 작성자 - 우병수
 * 내용 - 비디오 게시물 service impl
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 
 * 변경내용 - 
 */package com.bridge.app.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bridge.app.domain.Paging;
import com.bridge.app.domain.VideoVO;
import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.VideoDAO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Inject
	private VideoDAO dao;
	
	//게시물 
	@Override
	public List<VideoVO> getVideoList(Paging pg) throws Exception {
		return dao.getVideoList(pg);
	}

	@Override
	public List<VideoVO> getVideoTotal(Paging pg) throws SQLException {
		return dao.getVideoTotal(pg);
	}

	@Override
	public List<VideoVO> getVideoTotal() throws SQLException {
		// TODO Auto-generated method stub
		return dao.getVideoTotal();
	}

	

}