package com.bridge.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.persistence.AlbumDAO;

@Repository
public class AlbumServiceImpl implements AlbumService{
	
	@Inject
	private AlbumDAO albumDAO;
	
	public List<AlbumVO> searchAll(int limit) throws Exception{
		return albumDAO.searchAll(limit);
	};
}
