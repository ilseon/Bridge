package com.bridge.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bridge.app.domain.AlbumReplyVO;
import com.bridge.app.persistence.AlbumReplyDAO;
import com.bridge.app.persistence.ArtistReplyDAO;
@Service
public class AlbumReplyServiceImpl implements AlbumReplyService {
	@Autowired
	private AlbumReplyDAO dao;
	
	@Override
	public List<AlbumReplyVO> getReplyList(HashMap<String, Integer> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스!!!!!!!!!!!");
		return dao.getReplyList(map);
	}

	@Override
	public void writeReply(AlbumReplyVO vo) throws Exception {
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
