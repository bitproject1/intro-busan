package com.bitc.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	
	//고객관리화면
	@GetMapping("admin")
	public String admin() {
		
		
		return "/manager/adim";
	}
}
