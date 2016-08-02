/*
 �ۼ��� - ���ֿ�, ��ȿ��
���� - ���� Service �������̽�
���۳�¥ - 2016-07-20
������¥ - 2016-07-20
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.domain.Paging;
import com.bridge.app.domain.VideoVO;

public interface MusicService {

	public List<MusicVO> regist(HttpServletRequest req) throws Exception;
	public void remove(int musicnumber) throws Exception;
	public void modifyStreaming(MusicVO music) throws Exception;
	public void modifyDownload(MusicVO music) throws Exception;
	
	public List<MusicVO> searchAll(int limit) throws Exception;
	public MusicVO searchMusic(int musicnumber) throws Exception;
	public List<MusicVO> searchGenre(Map map) throws Exception;
	public MusicVO search() throws Exception;
	public void download_update(Map musicnumbers) throws Exception;
	public void play_update(Map musicnumbers) throws Exception;
	public void like_update(int musicNumber) throws Exception;
	public void like_remove(int musicNumber) throws Exception;
	public List<MusicVO> MytrackMusic(int albumNumber) throws Exception;
	
	// 일선 추가
	public List<MusicVO> getArtistMusic(int artistNumber) throws Exception;
	public List<MusicVO> getAlbumMusic(int albumNumber) throws Exception;
	public List<VideoVO> getArtistMusicVideo(int artistNumber) throws Exception;
	public List<VideoVO> getAlbumMusicVideo(int albumNumber) throws Exception;
	public List<MusicVO> searchHeader(Paging paging) throws Exception;
	public int searchCount(Paging paging) throws Exception;


}