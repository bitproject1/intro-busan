package com.bitc.intro.controller;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.compiler.ast.InstanceOfExpr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intro.domain.CalCoords;
import com.bitc.intro.domain.Coords;
import com.bitc.intro.domain.Grade;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.domain.Review;
import com.bitc.intro.service.RestaurantService;
import com.bitc.intro.service.ReviewService;

import lombok.extern.java.Log;

@Controller
@Log
public class HomeController {
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/test")
	public String kakaotest(Model model,HttpServletResponse response) {
		
		response.addHeader("Set-Cookie", "Test3=TestCookieValue3;   Secure; SameSite=None");
		
		Restaurant restaurant=restaurantService.getRestaurantById(236);
		System.out.println(restaurant.getAddress());
		model.addAttribute("restaurant", restaurant);
		
		
		
		
		return "test";
		
	}
	
	@PostMapping("/checkCoords")
	@ResponseBody
	public String checkCoords(Model model,@RequestBody Coords coords) {
		
		double lat1 = coords.getDesY(); //식당 경도
		double lat2 = coords.getMyY();	//내 위치 경도	
		double lon1 = coords.getDesX(); //식당 위도
		double lon2 = coords.getMyX();	//내 위치 위도
		
		//두 좌표간 거리를 구하기 위한 메소드
		double distanceOf2location = CalCoords.geoDistance(lat1, lon1, lat2, lon2);
		System.out.println(distanceOf2location);
		coords.setDistance(distanceOf2location);
		return "success";
		
	

		
	}
	
	
	@GetMapping("/restaurantdetailtest")
	public String resttest(Model model) {
		
		
		return "restaurantdetailtest";
		
	}
	
	
	
	
	/* 별점주기 Review저장*/
	@PostMapping("insert")
	@ResponseBody
	public String getReview(@RequestBody Review review) {
		
		
		System.out.println(review.getGrade());
		
		if(review.getGrade() instanceof Grade) {
			System.out.println("리뷰의 그레이드는  enum형입니다.");
		}
		 
		

		/*
		 * switch(review.getGrade()) { case "1": review.setGrade(grade.STAR1); break;
		 * case "2": review.setGrade(grade.STAR1); break; case "3":
		 * review.setGrade(grade.STAR1); break; case "4": review.setGrade(grade.STAR1);
		 * break; case "5": review.setGrade(grade.STAR1); break;
		 * 
		 * 
		 * default: return null; break; }
		 */
		reviewService.insert(review); 
		
		return "success";
	} 
	
}
