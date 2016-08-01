package com.bridge.app.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bridge.app.domain.ArtistReplyVO;

@Repository
public class ArtistReplyDAOImpl implements ArtistReplyDAO {
	@Autowired
	private SqlSession sqlsession;
	
	private static final String NAMESPACE="com.bridge.mappers.artistReplyMapper";
	
	@Override
	public List<ArtistReplyVO> getReplyList(HashMap<String, Integer> map) throws Exception { // 해당 가수의 댓글 리스트 가져오기
		return sqlsession.selectList(NAMESPACE + ".getReplyList", map);
	}

	@Override
	public void writeReply(ArtistReplyVO vo) throws Exception { // 댓글 작성
		sqlsession.insert(NAMESPACE + ".writeReply", vo);

	}

	@Override
	public void updateReplyGroupNumber() throws Exception { // 리댓글이 아닐 때 그룹 번호 업데이트
		sqlsession.update(NAMESPACE + ".updateReplyGroupNumber");
	}

	@Override
	public void deleteReply(int replyNumber) throws Exception {
		sqlsession.delete(NAMESPACE + ".deleteReply", replyNumber);
		
	}

}
