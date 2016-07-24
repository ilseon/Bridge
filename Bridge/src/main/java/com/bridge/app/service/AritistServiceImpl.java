package com.bridge.app.service;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.bridge.app.domain.ArtistVO;
import com.bridge.app.persistence.ArtistDAO;

@Service
public class AritistServiceImpl implements ArtistService {

	@Inject
	private ArtistDAO artist;
	
	@Override
	public void ArtistInsert(Map<String, String> paramMap) throws Exception {
		artist.regist(paramMap);
	}

	@Override
	public String FileUpload(HttpServletRequest req) throws Exception {
		return artist.FileUpload(req);
	}	
}
