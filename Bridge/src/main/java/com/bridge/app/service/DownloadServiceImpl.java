/*
 �ۼ��� - ��ȿ��
���� - �ٿ�ε� Service ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-21
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bridge.app.domain.DownloadVO;
import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.DownloadDAO;

@Repository
public class DownloadServiceImpl implements DownloadService {
	
	@Inject
	private DownloadDAO downloadDAO;

	@Override
	public void registSeveral(Map playListAll) throws Exception {
		downloadDAO.registSeveral(playListAll);
	}

	@Override
	public void remove(Integer downloadNumber) throws Exception {

	}

	@Override
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception {

		return null;
	}

	@Override
	public void registOne(DownloadVO download) throws Exception {
		downloadDAO.registOne(download);
	}

	@Override
	public List<MusicVO> search_sev(Map playlistAll) throws Exception {
		return downloadDAO.search_sev(playlistAll);
	}

	@Override
	public List<DownloadVO> searchDownload(Integer userNumber) throws Exception {
		return downloadDAO.searchDownload(userNumber);
	}

	@Override
	public List<DownloadVO> searchList(Integer userNumber) throws Exception {
		return downloadDAO.searchList(userNumber);
	}

}