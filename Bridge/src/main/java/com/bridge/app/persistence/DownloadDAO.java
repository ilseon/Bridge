/*
	최초 작성일 : 2016-07-20
	작성자 : 정효진
	수정일 : 2016-07-30
	수정 내용 : 이미 다운받은 음원인지 검색
	내용 : 다운로드 관련 DAO
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
	public List<DownloadVO> searchList(Integer userNumber, int limit) throws Exception;
	
	//추가
	public List<DownloadVO> searchMyDownload(int userNumber) throws Exception;
}