package com.brige.app.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brige.app.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.brige.mappers.loginMapper";
	

	@Override
	public UserVO readLogin(String userid, String userpw) throws Exception {
		// 입력받은 userid와 pw를 비교하여 로그인을 해주는 메서드
		
		System.out.println("dao까지 왔음");
		Map<String, Object> loginMap = new HashMap<String, Object>();
		loginMap.put("userid", userid);
		loginMap.put("userpw", userpw);
	
		
		return sqlSession.selectOne(namespace+".readLogin", loginMap);
	}

}
