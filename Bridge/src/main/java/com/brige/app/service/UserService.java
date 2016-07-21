package com.brige.app.service;

import com.brige.app.domain.UserVO;

public interface UserService {
	
	public UserVO readLogin(String userid, String userpw) throws Exception;
	

}
