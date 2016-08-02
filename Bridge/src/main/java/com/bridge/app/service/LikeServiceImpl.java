/*
 �ۼ��� - ��ȿ��
���� - ���ƿ� Service implement Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-20
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bridge.app.domain.LikeVO;
import com.bridge.app.persistence.LikeDAO;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Inject
	private LikeDAO likeDAO;

	@Override
	public void regist(LikeVO like) throws Exception {
		likeDAO.regist(like);
	}

	@Override
	public void remove(LikeVO like) throws Exception {
		likeDAO.remove(like);
	}

	@Override
	public List<Integer> searchAll(Integer userNumber) throws Exception {
		return likeDAO.searchAll(userNumber);
	}

	@Override
	public List<LikeVO> searchMusic(Integer userNumber, int limit) throws Exception {
		return likeDAO.searchMusic(userNumber, limit);
	}

	@Override
	public List<LikeVO> searchAlbum(Integer userNumber) throws Exception {
		return likeDAO.searchAlbum(userNumber);
	}

	@Override
	public void removeAll(int userNumber) throws Exception {
		likeDAO.removeAll(userNumber);		
	}

}
