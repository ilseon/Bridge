
package com.bridge.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlayerController {

	@RequestMapping(value="player")
	@ResponseBody
	public ModelAndView showPlayer(@RequestParam String val) throws Exception{
		System.out.println(val);
		ModelAndView mav=new ModelAndView("/player/playertest");
		
		return mav;
	}
}
