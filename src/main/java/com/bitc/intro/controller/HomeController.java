package com.bitc.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.java.Log;

@Controller
@Log
public class HomeController {

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/qnalist")
	public String qnalist() {
		return "/qna/qnaBoardList";
		
	}
	
	@GetMapping("/qnaboardContent")
	public String qnaboardContent() {
		return "/qna/qnaboardContent";
		
	}
	
//	관광명소 추가하기 폼
	@GetMapping("/hotspotadd")
	public String hotspotadd() {
		return "/hotspot/hotspotadd";
		
	}
	
	
	@GetMapping("/searchDetails")
	public String searchDeatails() {
		
		return "/hotspot/hotspotdetail";
	}
	
	@GetMapping("/restaurantadd")
	public String restaurantadd() {
		
		return "/restaurant/restaurantadd";
	}
	
	@GetMapping("/restaurantmodify")
	public String restaurantmodify() {
		
		return "/restaurant/restaurantmodify";
	}
	
	@GetMapping("/admin")
	public String admin() {
		
		return "/manager/admin";
	}
	
	@GetMapping("/useradmin")
	public String useradmin() {
		
		return "/manager/useradmin";
	}
	
	
	
	
	
	
	@GetMapping("/test")
	public String test() {
		
		return "/test";
	}
}
