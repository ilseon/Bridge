/*
 �ۼ��� - ���ֿ�, ��ȿ��
���� - ���� Service �������̽�
���۳�¥ - 2016-07-20
������¥ - 2016-07-20
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.MusicVO;

public interface MusicService {

	public void regist(HttpServletRequest req, int counter, String albumName) throws Exception;
	public void remove(Integer musicnumber) throws Exception;
	public void modifyStreaming(MusicVO music) throws Exception;
	public void modifyDownload(MusicVO music) throws Exception;
	
	public List<MusicVO> searchAll(int limit) throws Exception;
	public MusicVO searchMusic(int musicnumber) throws Exception;
	public List<MusicVO> searchGenre(Map map) throws Exception;
	public MusicVO search() throws Exception;
	
	public void update(MusicVO music) throws Exception;
	public void registSeveral(HttpServletRequest req, int counter, String albumName) throws IOException;		
	
}