package com.bridge.app.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.ArtistVO;

public interface ArtistService {
	public void regist(HttpServletRequest req) throws Exception;	
	public ArtistVO getArtistOne(int artistNumber) throws Exception;
	public List<ArtistVO> selectArtistOne(int artistNumber) throws Exception;
	public List<ArtistVO> selectArtist(int userNumber) throws Exception;
	public void update(HttpServletRequest req) throws Exception;
	public void remove(int artistNumber) throws Exception;
	
}