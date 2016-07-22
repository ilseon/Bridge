package com.brige.app.service;

import com.brige.app.domain.UserVO;


public interface UserService {

	public void insertUser(UserVO vo) throws Exception;
	public UserVO readUser(String userid) throws Exception;
}
