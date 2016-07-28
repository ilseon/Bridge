package com.bridge.app.persistence;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.ArtistVO;

public interface ArtistDAO {
	
	public void regist(HttpServletRequest req) throws Exception;
	public ArtistVO getArtistOne() throws Exception;
	public int selectAritstNumber(int userNumber) throws Exception;
	public List<ArtistVO> selectAritst(int userNumber) throws Exception;
}