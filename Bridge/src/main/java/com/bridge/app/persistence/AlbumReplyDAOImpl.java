package com.bridge.app.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bridge.app.domain.AlbumReplyVO;
@Repository
public class AlbumReplyDAOImpl implements AlbumReplyDAO {
	@Autowired
	private SqlSession sqlsession;
	private static final String NAMESPACE="com.bridge.mappers.albumReplyMapper";

	 
	@Override
	public List<AlbumReplyVO> getReplyList(HashMap<String, Integer> map) throws Exception {
		System.out.println("DAO 까지 옴");
		return sqlsession.selectList(NAMESPACE + ".getReplyList", map);

	}

	@Override
	public void writeReply(AlbumReplyVO vo) throws Exception {
		sqlsession.insert(NAMESPACE + ".writeReply", vo);

	}

	@Override
	public void updateReplyGroupNumber() throws Exception {
		sqlsession.update(NAMESPACE + ".updateReplyGroupNumber");

	}

	@Override
	public void deleteReply(int replyNumber) throws Exception {
		sqlsession.delete(NAMESPACE + ".deleteReply", replyNumber);

	}

}
