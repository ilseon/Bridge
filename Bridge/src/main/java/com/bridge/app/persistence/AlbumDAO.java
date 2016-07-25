package com.bridge.app.persistence;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;

import com.bridge.app.domain.AlbumVO;

public interface AlbumDAO {
	
	public AlbumVO test();
	public List<AlbumVO> searchAll(int limit) throws Exception;
}
