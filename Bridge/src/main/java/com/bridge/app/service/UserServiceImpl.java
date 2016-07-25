/*
작성자 - 김민정
내용 - 로그인관련 서비스
시작날짜 - 2016/07/18
수정날짜 - 2016/07/25
변경내용 - id 및 password 찾기
*/

package com.bridge.app.service;

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






}
