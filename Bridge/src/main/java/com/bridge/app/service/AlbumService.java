package com.bridge.app.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.AlbumVO;

public interface AlbumService {

	public void regist(HttpServletRequest req) throws Exception;	
	public AlbumVO getAlbumOne(int albumNumber) throws Exception;
	public List<AlbumVO> searchAll(int limit) throws Exception;

	// 일선 추가
	public List<AlbumVO> getArtistAlbum(int artistNumber) throws Exception;
}
