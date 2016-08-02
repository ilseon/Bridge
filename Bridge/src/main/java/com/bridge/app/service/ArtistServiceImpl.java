package com.bridge.app.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bridge.app.domain.ArtistVO;
import com.bridge.app.domain.LikeVO;
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
	public ArtistVO getArtistOne(int artistNumber) throws Exception {
		return dao.getArtistOne(artistNumber);
	}
	@Override
	public List<ArtistVO> selectArtist(int userNumber) throws Exception {
		return dao.selectArtist(userNumber);
	}
	@Override
	public void remove(int artistNumber) throws Exception {
		dao.remove(artistNumber);
		
	}
	@Override
	public void update(HttpServletRequest req) throws Exception {
		dao.update(req);
	}
	@Override
	public List<ArtistVO> selectArtistOne(int artistNumber) throws Exception {
		return dao.selectArtistOne(artistNumber);
	}
}
