package com.first.controller;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class Home {
	@RequestMapping(value={"/","/index"}, method =RequestMethod.GET )
    public ModelAndView printHello()
    {
		ModelAndView model=new ModelAndView();
       model.setViewName("index");
       return model;
    }
    @RequestMapping("/login")
    public String login(ModelMap model)
    {
       model.addAttribute("message", "Hello Spring MVC Framework!");
       return "login";
    }
    @RequestMapping("/contact")
  	public String sayContact() {
		return "contact";
	}
@RequestMapping("/adminpage")
    public String admin(ModelMap model)
    {
	 model.addAttribute("product", "welcome to candyshop");
       return "adminpage";
    }
 }
