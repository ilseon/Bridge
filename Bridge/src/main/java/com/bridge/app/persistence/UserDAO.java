package com.bridge.app.persistence;

import com.bridge.app.domain.UserVO;

public interface UserDAO {
	public UserVO readLogin(String userid, String userpw) throws Exception;
}
