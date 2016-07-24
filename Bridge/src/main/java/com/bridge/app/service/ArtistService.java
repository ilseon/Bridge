package com.bridge.app.service;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.ArtistVO;

public interface ArtistService {

	public void ArtistInsert(ArtistVO vo) throws Exception;
	public void FileUpload(HttpServletRequest req) throws Exception;	
}
