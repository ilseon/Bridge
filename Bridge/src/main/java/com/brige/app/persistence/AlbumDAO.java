package com.brige.app.persistence;


import javax.servlet.http.HttpServletRequest;

import com.brige.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
	public void AlbumInsert(AlbumVO vo, HttpServletRequest request) throws Exception;
}
