package com.bitc.intro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.service.RestaurantService;

@Controller
@RequestMapping("/restaurant/*")
public class RestaurantController {
	// 식당 상세보기 , 식당글 쓰기 , 식당 리뷰보기, 
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("detail/{id}")
	public String restaurantDetail(@PathVariable int id) {
		restaurantService.getRestaurantById(id);
		return "restDetail";
	}
	
	// 식당 추가
	@GetMapping("add")
	public String restaurantAdd() {
		return "restaurantadd";
	}
	
	// responseEntity 로 넘기기 변경전
	@PostMapping("add")
	public String restaurantAdd(Restaurant restaurant) {
		restaurantService.insert(restaurant);
		return "redirect: /restaurant/detail"; // 리다이렉트 디테일 id
	}
	
}
