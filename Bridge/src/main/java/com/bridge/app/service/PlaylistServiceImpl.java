
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
public class PlaylistServiceImpl implements PlayerService {
	
	@Inject
	private PlayerDAO playerdao;

	@Override
	public List<MusicVO> getMusic() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MusicVO> getMusicTotal() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


}