package com.bridge.app.service;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.ArtistVO;

public interface ArtistService {
	public void regist(HttpServletRequest req) throws Exception;	
	public ArtistVO getArtistOne() throws Exception;
	public int selectAritstNumber(int userNumber) throws Exception;

}