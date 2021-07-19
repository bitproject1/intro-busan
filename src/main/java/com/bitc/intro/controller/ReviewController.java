package com.bitc.intro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitc.intro.domain.Review;
import com.bitc.intro.service.ReviewService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@RequestMapping("/review/*")
@RestController
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	// 댓글 추가
	@PostMapping("insert")
	public String insert(@RequestBody Review reivew) {

		reviewService.insert(reivew);
		return "success";
	}

	// 댓글리스트
	
	@GetMapping(value = "commentList", produces = "application/text;charset=utf8")
	public String list(int id) {
		List<Review> rlist = reviewService.getList(id);
		System.out.println(rlist.toString());

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String rlist2Json = gson.toJson(rlist);
		
		return rlist2Json;
	}

	// 댓글 삭제
	@DeleteMapping("delete/{rid}")
	public int delete(@PathVariable int id) {
		System.out.println(id);
			
		reviewService.delete(id);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String clist2Json = gson.toJson(id);
		System.out.println(id);
		
		
		return id;
	}
	
	
	//별점 
}
