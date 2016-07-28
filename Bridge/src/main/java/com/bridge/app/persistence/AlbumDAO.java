package com.bridge.app.persistence;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.bridge.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
	public AlbumVO AlbumInsert(HttpServletRequest req, AlbumVO album, int artistnumber) throws Exception;
	public AlbumVO getAlbumOne() throws Exception;
	public List<AlbumVO> searchAll(int limit) throws Exception;


}
