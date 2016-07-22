/*
 작성자 - 정효진
내용 - 음원 dao impelements 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-22
변경내용 - 음원 dao impl
 */
package com.bridge.app.persistence;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.bridge.app.domain.MusicVO;

@Repository
public class MusicDAOImpl implements MusicDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.musicMapper";

	@Override
	public void regist() throws Exception {

	}

	@Override
	public void remove(Integer musicNumber) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MusicVO> searchAll(int limit) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchAll", limit);
	}

	@Override
	public MusicVO search() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyStreaming(MusicVO music) throws Exception {
		
		
	}

	@Override
	public void modifyDownload(MusicVO music) throws Exception {
		
		
	}

}
