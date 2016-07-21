package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.PlaylistVO;

public interface PlaylistDAO {
	public void regist(PlaylistVO playlist) throws Exception;
	public void registAll(List<PlaylistVO> playlists) throws Exception;
	public void remove(List<PlaylistVO> playlists) throws Exception;
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception;
}
