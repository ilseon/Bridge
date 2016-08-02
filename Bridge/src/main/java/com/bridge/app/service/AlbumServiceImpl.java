package com.bridge.app.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.AlbumDAO;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Inject
	private AlbumDAO dao;
	@Override
	public void regist(HttpServletRequest req,  Model view) throws Exception {
		dao.regist(req, view);	
	}
	@Override
	public AlbumVO getAlbumOne(int albumNumber) throws Exception {
		return dao.getAlbumOne(albumNumber);
	}
		
	@Override
	public List<AlbumVO> searchAll(int limit) throws Exception{
		return dao.searchAll(limit);
	}
	@Override
	public List<AlbumVO> searchMytrack(int usernumber, int limit) throws Exception {
		return dao.searchMytrack(usernumber, limit);
	}
	@Override
	public List<AlbumVO> MytrackDetail(int albumNumber) throws Exception {
		return dao.MytrackDetail(albumNumber);
	}

	
	
	// 일선 추가
	@Override
	public List<AlbumVO> getArtistAlbum(int artistNumber) throws Exception {
		return dao.getArtistAlbum(artistNumber);
	};

}
