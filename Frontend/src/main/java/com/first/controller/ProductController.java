package com.first.controller;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.backend.Service.ProductService;
import com.backend.model.Product;

@Controller
public class ProductController {
	private ProductService productService;
		@RequestMapping(value = "/Product", method = RequestMethod.GET)
	public String listProducts(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("listProducts", this.productService.viewAllProduct());
		return "Product";
	}
	
	//For add and update productboth
	@RequestMapping(value= "/Product/add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("Product") Product p){
		
		if(p.getPid() == 0){
			//new Product, add it
			this.productService.insertservice(p);
		}else{
			//existing Product, call update
			this.productService. updateservice(p);
		}
		
		return "redirect:/Product";
		
	}
	
	@RequestMapping("/remove/{id}")
    public String removeProduct(@PathVariable("id") int id){
		
        this.productService.deleteservice(id);
        return "redirect:/Product";
    }
 
    @RequestMapping("/edit/{id}")
    public String editProduct(@PathVariable("id") int id, Model model){
        model.addAttribute("Product", this.productService.viewbyidProduct(id));
        model.addAttribute("listProducts", this.productService.viewAllProduct());
        return "Product";
    }
	
}
