/*
 �ۼ��� - ��ȿ��
���� - �ٿ�ε� Service �������̽�
���۳�¥ - 2016-07-20
������¥ - 2016-07-20
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.brige.app.service;

import java.util.List;

import com.brige.app.domain.DownloadVO;

public interface DownloadService {
	public void registOne(Integer musicNumber, Integer userNumber) throws Exception;
	public void registSeveral(Integer musicNumber, Integer userNumber) throws Exception;
	public void remove(Integer downloadNumber) throws Exception;
	
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception;
}
