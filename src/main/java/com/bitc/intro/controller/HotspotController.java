package com.bitc.intro.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.PageDTO;
import com.bitc.intro.domain.PageDTODetail;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.service.HotspotService;
import com.bitc.intro.service.RestaurantService;

@Controller
@RequestMapping("/hotspot/*") // hotspot컨트롤러에서 index페이지 타기 문제
public class HotspotController {
	
	@Autowired
	private HotspotService hotspotService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	// 관광지 전체보기 / 메인화면
	@GetMapping("list")
	public String hotspotList(Model model, Criteria cri) {
		List<Hotspot> hotspotList = hotspotService.getHotspotsWithPaging(cri);
		
		int totalCount = hotspotService.getTotalCount();
		
		PageDTO pageDTO = new PageDTO(cri, totalCount);
		
		model.addAttribute("hotspotList", hotspotList);
		model.addAttribute("pageMaker", pageDTO);
		
		return "index";
	}
	
	// 관광지 1건 상세보기
	// 관광지 정보, 식당 목록이 보여야한다.
	@GetMapping("detail")
	public String hotspotDetail(Model model, int id, CriteriaDetail cri) {
		//http://localhost:8888/hotspot/detail/
		// 관광지 1건 가져오기
		Hotspot hotspot = hotspotService.getHotspot(id);
		// 식당 전체가져오기
		List<Restaurant> Restaurants = restaurantService.getRestaurantsBySpotIdWithPage(hotspot, cri);
		// board.setHitcount(board.getHitcount()+1); // OSIV = true 여기 있음 안댐
		int totalCount = restaurantService.getTotalCountBySpotId(id);
		
		PageDTODetail pageMaker = new PageDTODetail(cri, totalCount);
		model.addAttribute("hotspot", hotspot);
		model.addAttribute("Restaurants", Restaurants);
		model.addAttribute("pageMaker", pageMaker);
		//System.out.println(board.getComments().get(0));
		return "/hotspot/hotspotdetail";
	}
	
	@GetMapping("add")
	public String hotspotAdd() {
		return "hotspot/hotspotAdd";
	}
	
	@PostMapping("add")
	public String hotspotAdd(Hotspot hotspot) {
		hotspotService.insert(hotspot);
		return "rediect:";
	}
	
	//수정페이지 이동
	@GetMapping("modify/{id}")
	public String hotspotmodify(Model model, @PathVariable int id) {
		Hotspot hotspot = hotspotService.getHotspot(id);
		model.addAttribute("hotspot", hotspot);
		return "hotspot/hotspotmodify";
	}
	
	//수정하기
	@PutMapping("modify")
	@ResponseBody // 문자열 리턴하기 위해서 어노테이션 붙히기 ajax에 success 라는 문자열을 리턴해줘야한다
	public String modify(@RequestBody Hotspot hotspot) {
		hotspotService.updateHotspotById(hotspot);
		return "success"; // 문자열을 리턴해야한다 jsp가 아니라
	}
		
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public String delete(@PathVariable int id) {
		hotspotService.deleteHotspotById(id);
		return "success";
	}
	
	
}
