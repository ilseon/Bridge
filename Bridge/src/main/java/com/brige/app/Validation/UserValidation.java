package com.brige.app.Validation;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.brige.app.domain.UserVO;
import com.brige.app.persistence.UserDAO;




public class UserValidation implements Validator{

	@Inject
	private UserDAO dao;
	
	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return UserVO.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		UserVO user = (UserVO)arg0;
		
		if(user.getUserId() == null || user.getUserId().trim().isEmpty()){
			arg1.rejectValue("userid", "required");
		}
		if(user.getUserPassword() == null || user.getUserPassword().trim().isEmpty()){
			arg1.rejectValue("userpw", "required");
		}
		
	}

}
