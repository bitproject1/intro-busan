package com.bitc.intro.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.HotspotDetailVO;
import com.bitc.intro.repository.HotspotRepository;

@Service
public class HotspotService {
	
	@Autowired
	private HotspotRepository hotspotRepository;
	
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
	
	public Hotspot getRestsWithPaging(int id) {
		return hotspotRepository.getRestsWithPaging(id);
	};
	
	public int getTotalCountBySpotId(int id) {
		return hotspotRepository.getTotalCountBySpotId(id);
	}
}
