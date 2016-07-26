/*
 �ۼ��� - ��ȿ��
���� - ���ƿ� dao impelements ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - ���ƿ� dao impl
 */
package com.bridge.app.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bridge.app.domain.LikeVO;

@Repository
public class LikeDAOImpl implements LikeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.likeMapper";

	@Override
	public void regist(LikeVO like) throws Exception {
		sqlSession.insert(NAMESPACE+".regist", like);
	}

	@Override
	public void remove(LikeVO like) throws Exception {
		sqlSession.delete(NAMESPACE+".remove", like);
		
	}

	@Override
	public List<Integer> searchAll(Integer userNumber) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchAll", userNumber);

	}

}