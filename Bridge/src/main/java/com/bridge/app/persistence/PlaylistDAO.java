/*
	최초 작성일 : 2016-07-20
	작성자 : 정효진
	수정일 : 2016-07-30
	수정 내용 : 내 앨범에 넣을 때 이미 있는 앨범인지 아닌지 검색
	내용 :내 앨범 관련 DAO
 */
package com.bridge.app.persistence;

import java.util.List;
import java.util.Map;

import com.bridge.app.domain.LikeVO;
import com.bridge.app.domain.PlaylistVO;

public interface PlaylistDAO {
	public void regist(PlaylistVO playlist) throws Exception;
	public void registAll(Map playListAll) throws Exception;
	public void remove(PlaylistVO playlist) throws Exception;
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception;
	public List<PlaylistVO> searchAlbum(Integer userNumber, int limit) throws Exception;
	
	public List<PlaylistVO> search_myalbum(Map playListAll) throws Exception;
}
