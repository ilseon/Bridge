/*
 작성자 - 정효진
내용 - 좋아요 Service 인터페이스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-20
변경내용 - 기본 메서드 작성
 */

package com.bridge.app.service;

public interface LikeService {
	public void regist(Integer userNumber, Integer musicNumber) throws Exception;
	public void remove(Integer userNumber, Integer musicNumber) throws Exception;
	public Integer searchAll(Integer musicNumber) throws Exception;
}
