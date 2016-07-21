package com.brige.app.utill;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.brige.app.domain.UserVO;
import com.brige.app.persistence.UserDAO;

public class LoginValidation implements Validator{
	
	@Inject
	private UserDAO dao;
	

   @Override
   public boolean supports(Class<?> arg0) {
      // 해당 클래스가 유효성 검사를 할 수 이는 상태인지(true/false return)
      return UserVO.class.isAssignableFrom(arg0);
      //해달 클래스가 유효성 검사를 할 수 있는 상태인지를 돌려줌
   }

   @Override
   public void validate(Object arg0, Errors arg1) {
      // Errors : 에러가 발생했을 때 정보를 수집하기 위한 객체(저장하기 위한), 수집 후 나중에 모아서 처리
      
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








