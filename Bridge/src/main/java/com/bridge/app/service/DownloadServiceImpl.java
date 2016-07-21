/*
 작성자 - 정효진
내용 - 다운로드 Service 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-21
변경내용 - 기본 메서드 작성
 */
package com.bridge.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bridge.app.domain.DownloadVO;
import com.bridge.app.persistence.DownloadDAO;

@Repository
public class DownloadServiceImpl implements DownloadService {
	
	@Inject
	private DownloadDAO downloadDAO;

	@Override
	public void registOne(Integer musicNumber, Integer userNumber) throws Exception {
		downloadDAO.registOne(musicNumber, userNumber);
	}

	@Override
	public void registSeveral(Integer musicNumber, Integer userNumber) throws Exception {

	}

	@Override
	public void remove(Integer downloadNumber) throws Exception {

	}

	@Override
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception {

		return null;
	}

}
