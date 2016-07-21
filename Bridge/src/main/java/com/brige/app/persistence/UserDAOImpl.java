package com.brige.app.persistence;

import org.springframework.stereotype.Repository;

import com.brige.app.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Override
	public UserVO readLogin(String userid, String userpw) throws Exception {
		// 입력받은 userid와 pw를 비교하여 로그인을 해주는 메서드
		return null;
	}

}
