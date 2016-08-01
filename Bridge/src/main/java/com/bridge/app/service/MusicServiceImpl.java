/*
 �ۼ��� - ��ȿ��
���� - ���� Service ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-21
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.MusicDAO;

@Repository
public class MusicServiceImpl implements MusicService {
	
	@Inject
	private MusicDAO musicDAO;

	@Override
	public List<MusicVO> searchAll(@RequestParam("limit") int limit) throws Exception {
		return musicDAO.searchAll(limit);
	}


	@Override
	public void regist(HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		musicDAO.regist(req);
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


	@Override
	public MusicVO searchMusic(int musicnumber) throws Exception {
		return musicDAO.searchMusic(musicnumber);
	}


	@Override
	public List<MusicVO> searchGenre(Map map) throws Exception {
		return musicDAO.searchGenre(map);
	}

	@Override
	public void download_update(Map musicnumbers) throws Exception {
		musicDAO.download_update(musicnumbers);
		
	}


	@Override
	public void play_update(Map musicnumbers) throws Exception {
		musicDAO.play_update(musicnumbers);	
	}


	@Override
	public void like_update(int musicNumber) throws Exception {
		musicDAO.like_update(musicNumber);
		
	}


	@Override
	public void like_remove(int musicNumber) throws Exception {
		musicDAO.like_remove(musicNumber);
	}
}
