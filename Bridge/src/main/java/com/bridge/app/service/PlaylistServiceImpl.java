/*
 작성자 - 정효진
내용 - 내앨범 Service 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-21
변경내용 - 기본 메서드 작성
 */
package com.bridge.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bridge.app.domain.PlaylistVO;
import com.bridge.app.persistence.PlaylistDAO;

@Repository
public class PlaylistServiceImpl implements PlaylistService {
	
	@Inject
	private PlaylistDAO playlistdao;

	@Override
	public void regist(PlaylistVO playlist) throws Exception {
		playlistdao.regist(playlist);
	}

	@Override
	public void registAll(List<PlaylistVO> playlists) throws Exception {

	}

	@Override
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception {

		return null;
	}

	@Override
	public void remove(List<PlaylistVO> playlists) throws Exception {
		
	}

}
