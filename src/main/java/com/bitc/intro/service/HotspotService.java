package com.bitc.intro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.Hotspot;
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
	
}
