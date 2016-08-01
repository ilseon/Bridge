/*
 �ۼ��� - ��ȿ��
���� - ���ٹ� Service ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-21
���泻�� - �⺻ �޼��� �ۼ�
 */
package com.bridge.app.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.domain.PlaylistVO;
import com.bridge.app.persistence.PlayerDAO;
import com.bridge.app.persistence.PlaylistDAO;

@Repository
public class PlayerServiceImpl implements PlayerService {
	
	@Inject
	private PlayerDAO playerdao;

	@Override
	public MusicVO getMusic(MusicVO val) throws Exception {
		return playerdao.getMusic(val);
	}

	@Override
	public List<MusicVO> getMusicTotal() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



}