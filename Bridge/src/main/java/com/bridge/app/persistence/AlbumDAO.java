/*
	최초 작성일 : 2016-07-20
	작성자 : 정효진, 이주연
	수정일 : 2016-08-01
	수정 내용 : 최근 앨범 출력
	내용 :앨범 관련 DAO
 */
package com.bridge.app.persistence;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
	public void AlbumInsert(HttpServletRequest req) throws Exception;
	public AlbumVO getAlbumOne() throws Exception;
	public List<AlbumVO> searchAll(int limit) throws Exception;

}
