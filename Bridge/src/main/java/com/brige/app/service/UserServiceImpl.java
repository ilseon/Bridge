package com.brige.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brige.app.domain.UserVO;
import com.brige.app.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO dao;
	

	@Override
	public UserVO readLogin(String userid, String userpw) throws Exception {
		// 컨트롤러와 dao를 연결해줌
		System.out.println("서비스");
		return (UserVO)dao.readLogin(userid, userpw);
	}

}
