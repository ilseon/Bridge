package com.bridge.app.persistence;

import com.bridge.app.domain.UserVO;

public interface UserDAO {

	public UserVO readLogin(String userid, String userpw) throws Exception;
	public UserVO searchId(String username, String userbirthday) throws Exception;
	public UserVO searchPassword(String userid, String useremail) throws Exception;
	
	
	
}
