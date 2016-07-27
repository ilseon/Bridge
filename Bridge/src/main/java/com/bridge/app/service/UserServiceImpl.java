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
		return (UserVO)dao.readLogin(userid, userpw);
	}

	@Override
	public UserVO searchId(String username, String userbirthday) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO searchPassword(String userid, String useremail) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUser(UserVO vo) throws Exception {
		dao.insertUser(vo);
		
	}

	@Override
	public UserVO readUser(String userid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
