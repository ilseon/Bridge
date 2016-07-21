package com.bridge.app.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.persistence.AlbumDAO;

public class AlbumServiceImpl implements AlbumService {

	@Inject
	private AlbumDAO dao;
	
	@Override
	public void AlbumInsert(AlbumVO vo, HttpServletRequest request) throws Exception {
		// TODO 앨범 정보 등록
		dao.AlbumInsert(vo, request);
	}

}
