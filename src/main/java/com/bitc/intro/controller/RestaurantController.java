package com.bitc.intro.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intro.domain.CalCoords;
import com.bitc.intro.domain.Coords;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.domain.User;
import com.bitc.intro.service.RestaurantService;
import com.bitc.intro.service.UserService;

@Controller
@RequestMapping("/restaurant/*")
public class RestaurantController {
	// 식당 상세보기 , 식당글 쓰기 , 식당 리뷰보기,
	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private UserService userService;

	// 식당 상세보기
	@GetMapping("detail/{id}")
	public String restaurantDetail(@PathVariable int id, HttpSession session, Model model) {
		Restaurant restaurant = (Restaurant) restaurantService.getRestaurantById(id);
		model.addAttribute("restaurant", restaurant);
		User user = (User) session.getAttribute("user");

		// 로그인을 했을 경우
		if (user != null) {
			int checkLove = userService.checkLoveIsPressed(user.getId(), restaurant.getRid());
			if (checkLove == 1) { // 좋아요 내역이 있음
				model.addAttribute("checkLove", 1);
			} else { // 좋아요를 누른적이 없음
				model.addAttribute("checkLove", 0);
			}
		}

		int loveCount = restaurantService.getLoveCount(restaurant.getRid());
		model.addAttribute("loveCount", loveCount);

		// 추천하는 연령 데이터를 전달
		Integer age = restaurantService.getRecommendationsByage(id);
		if (age != null) {
			model.addAttribute("age", age);
		}
		
		// 추천하는 성별 데이터를 전달
		String gender = restaurantService.getRecommendationsByGender(id);
		if(gender!=null) {
			model.addAttribute("gender", gender);
		}
		
		return "restaurant/restaurantdetail";
	}
	
	//지도 좌표를 받고 좌표간 거리를 받기위한 메소드
	@PostMapping("checkCoords")
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
