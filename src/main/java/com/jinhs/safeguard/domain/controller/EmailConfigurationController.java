package com.jinhs.safeguard.domain.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jinhs.safeguard.handler.ConfigureHandler;

@RequestMapping("/emailConfigure")
@Controller
public class EmailConfigurationController {
	@Autowired
	ConfigureHandler configureHandler;
	
	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	public ModelAndView signIn(@RequestParam("userId") String userId){
		List<String> emailList = configureHandler.getAlertEmailList(userId);
		ModelAndView model = new ModelAndView("alertemaillist");
		model.addObject("emailList", emailList);
		model.addObject("userId", userId);
		return model;
	}
	
	@RequestMapping(value = "/addEmail", method = RequestMethod.POST)
	public ModelAndView addEmail(@RequestParam("userId") String userId, @RequestParam("email") String email){
		configureHandler.insertAlertEmail(userId, email);
		List<String> emailList = configureHandler.getAlertEmailList(userId);
		ModelAndView model = new ModelAndView("alertemaillist");
		model.addObject("emailList", emailList);
		model.addObject("userId", userId);
		return model;
	}
	
	@RequestMapping(value = "/deleteEmail", method = RequestMethod.GET)
	public ModelAndView deleteEmail(@RequestParam("userId") String userId, @RequestParam("email") String email){
		configureHandler.deleteAlertEmail(userId, email);
		List<String> emailList = configureHandler.getAlertEmailList(userId);
		ModelAndView model = new ModelAndView("alertemaillist");
		model.addObject("emailList", emailList);
		model.addObject("userId", userId);
		return model;
	}
}
