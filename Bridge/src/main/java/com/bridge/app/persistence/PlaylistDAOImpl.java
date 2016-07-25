/*
 작성자 - 정효진
내용 - 내앨범 dao 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-22
변경내용 - 내앨범 dao
 */
package com.bridge.app.persistence;

import java.util.List;

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
	public void registAll(List<PlaylistVO> playlists) throws Exception {

	}

	@Override
	public void remove(List<PlaylistVO> playlists) throws Exception {

	}

	@Override
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception {

		return null;
	}

}
