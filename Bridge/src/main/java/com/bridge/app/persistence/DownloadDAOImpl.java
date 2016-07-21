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
	public void registOne(Integer musicnumber, Integer usernumber) throws Exception {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("musicnumber", musicnumber);
		paramMap.put("usernumber", usernumber);
		sqlSession.insert(NAMESPACE+".register", paramMap);		
	}

	@Override
	public void registSeveral(Integer musicNumber, Integer userNumber) throws Exception {
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
