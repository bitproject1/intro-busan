package com.bitc.intro.mapper;

import java.util.List;

import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.Hotspot;

public interface HotspotMapper {
	
	// 관광지 1건 찾기
	Hotspot getHotspot(int id);
	
	// 관광지 전체 찾기
	List<Hotspot> getHotspots();
	
	// 페이징 적용된 글 내용 가져오기
	List<Hotspot> getHotspotsWithPaging(Criteria cri);
	
	//totalcount
	int getTotalCount();
	
	// 관광지 1건 등록하기
	void insert(Hotspot hotSpot);
	
	// 관광지 1건 삭제하기
	void deleteHotspotById(int id);
	
	// 관광지 1건 수정하기
	void updateHotspotById(Hotspot hotspot);
	
	
	
}
