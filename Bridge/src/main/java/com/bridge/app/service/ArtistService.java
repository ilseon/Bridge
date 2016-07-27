package com.bridge.app.service;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.ArtistVO;

public interface ArtistService {
	public void regist(HttpServletRequest req, Integer userNumber) throws Exception;	
	public ArtistVO getArtistOne() throws Exception;

}
