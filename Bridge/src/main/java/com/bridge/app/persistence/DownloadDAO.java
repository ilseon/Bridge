/*
 작성자 - 정효진
내용 - 앨범 dao 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-22
변경내용 - 앨범 dao
 */
package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.DownloadVO;

public interface DownloadDAO {
	public void registOne(DownloadVO download) throws Exception;
	public void registSeveral(List<Integer> musicNumbers, Integer userNumber) throws Exception;
	public void remove(Integer downloadNumber) throws Exception;
	
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception;
}