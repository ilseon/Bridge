/*
작성자 - 김민정
내용 - 로그인 유효성 검사
시작날짜 - 2016/07/18
수정날짜 - 
변경내용 - 
*/

package com.bridge.app.utill;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.bridge.app.domain.UserVO;
import com.bridge.app.persistence.UserDAO;

public class LoginValidation implements Validator{
	
	@Inject
	private UserDAO dao;
	

   @Override
   public boolean supports(Class<?> arg0) {
      // �ش� Ŭ������ ��ȿ�� �˻縦 �� �� �̴� ��������(true/false return)
      return UserVO.class.isAssignableFrom(arg0);
      //�ش� Ŭ������ ��ȿ�� �˻縦 �� �� �ִ� ���������� ������
   }

   @Override
   public void validate(Object arg0, Errors arg1) {
      // Errors : ������ �߻����� �� ������ �����ϱ� ���� ��ü(�����ϱ� ����), ���� �� ���߿� ��Ƽ� ó��
      
	  UserVO vo = (UserVO)arg0;
	  
	  if(vo.getUserId() == null || vo.getUserId().trim().isEmpty()){
		  arg1.rejectValue("userid", "required");
	  }
	  if(vo.getUserPassword() == null || vo.getUserPassword().trim().isEmpty()){
		  arg1.rejectValue("userpw", "required");
	  }
	  
	  try{
		  dao.readLogin(vo.getUserId(), vo.getUserPassword());
		  
		  
	  }catch(Exception err){
		  arg1.reject("login");
	  }
	   
	  
	  
	  
   }
   
}








