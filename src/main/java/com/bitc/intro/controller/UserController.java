package com.bitc.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@GetMapping("login")
	public String LoginForm() {
		return "login";
	}
	
	
	@PostMapping("login")
	public String Login() {
		return "redirect:/";
	}
	
	@GetMapping("join")
	public String registForm(){
		return "join";
	}
	
	@PostMapping("join")
	public String regist() {
		return "redirect:/login";
	}
}
