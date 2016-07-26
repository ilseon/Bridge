package com.bridge.app.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bridge.app.domain.ArtistReplyVO;
import com.bridge.app.persistence.ArtistReplyDAO;

@Service
public class ArtistReplyServiceImpl implements ArtistReplyService{
	
	@Autowired
	private ArtistReplyDAO dao;

	@Override
	public List<ArtistReplyVO> getReplyList(HashMap<String, Integer> map) throws Exception {
		return dao.getReplyList(map);
	}

	@Override
	public void writeReply(ArtistReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}

	@Override
	public void updateReplyGroupNumber() throws Exception {
		dao.updateReplyGroupNumber();		
	}

	@Override
	public void deleteReply(int replyNumber) throws Exception {
		dao.deleteReply(replyNumber);
		
	}

}
