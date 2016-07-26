/*
 �ۼ��� - ��ȿ��
���� - �ٿ�ε� Service ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-21
���泻�� - �⺻ �޼��� �ۼ�
 */
package com.bridge.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bridge.app.domain.DownloadVO;
import com.bridge.app.persistence.DownloadDAO;

@Repository
public class DownloadServiceImpl implements DownloadService {
	
	@Inject
	private DownloadDAO downloadDAO;

	@Override
	public void registOne(DownloadVO download) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void registSeveral(List<Integer> musicNumbers, Integer userNumber) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Integer downloadNumber) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
