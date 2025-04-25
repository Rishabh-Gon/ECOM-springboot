package com.example.ecom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/aboutus")
	public String aboutus() {
		return "aboutus";
	}
	
	@RequestMapping("/contactus")
	public String contactus() {
		return "contactus";
	}
	
	@RequestMapping("/Logout")
	public String Logout(HttpServletRequest request) 
	{
		request.getSession().invalidate();
		return "redirect:/";
	}
	
}
