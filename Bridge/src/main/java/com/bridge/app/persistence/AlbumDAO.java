package com.bridge.app.persistence;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
	public void AlbumInsert(HttpServletRequest req) throws Exception;
	public AlbumVO getAlbumOne() throws Exception;
}
