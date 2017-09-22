package com.frontend.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.backend.Service.ProductService;
import com.backend.model.Customer;
import com.backend.model.Product;

@Controller
public class AdminController {
private ProductService pservice;
@Autowired
public void setPersonService(ProductService ps){
	this.pservice= ps;
}
@RequestMapping(value = "/products", method = RequestMethod.GET)
public String listProducts(Model model) {
	
	model.addAttribute("product", new Product());
	model.addAttribute("listproducts", this.pservice.viewAllProduct());
	return "admin";
}
@RequestMapping(value = "/admin", method = RequestMethod.GET)
public String adminlistProducts(Model model) {
	model.addAttribute("product", new Product());
	model.addAttribute("listproducts", this.pservice.viewAllProduct());
	return "admin";

}
@RequestMapping(value = "/admin/newProduct", method = RequestMethod.GET)
public ModelAndView newProduct(ModelAndView model) {
    Product product = new Product();
    model.addObject("product", product);
    model.setViewName("addproduct");
    return model;
}

//For add and update Product both
@RequestMapping(value= "/admin/products/add", method = RequestMethod.POST)
public String addProduct(@ModelAttribute("product") Product p)
{
	/*
	if(p.getPid() == 0){                                                   
		//new Product, add it
		this.pservice.insertservice(p);
		
	}else{*/
		//existing Product, call update
		this.pservice.updateservice(p);
	
	return "redirect:/admin";
}
@RequestMapping("/admin/remove/{pid}")
public String removeProduct(@PathVariable("id") int id){
	
    this.pservice.deleteservice(id);
    return "redirect:/admin";
}

@RequestMapping("/admin/edit/{id}")
public String editProduct(@PathVariable("id") int id, Model model){
	
    model.addAttribute("product", this.pservice.viewbyidProduct(id));
    model.addAttribute("listproducts", this.pservice.viewAllProduct());
    return"admin";
}
@RequestMapping(value = "/admin/addProduct", method = RequestMethod.POST)
public String saveProduct(@ModelAttribute ("product")Product p) {
   /* if (product.getPid() == 0) { 
    	if(!product.getFile().isEmpty()){
    		try{
    		byte[] bytes = product.getFile().getBytes();
    		// Creating the directory to store file
			String rootPath = System.getProperty("catalina.home");
			File dir = new File(rootPath + File.separator + "tmpFiles");
			if (!dir.exists()){
				dir.mkdirs();}
			// Create the file on server
			File serverFile = new File(dir.getAbsolutePath()+ File.separator + product.getFile().getOriginalFilename());
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			System.out.println("File uploaded"); 
    		}catch(Exception e){
    		System.out.println("You failed to upload " + e.getMessage()); 
    		}
    	}
    	else{
    		System.out.println("File is empty");
    	}
        pservice.insertservice(product);
    } else {
    	if(!product.getFile().isEmpty()){
    		try{
    		byte[] bytes = product.getFile().getBytes();
    		// Creating the directory to store file
			String rootPath = System.getProperty("catalina.home");
			File dir = new File(rootPath + File.separator + "tmpFiles");
			if (!dir.exists()){
				dir.mkdirs();}
			// Create the file on server
			File serverFile = new File(dir.getAbsolutePath()+ File.separator + product.getFile().getOriginalFilename());
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			System.out.println("File uploaded"); 
    		}catch(Exception e){
    		System.out.println("You failed to upload " + e.getMessage()); 
    		}
    	}
    	else{
    		System.out.println("File is empty");
    	}
        pservice.updateservice(product);
    }
    return new ModelAndView("redirect:/admin");
}*/

	this.pservice.insertservice(p);
	return("admin");
}

}
