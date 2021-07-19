package com.bitc.intro.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import com.bitc.intro.domain.AttachVO;
import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.HotspotDetailVO;
import com.bitc.intro.domain.PageDTO;
import com.bitc.intro.domain.PageDTODetail;
import com.bitc.intro.service.HotspotService;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/hotspot/*") // hotspot컨트롤러에서 index페이지 타기 문제
@Log
public class HotspotController {
	
	@Autowired
	private HotspotService hotspotService;
	
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
	public String hotspotDetail(Model model, int id, @ModelAttribute("pageNum") String pageNum ,CriteriaDetail criDetail) {
		//http://localhost:8888/hotspot/detail/
		// 관광지 1건 가져오기
		Hotspot hotspot = hotspotService.getHotspot(id);
		System.out.println(hotspot.toString());
		// 식당 전체가져오기
		HotspotDetailVO hotspotDetailVO = new HotspotDetailVO();
		hotspotDetailVO.setId(id);
		hotspotDetailVO.setPageNum(criDetail.getPageNum());
		hotspotDetailVO.setAmount(criDetail.getAmount());
		Hotspot restaurants = hotspotService.getRestsWithPaging(id);
		System.out.println(restaurants);
		// board.setHitcount(board.getHitcount()+1); // OSIV = true 여기 있음 안댐
		int totalCount = hotspotService.getTotalCountBySpotId(id);
		
		PageDTODetail pageMaker = new PageDTODetail(criDetail, totalCount);
		model.addAttribute("hotspot", hotspot);
		model.addAttribute("restaurants", restaurants);
		model.addAttribute("pageMaker", pageMaker);
		//System.out.println(board.getComments().get(0));
		return "/hotspot/hotspotdetail";
	}
	
	// 맛집 등록 페이지로 이동
	@GetMapping("add")
	public String hotspotAdd(@ModelAttribute("pageNum") String pageNum) { //pageNum 넘겨주기
		return "hotspot/hotspotadd";
	}
	
	@PostMapping("add")
	public String hotspotAdd(Hotspot hotspot, HttpServletRequest request, String pageNum,
			List<MultipartFile> files) throws Exception {
		
		
		log.info("files 매개변수 : " + files);
		
		if (files != null) {
			log.info("업로드한 파일 개수 : " + files.size());
		}
		// 파일 업로드 작업 시작
		String realPath = request.getSession().getServletContext().getRealPath("/");
		realPath += "resources/uploadimages/"; // 이미지 저장 패스 생성!
		System.out.println(realPath);
		
		File uploadPath = new File(realPath, getDateFolder()); // 폴더 동적으로 생성하기
		
		if (!uploadPath.exists()) { // 실제 업로드패스가 존재하는지 확인 메소드
			uploadPath.mkdirs(); // 없으면 경로에 폴더를 맹글고 진행해라
		}
		
		List<AttachVO> attachList = new ArrayList<AttachVO>(); // attach 테이블에 저장할 attach 객체 list
//		System.out.println(hotspot.toString());
//		hotspotService.insert(hotspot); // attach랑 트랜잭션 처리 전
		
		
		return "redirect:/hotspot/list";
	}
	
	private String getDateFolder() { // 날짜형태 폴더명 생성 메소드
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str;
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
