/*
작성자 - 김민정, 김우준
내용 - 로그인관련 서비스
시작날짜 - 2016/07/18
수정날짜 - 2016/07/25
	  -2016/08/04
변경내용 - id 및 password 찾기
	  - 회원가입 validation 추가
*/

package com.bridge.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bridge.app.domain.UserVO;
import com.bridge.app.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO dao;
	

	@Override
	public UserVO readLogin(String userid, String userpw) throws Exception {
		// ��Ʈ�ѷ��� dao�� ��������
		System.out.println("����");
		return (UserVO)dao.readLogin(userid, userpw);
	}


	@Override
	public UserVO searchId(String username, String userbirthday) throws Exception {
		// ���̵� ã��
		System.out.println("id ã��");
		return dao.searchId(username, userbirthday);
	}


	@Override
	public UserVO searchPassword(String userid, String useremail) throws Exception {
		System.out.println("password service");
		return dao.searchPassword(userid, useremail);
	}


	@Override
	public void insertUser(UserVO vo) throws Exception {
		dao.insertUser(vo);
		
	}


	@Override
	public UserVO readUser(String userId) throws Exception {
		return dao.readUser(userId);
	}


	@Override
	public String passwordCheck(int usernumber) throws Exception {		
		return dao.passwordCheck(usernumber);
	}


	@Override
	public List<UserVO> selectAll(int usernumber) throws Exception {
		return dao.selectAll(usernumber);
	}


	@Override
	public void update(UserVO user, int usernumber) throws Exception {
		dao.update(user, usernumber);
	}


	@Override
	public void remove(int usernumber) throws Exception {
		dao.remove(usernumber);
	}


	@Override
	public void update_pw(UserVO vo) throws Exception {
		dao.update_pw(vo);
	}
}