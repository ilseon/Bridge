package com.bridge.app.persistence;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.bridge.app.domain.ArtistVO;

public interface ArtistDAO {
	
	public void regist(ArtistVO vo) throws Exception;

	
}
