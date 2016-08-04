/*
작성자 - 
내용 -
시작날짜 - 
수정날짜 - 
변경내용 - 
*/

package com.bridge.app.utill;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.bridge.app.controller.UserController;
import com.bridge.app.domain.UserVO;
import com.bridge.app.persistence.UserDAO;

public class UserValidation implements Validator{
	
	@Inject
	private UserDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(UserValidation.class);
	

   @Override
   public boolean supports(Class<?> arg0) {
      return UserVO.class.isAssignableFrom(arg0);
   }

   @Override
   public void validate(Object arg0, Errors arg1) {
      
	  UserVO vo = (UserVO)arg0;
	  UserVO v2 = null;
	  
	  if(vo.getUserId() == null || vo.getUserId().trim().isEmpty()){
		  arg1.rejectValue("userId", "required");
	  }
	  
	  try{
		  v2=dao.readUser(vo.getUserId()+"");
	  }catch(Exception err){
		 try{
			  logger.info(v2.getUserId());
			  logger.info("!!!"+vo.getUserId());
			  arg1.reject("regist");
		  }catch(NullPointerException e){
			  logger.info("nullpointer");
		  }
	  }
	   
	  
	  
   }
   
}

