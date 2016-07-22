

package com.bridge.app.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.persistence.AlbumDAOImpl;
import com.bridge.app.service.LikeService;
import com.bridge.app.service.MusicService;
import com.bridge.app.controller.HomeController;

@Controller
public class HomeController {
	   
	   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	   
	   @RequestMapping(value = "/")
	   public String home() {
	      logger.info("It is Main");
	      return "home";
	   }
	   		
}

