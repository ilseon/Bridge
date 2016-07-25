package com.bridge.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.UserVO;
import com.bridge.app.persistence.UserDAO;
import com.bridge.app.service.UserService;

@Controller
@SessionAttributes({"userid", "usernumber"})
public class LoginController {
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
      @Autowired
      private UserService service;
   
   //로그인을 해주는 메서드
   @RequestMapping(value="login", method=RequestMethod.POST)
   public String login(@Valid UserVO uservo, BindingResult result, Model model){
      logger.info("It is login : "+uservo.getUserId() );
      logger.info("It is login : "+uservo.getUserPassword() );
      
         if(result.hasErrors()){
            logger.info("login error ");
             return "home";
          }
         
          try {
             UserVO vo = service.readLogin(uservo.getUserId(), uservo.getUserPassword());
            
             System.out.println(vo.getUserNumber());
             
           model.addAttribute("userid", vo.getUserId());
           model.addAttribute("usernumber", vo.getUserNumber());
             logger.info("login se :  ");
             
          } catch (Exception e) { // 로그인 잘못됨   
             logger.info("login fail ");
             return "home";
          }      
          return "home";
   } 
    
   
   //아이디 비밀번호 찾기시에 페이지를 이동해주는 메서드
   @RequestMapping(value="loginsearch")
   public String loginSearch(){
      logger.info("It is loginsearch");
      return "/login/loginsearch";
   }
   
   //로그아웃을 해주는 메서드
     @RequestMapping("logout")
     public String logout(SessionStatus session){
        logger.info("It is logout");
       session.setComplete();
       return "redirect:/";
      }
     
    
     
     //아이디를 찾아주는 메서드
     @RequestMapping("searchid")
     public String  Searchid(){
        logger.info("It is id_search");

       return "/login/loginsearch";
      }

   
  

}