package com.bridge.app.persistence;

import java.util.HashMap;
import java.util.List;

import com.bridge.app.domain.ArtistReplyVO;

public interface ArtistReplyDAO {
	public List<ArtistReplyVO> getReplyList(HashMap<String, Integer> map) throws Exception;
	public void writeReply(ArtistReplyVO vo) throws Exception;
	public void updateReplyGroupNumber() throws Exception;
	public void deleteReply(int replyNumber) throws Exception;
	public int countArtist(int artistNumber) throws Exception;

}
