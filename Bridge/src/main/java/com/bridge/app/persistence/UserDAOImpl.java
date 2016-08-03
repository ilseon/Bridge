/*
작성자 - 김민정
내용 - 로그인관련 서비스
시작날짜 - 2016/07/18
수정날짜 - 2016/07/25
변경내용 - id 및 password 찾기
*/


package com.bridge.app.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bridge.app.controller.HomeController;
import com.bridge.app.controller.MyPageController;
import com.bridge.app.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	
	@Inject
	private SqlSession sqlSession;

	private static final String namespace ="com.bridge.mappers.loginMapper";
	private static final String NAMESPACE ="com.bridge.mappers.UserMapper";

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
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

	@Override
	public void insertUser(UserVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertUser", vo);	
	}

	@Override
	public UserVO readUser(String userId) throws Exception {
		return (UserVO)sqlSession.selectOne(NAMESPACE + ".readUser");
	}

	@Override
	public String passwordCheck(int usernumber) throws Exception {
		
		String userPassword = sqlSession.selectOne(namespace + ".PasswordCheck", usernumber);
		UserVO user = new UserVO();		
		user.setUserPassword(userPassword);
		
		return userPassword;
	}

	@Override
	public List<UserVO> selectAll(int usernumber) throws Exception {	
		
		 return sqlSession.selectList(namespace+".selectAll", usernumber);
	}

	@Override
	public void update(UserVO user, int usernumber) throws Exception {
		
		user.setUserNumber(usernumber);
		user.setUserPhone(user.getTel1()+"-"+user.getTel2()+"-"+user.getTel3());
		user.setUserEmail(user.getUseremail1()+user.getUseremail2());
	
		logger.info(user.getUserPhone());
		
		sqlSession.update(namespace+".update", user);
		
	}

	@Override
	public void remove(UserVO user) throws Exception {
		
		sqlSession.delete(namespace+".remove", user);
	}		
}
