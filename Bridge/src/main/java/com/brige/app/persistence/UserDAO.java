package com.brige.app.persistence;

import com.brige.app.domain.UserVO;

public interface UserDAO {
	
	public void insertUser (UserVO vo) throws Exception;
	public UserVO readUser (String userId)throws Exception;
}
