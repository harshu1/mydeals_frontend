package com.frontend.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.backend.Service.CustomerService;
import com.backend.Service.ProductService;
import com.backend.model.Customer;
import com.backend.model.Product;
@Controller
public class MainController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getdata() {
     		//return back to index.jsp
		ModelAndView model = new ModelAndView("index");
			return model;

}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout() {
     		//return back to index.jsp
		ModelAndView model = new ModelAndView("index");
			return model;

}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
		@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}	
		private ProductService pservice;
	@Autowired
	public void setPersonService(ProductService ps){
		this.pservice= ps;
	}
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String listProducts(Model model) {
		
		model.addAttribute("product", new Product());
		model.addAttribute("listproducts", this.pservice.viewAllProduct());
		return "user";
	}


	private CustomerService cservice;
	@Autowired
	public void setPersonService(CustomerService cs){
		this.cservice= cs;
	}
	/*@RequestMapping(value = "/shipping", method = RequestMethod.GET)
	public String listProducts(Model model) {
		
		model.addAttribute("product", new Product());
		model.addAttribute("lists", this.cservice.viewbyidUser(id));
		return "shipping";
	}*/
	  @RequestMapping(value = "/registeration", method = RequestMethod.GET)
	   public String user(Model model) {
		  Customer form = new Customer();
          model.addAttribute("user", form);
         return "register";
	   }
	   @RequestMapping(value = "/registeration/adduser", method = RequestMethod.POST)
	   public String addUser(@ModelAttribute("user")@Valid Customer user, BindingResult result) {
	       
		   if(result.hasErrors()) 
          {
              return "register";
          }
        cservice.insertservice(user);
	   return "user";
	   }	         	      }



