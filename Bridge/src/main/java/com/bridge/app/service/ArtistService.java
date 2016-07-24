package com.bridge.app.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.ArtistVO;

public interface ArtistService {

	public void ArtistInsert(Map<String, String> paramMap) throws Exception;
	public String FileUpload(HttpServletRequest req) throws Exception;	
}
