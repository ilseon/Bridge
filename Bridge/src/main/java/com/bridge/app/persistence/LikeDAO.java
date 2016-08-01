/*
	최초 작성일 : 2016-07-20
	작성자 : 정효진
	수정일 : 2016-07-28
	수정 내용 : '좋아요' 취소시 데이터 삭제
	내용 : 좋아요 관련 DAO
 */
package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.LikeVO;

public interface LikeDAO {
	public void regist(LikeVO like) throws Exception;
	public void remove(LikeVO like) throws Exception;
	public List<Integer> searchAll(Integer userNumber) throws Exception;
}
