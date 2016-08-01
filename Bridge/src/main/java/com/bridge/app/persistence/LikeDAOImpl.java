/*
	최초 작성일 : 2016-07-20
	작성자 : 정효진
	수정일 : 2016-07-28
	수정 내용 : '좋아요' 취소시 데이터 삭제
	내용 : 좋아요 관련 DAOImpl
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
