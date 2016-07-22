/*
 �ۼ��� - ��ȿ��
���� - �ٿ�ε� Service �������̽�
���۳�¥ - 2016-07-20
������¥ - 2016-07-20
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

import java.util.List;

import com.bridge.app.domain.DownloadVO;

public interface DownloadService {
	public void registOne(DownloadVO download) throws Exception;
	public void registSeveral(List<Integer> musicNumbers, Integer userNumber) throws Exception;
	public void remove(Integer downloadNumber) throws Exception;
	
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception;
}
