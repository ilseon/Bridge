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
		// TODO Auto-generated method stub

	}

	@Override
	public List<Integer> searchAll(Integer userNumber) throws Exception {
		return likeDAO.searchAll(userNumber);
	}

}
