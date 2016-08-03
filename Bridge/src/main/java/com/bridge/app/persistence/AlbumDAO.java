package com.bridge.app.persistence;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.bridge.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
	public void regist(HttpServletRequest req, Model view) throws Exception;
	public AlbumVO getAlbumOne(int albumNumber) throws Exception;
	public List<AlbumVO> searchAll(int limit) throws Exception;
	public List<AlbumVO> searchMytrack(int usernumber, int limit) throws Exception;
    public List<AlbumVO> MytrackAlbum(int albumNumber) throws Exception;

	// 일선 추가
	public List<AlbumVO> getArtistAlbum(int artistNumber) throws Exception;

	// 추가
	public List<AlbumVO> selectArtistnum(int artistNumber) throws Exception;
	
}
