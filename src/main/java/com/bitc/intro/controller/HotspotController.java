package com.bitc.intro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.service.HotspotService;

@Controller
@RequestMapping("/hotspot/*")
public class HotspotController {
	
	@Autowired
	private HotspotService hotspotService;
	
	@GetMapping("list")
	public String hotspotList() {
		return "index";
	}
	
	// 관광지 1건 상세보기 
	@GetMapping("searchDetails/{num}")
	public String searchDetails(Model model, @PathVariable int num) {
		Hotspot hotspot = hotspotService.findById(num);
		// board.setHitcount(board.getHitcount()+1); // OSIV = true 여기 있음 안댐
		model.addAttribute("hotspot", hotspot);
		//System.out.println(board.getComments().get(0));
		return "/board/detail";
	}
}
