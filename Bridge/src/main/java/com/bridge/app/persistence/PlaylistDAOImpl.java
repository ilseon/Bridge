/*
 �ۼ��� - ��ȿ��
���� - ���ٹ� dao ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - ���ٹ� dao
 */
package com.bridge.app.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bridge.app.domain.PlaylistVO;

@Repository
public class PlaylistDAOImpl implements PlaylistDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.playlistMapper";

	@Override
	public void regist(PlaylistVO playlist) throws Exception {
		sqlSession.insert(NAMESPACE+".regist", playlist);
	}

	@Override
	public void registAll(Map playListAll) throws Exception {
		sqlSession.insert(NAMESPACE+".registAll", playListAll);
	}

	@Override
	public void remove(List<PlaylistVO> playlists) throws Exception {

	}

	@Override
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception {

		return null;
	}

}
