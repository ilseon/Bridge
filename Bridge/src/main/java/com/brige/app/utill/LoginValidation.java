package com.brige.app.utill;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class LoginValidation implements Validator{

   @Override
   public boolean supports(Class<?> arg0) {
      // �ش� Ŭ������ ��ȿ�� �˻縦 �� �� �̴� ��������(true/false return)
      return false;
   }

   @Override
   public void validate(Object arg0, Errors arg1) {
      // Errors : ������ �߻����� �� ������ �����ϱ� ���� ��ü(�����ϱ� ����), ���� �� ���߿� ��Ƽ� ó��
      
   }
   
}








