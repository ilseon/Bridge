package com.bridge.app.service;

import java.util.List;

import com.bridge.app.domain.AlbumVO;

public interface AlbumService {
	public List<AlbumVO> searchAll(int limit) throws Exception;
}
