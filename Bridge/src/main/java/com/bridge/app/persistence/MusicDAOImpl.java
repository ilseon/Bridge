package com.bridge.app.persistence;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bridge.app.domain.MusicVO;

@Repository
public class MusicDAOImpl implements MusicDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.musicMapper";

	@Override
	public void regist() throws Exception {
		//sqlSession.insert(NAMESPACE + ".regist", vo);
	}

	@Override
	public void remove(Integer musicNumber) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void modify(MusicVO music) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MusicVO> searchAll() throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchAll");
	}

	@Override
	public MusicVO search() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
