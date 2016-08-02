/*
작성자 - 김민정
내용 - 로그인관련 서비스
시작날짜 - 2016/07/18
수정날짜 - 2016/07/25
변경내용 - id 및 password 찾기
*/


package com.bridge.app.service;

import com.bridge.app.domain.UserVO;

public interface UserService {
	
	public UserVO readLogin(String userid, String userpw) throws Exception;
	
	public UserVO searchId(String username, String userbirthday) throws Exception;
	
	public UserVO searchPassword(String userid, String useremail) throws Exception;
	
	public void insertUser(UserVO vo) throws Exception;
	public UserVO readUser(String userid) throws Exception;

	
}
