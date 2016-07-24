package com.bridge.app.persistence;

import com.bridge.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
	public void AlbumInsert(AlbumVO vo) throws Exception;
	public String FileUpload() throws Exception;
}
