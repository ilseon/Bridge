/*
 �ۼ��� - ��ȿ��
���� - ���� dao impelements ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - ���� dao impl
 */
package com.bridge.app.persistence;

import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

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

	@Override
	public MusicVO searchMusic(int musicnumber) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".searchMusic", musicnumber);
	}

	@Override
	public List<MusicVO> searchGenre(Map map) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchGenre", map);
	}

	@Override
	public void download_update(Map musicnumbers) throws Exception {
		sqlSession.update(NAMESPACE+".download_update", musicnumbers);
	}

	@Override
	public void play_update(Map musicnumbers) throws Exception {
		sqlSession.update(NAMESPACE+".play_update", musicnumbers);	
	}

}
