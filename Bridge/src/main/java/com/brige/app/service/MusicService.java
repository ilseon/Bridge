/*
 작성자 - 이주연, 정효진
내용 - 음악 Service 인터페이스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-20
변경내용 - 기본 메서드 작성
 */

package com.brige.app.service;

import java.util.List;

import com.brige.app.domain.MusicVO;

public interface MusicService {
	public void regist(MusicVO music) throws Exception;
	public void update(MusicVO music) throws Exception;
	public void remove(Integer musicNumber) throws Exception;
	
	public MusicVO search(Integer musicNumber) throws Exception;
	public List<MusicVO> searchAll() throws Exception;
}
