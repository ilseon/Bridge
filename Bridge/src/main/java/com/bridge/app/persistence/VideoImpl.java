/*
 * 작성자 - 우병수
 * 내용 - 비디오 게시물 Impl
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 2016/07/21
 * 변경내용 - 
 */package com.bridge.app.persistence;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bridge.app.domain.Paging;
import com.bridge.app.domain.VideoVO;
import com.bridge.app.domain.MusicVO;
@Repository
public class VideoImpl implements VideoDAO{

	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.bridge.mappers.searchMapper";
	
	@Override
	public List<VideoVO> getVideoList(Paging pg) throws SQLException {

		return sqlSession.selectList(NAMESPACE+".videotest",pg);
	}

	@Override
	public List<VideoVO> getVideoTotal(Paging pg) throws SQLException {
		return sqlSession.selectList(NAMESPACE+".totalvideo");
	}

	@Override
	public List<VideoVO> getVideoTotal() throws SQLException {
		return sqlSession.selectList(NAMESPACE+".totalvideo1");
	}


	
	
	
}
