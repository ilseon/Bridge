/*
 �ۼ��� - ��ȿ��
���� - �ٹ� dao ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - �ٹ� dao
 */
package com.bridge.app.persistence;

import java.util.List;
import java.util.Map;

import com.bridge.app.domain.DownloadVO;
import com.bridge.app.domain.MusicVO;

public interface DownloadDAO {
	public void registOne(DownloadVO download) throws Exception;
	public void registSeveral(Map playListAll) throws Exception;
	public void remove(Integer downloadNumber) throws Exception;
	public List<DownloadVO> searchDownload(Map playlistAll) throws Exception;
	
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception;
	public List<MusicVO> search_sev(Map playlistAll) throws Exception;
	public List<Integer> music_already(Map download_check)throws Exception;
}
