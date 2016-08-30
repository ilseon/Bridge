package com.bridge.app.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bridge.app.domain.UserVO;
import com.bridge.app.service.UserService;
import com.bridge.app.utill.UserValidation;


@Controller
public class UserController {
   private static final Logger logger = LoggerFactory.getLogger(UserController.class);

   @Inject
   private UserService Service;
   
/*   @Autowired
   private BCryptPasswordEncoder bcrypt;*/

   @RequestMapping(value="/user.add", method=RequestMethod.GET)
   public String user_add_get(String check, HttpServletRequest req) {
      req.setAttribute("check_id", check);
      System.out.println("ㅇ????");
      logger.info(check);
      return "/user/user";
   }
   @RequestMapping(value="/user.add", method=RequestMethod.POST)
   public ModelAndView user_add_post(UserVO vo, String id_c, String userpassword)throws Exception{
      vo.setUserPassword(userpassword);
      vo.setUserId(id_c);
      vo.setUserBirthday(vo.getYear() + "-" + vo.getMonth() + "-" + vo.getDay());
      vo.setUserPhone(vo.getTel1() + "-" + vo.getTel2() + "-" + vo.getTel3());
      vo.setUserEmail(vo.getUseremail1() + vo.getUseremail2());
      
      vo.setUserType(0);
      logger.info("user : " + vo.getUserName());
      Service.insertUser(vo);
      ModelAndView mav = new ModelAndView("/user/User_add_compleate");
      mav.addObject("username", vo.getUserName());
      
      return mav;
   }
   
   @RequestMapping(value="/id_check", method=RequestMethod.GET)
   public String user_id_check(@Validated UserVO vo, BindingResult result, HttpServletRequest req) throws Exception{
      /*logger.info("id_check");
      UserVO vo = new UserVO();
      vo.setUserId(userId);*/
      logger.info("id : " + vo.getUserId());
      if(result.hasErrors()){
         logger.info("result.hasError");
         return "user/user";
      }
      UserVO vo1=null;
   
         try{
            vo1 =Service.readUser(vo.getUserId()+"");   
            /*logger.info(vo1.getUserId()+"78978979");*/
         }catch(Exception e){
            
               
               logger.info(e+"");
               if(e.toString().contains("Null")){
                  logger.info("null예외잡음");
               }else{
                  logger.info("여기");
                  result.reject("regist");
                  return "user/user";
               }
            
            
         }
   
      
      req.setAttribute("check_id", vo.getUserId());
      
      return "user/user";
      }
   
   @InitBinder
   private void initBinder(WebDataBinder binder){
      binder.setValidator(new UserValidation());
   }
}