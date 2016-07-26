/*
 작성자 - 정효진
내용 - 좋아요 dao 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-22
변경내용 - 좋아요 dao
 */
package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.LikeVO;

public interface LikeDAO {
	public void regist(LikeVO like) throws Exception;
	public void remove(LikeVO like) throws Exception;
	public List<Integer> searchAll(Integer userNumber) throws Exception;
}
