/*
 �ۼ��� - ��ȿ��
���� - �ٿ�ε� Service �������̽�
���۳�¥ - 2016-07-20
������¥ - 2016-07-20
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bridge.app.domain.DownloadVO;
import com.bridge.app.domain.MusicVO;

public interface DownloadService {
	public void registOne(DownloadVO download) throws Exception;
	public void registSeveral(Map playListAll) throws Exception;
	public void remove(Map dlist) throws Exception;
	
	public List<DownloadVO> searchDownload(Map playlistAll) throws Exception;
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception;
	public List<MusicVO> search_sev(Map map) throws Exception;
	public List<Integer> music_already(Map download_check)throws Exception;
	public List<DownloadVO> searchList(Integer userNumber, int limit) throws Exception;
	
	//추가
	public List<DownloadVO> searchMyDownload(int userNumber) throws Exception;
}