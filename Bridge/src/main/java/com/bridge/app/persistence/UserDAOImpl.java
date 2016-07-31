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
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.bridge.app.domain.UserVO;
import com.bridge.app.utill.UserValidation;

@Repository
public class UserDAOImpl implements UserDAO {
	
	
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.bridge.mappers.loginMapper";
	private static final String NAMESPACE="com.bridge.mappers.UserMapper";
	

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
	//아이디를 추가하는 메서드
	@Override
	public void insertUser(UserVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertUser", vo);

		
	}
	//아이디를 읽어오는 메서드
	@Override
	public UserVO readUser(@Validated String userId, BindingResult result) throws Exception {
		System.out.println("dao");
		Map<String, String> loginMap = new HashMap<String, String>();
		loginMap.put("userId", userId);
		try{
			UserVO vo1=sqlSession.selectOne(NAMESPACE + ".readUser", loginMap);
			System.out.println(vo1.getUserId()+"1111");
			/*if(vo1.getUserId()!=null){
				result.rejectValue("userId", "regist");
			}*/
		}catch(Exception e){
			System.out.println(""+e);
			
		}
		return sqlSession.selectOne(NAMESPACE + ".readUser", loginMap);
	}
	
	@InitBinder
	private void initBinder(WebDataBinder binder){
		binder.setValidator(new UserValidation());
	}

}
