/*
 작성자 - 정효진
내용 - 앨범 dao impelements 구현 클래스
시작날짜 - 2016-07-20
수정날짜 - 2016-07-22
변경내용 - 앨범 dao impl
 */
package com.bridge.app.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bridge.app.domain.DownloadVO;

@Repository
public class DownloadDAOImpl implements DownloadDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.downloadMapper";

	@Override
	public void registOne(DownloadVO download) throws Exception {
		sqlSession.insert(NAMESPACE+".regist", download);		
	}

	@Override
	public void registSeveral(List<Integer> musicNumbers, Integer userNumber) throws Exception {
		//sqlSession.insert(NAMESPACE+".registSeveral", arg1);
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
