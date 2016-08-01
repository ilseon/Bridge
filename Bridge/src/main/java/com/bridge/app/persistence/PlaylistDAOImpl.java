/*
	최초 작성일 : 2016-07-20
	작성자 : 정효진
	수정일 : 2016-07-30
	수정 내용 : 내 앨범에 넣을 때 이미 있는 앨범인지 아닌지 검색
	내용 :내 앨범 관련 DAOImpl
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

	@Override
	public List<PlaylistVO> search_myalbum(Map playListAll) throws Exception {
		return sqlSession.selectList(NAMESPACE+".search_myalbum",playListAll);
	}

}
