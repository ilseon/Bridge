/*
 �ۼ��� - ���ֿ�, ��ȿ��
���� - ���� Service �������̽�
���۳�¥ - 2016-07-20
������¥ - 2016-07-20
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bridge.app.domain.MusicVO;

public interface MusicService {
	public void regist(HttpServletRequest req) throws Exception;
	public void update(MusicVO music) throws Exception;
	public void remove(Integer musicNumber) throws Exception;
	
	public MusicVO search(Integer musicNumber) throws Exception;
	public List<MusicVO> searchAll() throws Exception;
}
