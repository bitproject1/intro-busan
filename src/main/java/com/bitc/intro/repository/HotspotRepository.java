package com.bitc.intro.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.mapper.HotspotMapper;

@Repository
public class HotspotRepository {
	
	@Autowired
	private HotspotMapper hotspotMapper;
	
	public Hotspot findById(int id) {
		return hotspotMapper.findById(id);
	}
}
