/*
 작성자 - 이주연, 정효진
내용 - 음악 Service 인터페이스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-20
변경내용 - 기본 메서드 작성
 */

package com.bridge.app.service;

import java.util.List;

import com.bridge.app.domain.MusicVO;

public interface MusicService {
	public void regist() throws Exception;
	public void remove(Integer musicnumber) throws Exception;
	public void modifyStreaming(MusicVO music) throws Exception;
	public void modifyDownload(MusicVO music) throws Exception;
	
	public List<MusicVO> searchAll(int limit) throws Exception;
	public MusicVO search() throws Exception;
}
