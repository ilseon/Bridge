package com.bridge.app.utill;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.bridge.app.domain.UserVO;
import com.bridge.app.persistence.UserDAO;
import com.bridge.app.service.UserService;

public class UserValidation implements Validator{
	
	@Inject
	private UserDAO dao;


   @Override
   public boolean supports(Class<?> arg0) {
     
      return UserVO.class.isAssignableFrom(arg0);
      
   }

   @Override
   public void validate(Object arg0, Errors arg1) {
            
	  UserVO vo = (UserVO)arg0;
	  System.out.println(vo.getUserId()+"validation");
	  String id=vo.getUserId();
	  try {
		  	if(dao.readUser(id, null)!=null){
		  		arg1.rejectValue("userId", "regist");
		  	}
		} catch (Exception e) {
			System.out.println(id+"catch");
			System.out.println(e+"   validation");
		}
	  
	  /*if(vo.getUserId() == null || vo.getUserId().trim().isEmpty()){
		  System.out.println("userID"+vo.getUserId());
		  arg1.rejectValue("userId", "required");
	  }else{
	  
		
	  }*/

   }
   
}







