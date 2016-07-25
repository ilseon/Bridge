/*
 작성자 - 정효진
내용 - 내앨범 dao 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-22
변경내용 - 내앨범 dao impl
 */
package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.PlaylistVO;

public interface PlaylistDAO {
	public void regist(PlaylistVO playlist) throws Exception;
	public void registAll(List<PlaylistVO> playlists) throws Exception;
	public void remove(List<PlaylistVO> playlists) throws Exception;
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception;
}
