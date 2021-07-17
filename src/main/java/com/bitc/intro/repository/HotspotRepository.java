package com.bitc.intro.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.HotspotDetailVO;
import com.bitc.intro.mapper.HotspotMapper;

@Repository
public class HotspotRepository {
	
	@Autowired
	private HotspotMapper hotspotMapper;
	
	public Hotspot findById(int id) {
		return hotspotMapper.findById(id);
	}
	
	// 페이징 적용된 글 내용 가져오기
	public List<Hotspot> getHotspotsWithPaging(Criteria cri) {
		return hotspotMapper.getHotspotsWithPaging(cri);
	};
	
	public int getTotalCount() {
		return hotspotMapper.getTotalCount();
	};
		
		// 관광지 1건 등록하기
	public void insert(Hotspot hotSpot) {
		hotspotMapper.insert(hotSpot);
	};
		
		// 관광지 1건 수정하기
	public void updateHotspotById(Hotspot hotspot) {
		hotspotMapper.updateHotspotById(hotspot);
	};
		
		// 관광지 1건 삭제하기
	public void deleteHotspotById(int id) {
		hotspotMapper.deleteHotspotById(id);
	};
	
	public Hotspot getRestsWithPaging(int id) {
		return hotspotMapper.getRestsWithPaging(id);
	};
	
	public int getTotalCountBySpotId(int id) {
		return hotspotMapper.getTotalCountBySpotId(id);
	}
}
