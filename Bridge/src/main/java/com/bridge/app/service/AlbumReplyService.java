package com.bridge.app.service;

import java.util.HashMap;
import java.util.List;

import com.bridge.app.domain.AlbumReplyVO;
import com.bridge.app.domain.ArtistReplyVO;

public interface AlbumReplyService {
	public List<AlbumReplyVO> getReplyList(HashMap<String, Integer> map) throws Exception;
	public void writeReply(AlbumReplyVO vo) throws Exception;
	public void updateReplyGroupNumber() throws Exception;
	public void deleteReply(int replyNumber) throws Exception;
	public int countAlbum(int albumNumber) throws Exception;

}
