package com.brige.app.utill;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class LoginValidation implements Validator{

   @Override
   public boolean supports(Class<?> arg0) {
      // 해당 클래스가 유효성 검사를 할 수 이는 상태인지(true/false return)
      return false;
   }

   @Override
   public void validate(Object arg0, Errors arg1) {
      // Errors : 에러가 발생했을 때 정보를 수집하기 위한 객체(저장하기 위한), 수집 후 나중에 모아서 처리
      
   }
   
}








