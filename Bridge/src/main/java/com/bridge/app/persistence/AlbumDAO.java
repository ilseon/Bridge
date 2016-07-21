package com.bridge.app.persistence;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;

import com.bridge.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
}
