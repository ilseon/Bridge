package com.brige.app.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brige.app.domain.AlbumVO;
import com.brige.app.domain.UserVO;

@Repository
public class AlbumDAOImpl implements AlbumDAO{
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public AlbumVO test() {		
		System.out.println(((UserVO)sqlSession.selectOne("test")).getUserId());
		System.out.println(((UserVO)sqlSession.selectOne("test")).getUserName());
		return null;
	}

}
