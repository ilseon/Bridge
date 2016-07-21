package com.bridge.app.service;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.AlbumVO;

public interface AlbumService {

	public void AlbumInsert(AlbumVO vo, HttpServletRequest request) throws Exception;

	
}
