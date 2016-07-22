/*
 작성자 - 정효진
내용 - 좋아요 Service 인터페이스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-20
변경내용 - 기본 메서드 작성
 */

package com.bridge.app.service;

import java.util.List;

import com.bridge.app.domain.LikeVO;

public interface LikeService {
	public void regist(LikeVO like) throws Exception;
	public void remove(LikeVO like) throws Exception;
	public List<Integer> searchAll(Integer userNumber) throws Exception;
}
