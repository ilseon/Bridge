/*
 �ۼ��� - ��ȿ��
���� - ���� Service ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-21
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.MusicDAO;

@Repository
public class MusicServiceImpl implements MusicService {
	
	@Inject
	private MusicDAO musicDAO;

	@Override
	public List<MusicVO> searchAll() throws Exception {
		return musicDAO.searchAll();
	}


	@Override
	public void regist() throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void remove(Integer musicnumber) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void modifyStreaming(MusicVO music) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void modifyDownload(MusicVO music) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public MusicVO search() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
