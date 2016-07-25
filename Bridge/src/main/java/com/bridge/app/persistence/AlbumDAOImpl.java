package com.bridge.app.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.UserVO;

@Repository
public class AlbumDAOImpl implements AlbumDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.albumMapper";
	
	@Override
	public AlbumVO test() {		
		System.out.println(((UserVO)sqlSession.selectOne("test")).getUserId());
		System.out.println(((UserVO)sqlSession.selectOne("test")).getUserName());
		return null;
	}

	@Override
	public List<AlbumVO> searchAll(int limit) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchAll", limit);
	}

}
