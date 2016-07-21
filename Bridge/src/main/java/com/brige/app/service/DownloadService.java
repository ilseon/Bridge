/*
 작성자 - 정효진
내용 - 다운로드 Service 인터페이스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-20
변경내용 - 기본 메서드 작성
 */

package com.brige.app.service;

import java.util.List;

import com.brige.app.domain.DownloadVO;

public interface DownloadService {
	public void registOne(Integer musicNumber, Integer userNumber) throws Exception;
	public void registSeveral(Integer musicNumber, Integer userNumber) throws Exception;
	public void remove(Integer downloadNumber) throws Exception;
	
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception;
}
