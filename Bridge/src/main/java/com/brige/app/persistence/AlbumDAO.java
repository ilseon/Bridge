package com.brige.app.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.brige.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
}
