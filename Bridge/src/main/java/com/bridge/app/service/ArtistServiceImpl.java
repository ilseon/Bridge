package com.bridge.app.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bridge.app.domain.ArtistVO;
import com.bridge.app.persistence.ArtistDAO;

@Service
public class ArtistServiceImpl implements ArtistService{
	@Autowired
	private ArtistDAO dao;	
	

	@Override
	public void regist(HttpServletRequest req, Integer userNumber) throws Exception {
		dao.regist(req, userNumber);
	}	
	@Override
	public ArtistVO getArtistOne() throws Exception {
		return dao.getArtistOne();
	}

}
