/*
작성자 - 김민정
내용 - 로그인관련 서비스
시작날짜 - 2016/07/18
수정날짜 - 2016/07/25
변경내용 - id 및 password 찾기
*/


package com.bridge.app.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bridge.app.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.brige.mappers.loginMapper";
	

	// 아이디와 비밀번호로 로그인 하는 메서드
	@Override
	public UserVO readLogin(String userid, String userpw) throws Exception {
		
		System.out.println("dao");
		Map<String, Object> loginMap = new HashMap<String, Object>();
		loginMap.put("userid", userid);
		loginMap.put("userpw", userpw);
	
		return sqlSession.selectOne(namespace+".readLogin", loginMap);
	}

	//아이디를 찾는 메서드
	@Override
	public UserVO searchId(String username, String userbirthday) throws Exception {
		
		System.out.println("dao");
		Map<String, Object> idsearchMap = new HashMap<String, Object>();
		idsearchMap.put("username", username);
		idsearchMap.put("userbirthday", userbirthday);
		
		return sqlSession.selectOne(namespace+".searchId", idsearchMap);
	}
	
	//아이디를 찾는 메서드
	@Override
	public UserVO searchPassword(String userid, String useremail) throws Exception {
		
		System.out.println("dao");
		Map<String, Object> passwordsearchMap = new HashMap<String, Object>();
		passwordsearchMap.put("userid", userid);
		passwordsearchMap.put("useremail", useremail);
		System.out.println("되나요?");
		
		return sqlSession.selectOne(namespace+".searchPassword", passwordsearchMap);
	}

}
