package com.bridge.app.service;

import com.bridge.app.domain.UserVO;

public interface UserService {
	
	public UserVO readLogin(String userid, String userpw) throws Exception;
	

}