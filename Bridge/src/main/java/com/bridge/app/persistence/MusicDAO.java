/*
 �ۼ��� - ��ȿ��
���� - ���� dao ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - ���� dao
 */
package com.bridge.app.persistence;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.MusicVO;

public interface MusicDAO {
	public void regist(HttpServletRequest req) throws Exception;
	public void remove(Integer musicnumber) throws Exception;
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
 	
}
