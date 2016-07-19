package com.brige.app.persistence;

import com.brige.app.domain.UserVO;

public interface UserDAO {
	
	public void create (UserVO vo) throws Exception;

}
