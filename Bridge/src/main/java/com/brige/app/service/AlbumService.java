package com.brige.app.service;

import javax.servlet.http.HttpServletRequest;

import com.brige.app.domain.AlbumVO;

public interface AlbumService {

	public void AlbumInsert(AlbumVO vo, HttpServletRequest request) throws Exception;

	
}
