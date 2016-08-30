/*
작성자 - 김민정
내용 - 로그인관련 서비스
시작날짜 - 2016/07/18
수정날짜 - 2016/07/25
변경내용 - id 및 password 찾기
*/

package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.UserVO;

public interface UserDAO {

	public UserVO readLogin(String userid, String userpw) throws Exception;
	public UserVO searchId(String username, String userbirthday) throws Exception;
	public UserVO searchPassword(String userid, String useremail) throws Exception;
	
	public void insertUser (UserVO vo) throws Exception;
	public UserVO readUser (String userId)throws Exception;
	public String passwordCheck(int usernumber) throws Exception;
	public List<UserVO> selectAll(int usernumber)throws Exception;
	
	//추가
	public void update(UserVO user, int usernumber) throws Exception;	
	public void remove(int usernumber) throws Exception;
	
	public void update_pw(UserVO vo) throws Exception;
}
