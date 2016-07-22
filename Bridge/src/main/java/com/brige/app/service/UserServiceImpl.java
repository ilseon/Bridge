package com.brige.app.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.brige.app.domain.UserVO;
import com.brige.app.persistence.UserDAO;

public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	
	@Override
	public void insertUser(UserVO vo) throws Exception {
		dao.insertUser(vo);

	}

	@Override
	public UserVO readUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.readUser(userId);
	}

}
