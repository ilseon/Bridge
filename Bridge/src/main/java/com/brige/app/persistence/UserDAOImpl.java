package com.brige.app.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.brige.app.domain.UserVO;

public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession SqlSession;
	
	private static final String NAMESPACE="com.woojun.mappers.UserMapper";
	
	
	@Override
	public void create(UserVO vo) throws Exception {
		SqlSession.insert(NAMESPACE + ".create");

	}

}
