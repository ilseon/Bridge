package com.bridge.app.persistence;

import com.bridge.app.domain.ArtistVO;

public interface ArtistDAO {
	
	public void regist(ArtistVO vo) throws Exception;
	
}
