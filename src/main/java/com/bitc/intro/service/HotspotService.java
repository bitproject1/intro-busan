package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.AttachVO;
/*import com.bitc.intro.domain.AttachVO;*/
import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.repository.AttachRepository;
/*import com.bitc.intro.repository.AttachRepository;*/
import com.bitc.intro.repository.HotspotRepository;

@Service
public class HotspotService {
	
	@Autowired
	private HotspotRepository hotspotRepository;
	
	@Autowired
	private AttachRepository attachRepository;
	
	// 관광지 1건 찾기
	@Transactional
	public Hotspot findById(int num) {
		Hotspot hotspot = hotspotRepository.findById(num);
		return hotspot;
	}
	
	public List<Hotspot> getHotspots() {
		return hotspotRepository.getHotspots();
	}
	
	public List<Hotspot> getHotspotsWithPaging(Criteria cri) {
		return hotspotRepository.getHotspotsWithPaging(cri);
	};
	
	public int getTotalCount() {
		return hotspotRepository.getTotalCount();
	}
	
	public void insert(Hotspot hotspot) {
		hotspotRepository.insert(hotspot);
	}
	
	public void updateHotspotById(Hotspot hotspot) {
		hotspotRepository.updateHotspotById(hotspot);
	}
	
	public void deleteHotspotById(int id) {
		hotspotRepository.deleteHotspotById(id);
	}
	
	public Hotspot getRestsWithPaging(int param1, CriteriaDetail param2) {
		return hotspotRepository.getRestsWithPaging(param1,param2);
	}

	
	public int getTotalCountBySpotId(int id) {
		return hotspotRepository.getTotalCountBySpotId(id);
	}
	
	public int nextHotspotId() {
		return hotspotRepository.nextHotspotId();
	}
	
	@Transactional // hotspot , attachList insert 트렌잭션 처리
	public void insertHotspotAndAttaches(Hotspot hotspot, List<AttachVO> attachList) {
		
		hotspotRepository.insert(hotspot);
		
		if(attachList.size() > 0) {
			for ( AttachVO attachVO : attachList ) {
				attachRepository.insertAttach(attachVO); // 첨부파일 정보 등록 개수 만큼
			}
		}
	}
}
