/*
 �ۼ��� - ��ȿ��
���� - ���ٹ� Service ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-21
���泻�� - �⺻ �޼��� �ۼ�
 */
package com.bridge.app.service;

import java.util.List;
import java.util.Map;

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
	public void registAll(Map playListAll) throws Exception {
		playlistdao.registAll(playListAll);
	}

	@Override
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception {		
		return playlistdao.searchAll(userNumber);
	}

	@Override
	public void remove(List<PlaylistVO> playlists) throws Exception {
		
	}

}