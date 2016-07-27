package com.bridge.app.persistence;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
	public void AlbumInsert(HttpServletRequest req) throws Exception;
	public AlbumVO getAlbumOne(int albumNumber) throws Exception;
	public List<AlbumVO> searchAll(int limit) throws Exception;

}
