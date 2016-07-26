/*
 작성자 - 정효진
내용 - 좋아요 Service implement 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-20
변경내용 - 기본 메서드 작성
 */

package com.bridge.app.service;

import java.util.List;

import javax.inject.Inject;

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