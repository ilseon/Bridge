package com.brige.app.persistence;

import org.springframework.stereotype.Repository;

import com.brige.app.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Override
	public UserVO readLogin(String userid, String userpw) throws Exception {
		// �Է¹��� userid�� pw�� ���Ͽ� �α����� ���ִ� �޼���
		return null;
	}

}
