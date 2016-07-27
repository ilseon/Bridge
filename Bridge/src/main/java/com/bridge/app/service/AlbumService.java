package com.bridge.app.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.AlbumVO;

public interface AlbumService {

	public AlbumVO regist(HttpServletRequest req, AlbumVO album, Integer userNumber) throws Exception;	
	public AlbumVO getAlbumOne() throws Exception;
	public List<AlbumVO> searchAll(int limit) throws Exception;

}