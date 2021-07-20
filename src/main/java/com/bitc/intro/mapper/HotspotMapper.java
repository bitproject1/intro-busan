package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitc.intro.domain.Hotspot;

public interface HotspotMapper {
	
	// 관광지 1건 찾기
	Hotspot findById(int id);
	Hotspot getHotspot(@Param("id") int id);
	
	// 관광지 전체 찾기
	List<Hotspot> findAll();
	
	// 페이징 적용된 글 내용 가져오기
	List<Hotspot> fidnAllWithPaging();
	
	// 관광지 1건 등록하기
	void insert(Hotspot hotspot);
	
	// 관광지 1건 삭제하기
	void deleteHotspotById(int id);
	
	// 관광지 1건 수정하기
	void updateHotspotById(Hotspot hotspot);
	
	// 관광지 주변 식당 정보
	Hotspot getRestsWithPaging(int id);
	
	int getTotalCountBySpotId(int id);
	
	int nextHotspotId();
	
}
