package com.bitc.intro.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
import com.bitc.intro.domain.PageDTO;
<<<<<<< HEAD
=======
<<<<<<< HEAD
/*import com.bitc.intro.service.AttachService;*/
=======
import com.bitc.intro.domain.PageDTODetail;
import com.bitc.intro.domain.SearchCriteria;
>>>>>>> 5b5d0cea5b062ee947d290728f4ec910671664e7
import com.bitc.intro.service.AttachService;
>>>>>>> 900263c36c5a9b8a29aecf99bc3df8bd36fff5ce
import com.bitc.intro.service.HotspotService;
<<<<<<< HEAD
=======

import lombok.extern.java.Log;
>>>>>>> 5b5d0cea5b062ee947d290728f4ec910671664e7

@Controller
@RequestMapping("/hotspot/*")
@Log
public class HotspotController {
	
	@Autowired
	private HotspotService hotspotService;
	/*
	 * @Autowired private AttachService attachService;
	 */
	
	// 관광지 전체보기 / 메인화면
	@GetMapping("list")
	public String hotspotList(Model model, Criteria cri) {
		List<Hotspot> hotspotList = hotspotService.getHotspotsWithPaging(cri);
		
		int totalCount = hotspotService.getTotalCount();
		
		PageDTO pageDTO = new PageDTO(cri, totalCount);
		
		
		System.out.println(hotspotList);
		model.addAttribute("hotspotList", hotspotList);
		model.addAttribute("pageMaker", pageDTO);
		
		
		return "index";
	}
	
	// 관광지 1건 상세보기
	// 관광지 정보, 식당 목록이 보여야한다.
	@GetMapping("detail")
	public String hotspotDetail(Model model, @ModelAttribute("pageNum") String pageNum ,int id, CriteriaDetail criDetail) {
		//http://localhost:8888/hotspot/detail/
		// 관광지 1건 가져오기 식당 전체가져오기
		
		
		Hotspot hotspot = hotspotService.findById(id);
		System.out.println(hotspot);
		Hotspot restaurants = hotspotService.getRestsWithPaging(id, criDetail);
		int totalCount = hotspotService.getTotalCountBySpotId(id);
		PageDTODetail pageMaker = new PageDTODetail(criDetail, totalCount);
		// board.setHitcount(board.getHitcount()+1); // OSIV = true 여기 있음 안댐
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
	public String hotspotAdd(Hotspot hotspot, HttpServletRequest request,
			MultipartFile thumbnail,
			List<MultipartFile> files) throws Exception {
		
		int nextHId = hotspotService.nextHotspotId();
		
		log.info("files 매개변수 : " + files);
		
		if (files != null) {
			log.info("업로드한 파일 개수 : " + files.size());
		}
		// 파일 업로드 작업 시작
		String realPath = request.getSession().getServletContext().getRealPath("/");
		realPath += "resources/images/"; // 이미지 저장 패스 생성!
		System.out.println(realPath);
		
		File uploadPath = new File(realPath, getDateFolder()); // 폴더 동적으로 생성하기
		
		
		if (!thumbnail.isEmpty()) { // thumbnail이 있으면
			String originalFilename = thumbnail.getOriginalFilename(); // 실제 사용자가 업로드한 파일 이름
			
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid + "_" + originalFilename;
			
			thumbnail.transferTo(new File(uploadPath, uploadFilename));
			hotspot.setImg(uploadFilename); // 저장되면 hotspot의 img로 저장
		}
		
		List<AttachVO> attachList = new ArrayList<AttachVO>(); // attach 테이블에 저장할 attach 객체 list
//		System.out.println(hotspot.toString());
//		hotspotService.insert(hotspot); // attach랑 트랜잭션 처리 전
		
		if (!uploadPath.exists()) { // 실제 업로드패스가 존재하는지 확인 메소드
			uploadPath.mkdirs(); // 없으면 경로에 폴더를 맹글고 진행해라
		}
		for (MultipartFile multipartFile : files) {
			
			if (multipartFile.isEmpty()) {
				continue; // 없으면아무작업하지말고 빠져나가기
			}
			
			String originalFilename = multipartFile.getOriginalFilename(); // 실제 사용자가 업로드한 파일 이름
			
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid.toString() + "_" + originalFilename; // 같은 파일이라도 중복이 안되게 고유의 uuid를 붙혀서 저장한다
			
			// 파일 업로드 수행 파일 1개 업로드 수행완료
			multipartFile.transferTo(new File(uploadPath, uploadFilename)); // 업로드시에 i/o가 발생하기때문에 예외처리 필요
			
			AttachVO attachVO = new AttachVO();
			attachVO.setHid(nextHId);
			attachVO.setUuid(uuid.toString());
			attachVO.setUploadpath(getDateFolder()); //2021/06/16
			attachVO.setFilename(multipartFile.getOriginalFilename());
//			attachVO.setFiletype(isImageType(originalFilename) ? "I" : "O");
			
			// attachVO를 리스트에 추가
			attachList.add(attachVO);
			
		}
		
		// hotspot, attachVO 트랜잭션 처리
<<<<<<< HEAD
		/* hotspotService.insertHotspotAndAttaches(hotspot, thumbnailVO, attachList); */
		
		// 리다이렉트 시 서버로 다시 전달할 데이터를 저장하기
		rttr.addAttribute("num", hotspot.getId());
		rttr.addAttribute("pageNum", pageNum);
=======
		hotspotService.insertHotspotAndAttaches(hotspot, attachList);
>>>>>>> 900263c36c5a9b8a29aecf99bc3df8bd36fff5ce
		
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
<<<<<<< HEAD
		Hotspot hotspot = hotspotService.getHotspot(id);
		
		/*
		 * AttachVO thumbnail = attachService.getThumbnailByHno(id); List<AttachVO>
		 * imageList = attachService.getAttachesByHno(id);
		 */
		model.addAttribute("hotspot", hotspot);
		/*
		 * model.addAttribute("thumbnail",thumbnail); model.addAttribute("imageList",
		 * imageList);
		 */ 
=======
		Hotspot hotspot = hotspotService.findById(id);
		List<AttachVO> imageList = attachService.getAttachesByHno(id);
		model.addAttribute("hotspot", hotspot);
		model.addAttribute("imageList", imageList);
>>>>>>> 900263c36c5a9b8a29aecf99bc3df8bd36fff5ce
		return "hotspot/hotspotmodify";
	}
	
	//수정하기
	@PutMapping("modify")
	@ResponseBody // 문자열 리턴하기 위해서 어노테이션 붙히기 ajax에 success 라는 문자열을 리턴해줘야한다
	public String modify(@RequestBody Hotspot hotspot, HttpServletRequest request,
			MultipartFile thumbnail,
			List<MultipartFile> files) {
		// if 썸네일이 url로 변경 파일 변경시 분기해서 저장 수정
		// 사진 파일 수정
		
		hotspotService.updateHotspotById(hotspot);
		return "success"; // 문자열을 리턴해야한다 jsp가 아니라
	}
		
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public String delete(@PathVariable int id) {
		hotspotService.deleteHotspotById(id);
		// cascade 설정으로 attach리스트도 삭제해야함
		return "success";
	}
	
	@GetMapping("search/list")
	public String searchlist(@ModelAttribute("searchCriteria") SearchCriteria scri,
			Model model) {
		
		int totalCount = hotspotService.getTotalCount();
		
		PageDTO pageMaker = new PageDTO(scri, totalCount);
		
		model.addAttribute("searchHList", pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		return "hotspot/hotspotsearch";
		
	}
}
