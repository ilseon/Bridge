package com.bridge.app.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.persistence.AlbumDAO;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Inject
	private AlbumDAO dao;
	
	@Override
	public void AlbumInsert(AlbumVO vo) throws Exception {
		dao.AlbumInsert(vo);
	}
}
