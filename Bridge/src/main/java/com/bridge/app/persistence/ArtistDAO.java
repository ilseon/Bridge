package com.bridge.app.persistence;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.bridge.app.domain.ArtistVO;

public interface ArtistDAO {
	
	public void regist(HttpServletRequest req) throws Exception;
	public ArtistVO getArtistOne() throws Exception;
	public int selectAritstNumber(int userNumber) throws Exception;

}