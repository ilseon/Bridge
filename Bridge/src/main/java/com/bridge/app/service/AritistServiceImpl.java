package com.bridge.app.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.bridge.app.domain.ArtistVO;
import com.bridge.app.persistence.ArtistDAO;

@Service
public class AritistServiceImpl implements ArtistService {

	@Inject
	private ArtistDAO artistDao;

	@Override
	public void regist(HttpServletRequest req) throws Exception {
		artistDao.regist(req);
	}	
}
