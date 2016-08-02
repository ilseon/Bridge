package com.bridge.app.persistence;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.bridge.app.domain.ArtistVO;

public interface ArtistDAO {
	
	public void regist(HttpServletRequest req) throws Exception;
	public ArtistVO getArtistOne(int artistNumber) throws Exception;
	public List<ArtistVO> selectArtistOne(int artistNumber) throws Exception;
	public List<ArtistVO> selectArtist(int userNumber) throws Exception;
	public ArtistVO update(HttpServletRequest req) throws Exception;
	public void remove(int artistNumber) throws Exception;
}