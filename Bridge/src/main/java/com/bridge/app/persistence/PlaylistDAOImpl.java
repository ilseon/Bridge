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
