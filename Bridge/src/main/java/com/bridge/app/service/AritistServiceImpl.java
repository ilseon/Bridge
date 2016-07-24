package com.bridge.app.service;

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
	public void ArtistInsert(ArtistVO vo) throws Exception {
		artist.regist(vo);
	}

	@Override
	public String FileUpload(HttpServletRequest req) throws Exception {
		return artist.FileUpload(req);
	}	
}
