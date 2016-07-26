/*
 �ۼ��� - ��ȿ��
���� - �ٹ� dao impelements ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - �ٹ� dao impl
 */
package com.bridge.app.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bridge.app.domain.DownloadVO;
import com.bridge.app.domain.MusicVO;

@Repository
public class DownloadDAOImpl implements DownloadDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.downloadMapper";

	@Override
	public void registOne(DownloadVO download) throws Exception {
		sqlSession.insert(NAMESPACE+".regist", download);		
	}

	@Override
	public void registSeveral(Map playListAll) throws Exception {
		sqlSession.insert(NAMESPACE+".registSeveral", playListAll);
	}

	@Override
	public void remove(Integer downloadNumber) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MusicVO> search_sev(Map playlistAll) throws Exception {
		return sqlSession.selectList(NAMESPACE+".search_sev", playlistAll);
	}

	@Override
	public List<DownloadVO> searchDownload(Map playlistAll) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchDownload", playlistAll);
	}
	
}
