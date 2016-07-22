/*
 작성자 - 정효진
내용 - 음원 dao 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-22
변경내용 - 음원 dao
 */
package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.MusicVO;

public interface MusicDAO {
	public void regist() throws Exception;
	public void remove(Integer musicnumber) throws Exception;
	public void modifyStreaming(MusicVO music) throws Exception;
	public void modifyDownload(MusicVO music) throws Exception;
	
	public List<MusicVO> searchAll(int limit) throws Exception;
	public MusicVO search() throws Exception;
	
}
