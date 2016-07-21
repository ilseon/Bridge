/*
 �ۼ��� - ���ֿ�, ��ȿ��
���� - ���� Service �������̽�
���۳�¥ - 2016-07-20
������¥ - 2016-07-20
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.brige.app.service;

import java.util.List;

import com.brige.app.domain.MusicVO;

public interface MusicService {
	public void regist(MusicVO music) throws Exception;
	public void update(MusicVO music) throws Exception;
	public void remove(Integer musicNumber) throws Exception;
	
	public MusicVO search(Integer musicNumber) throws Exception;
	public List<MusicVO> searchAll() throws Exception;
}
