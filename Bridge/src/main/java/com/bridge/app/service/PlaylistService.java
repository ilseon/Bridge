/*
 작성자 - 정효진
내용 - 내앨범 Service 인터페이스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-21
변경내용 - 기본 메서드 작성
 */
package com.bridge.app.service;

import java.util.List;

import com.bridge.app.domain.PlaylistVO;

public interface PlaylistService {
	public void regist(PlaylistVO playlist) throws Exception;
	public void registAll(List<PlaylistVO> playlists) throws Exception;
	public void remove(List<PlaylistVO> playlists) throws Exception;
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception;
}
