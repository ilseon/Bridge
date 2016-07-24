package com.bridge.app.persistence;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.bridge.app.domain.ArtistVO;

public interface ArtistDAO {
	
	public void regist(Map<String, String> paramMap) throws Exception;
	public String FileUpload(HttpServletRequest req) throws Exception;
}
