/*
 * 작성자 - 우병수
 * 내용 - 비디오 게시물 service
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 2016/07/21
 * 변경내용 - 
 */package com.bridge.app.service;

import java.sql.SQLException;
import java.util.List;

import com.bridge.app.domain.Paging;
import com.bridge.app.domain.VideoVO;
import com.bridge.app.domain.MusicVO;


public interface PlayerService {
	  public List<MusicVO> getMusic() throws Exception;//게시물조회 과 페이징처리
	  public List<MusicVO> getMusicTotal() throws SQLException;//총페이징 갯수
	  
}
