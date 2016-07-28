package com.bridge.app.service;

import java.util.List;

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
	public void regist(HttpServletRequest req) throws Exception {
		dao.regist(req);
	}	
	@Override
	public ArtistVO getArtistOne() throws Exception {
		return dao.getArtistOne();
	}
	
	@Override
	public int selectAritstNumber(int userNumber) throws Exception {
		return dao.selectAritstNumber(userNumber);
	}
	@Override
	public List<ArtistVO> selectAritst(int userNumber) throws Exception {
		return dao.selectAritst(userNumber);
	}
}
