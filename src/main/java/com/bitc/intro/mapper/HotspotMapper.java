package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitc.intro.domain.Criteria;
<<<<<<< HEAD
import com.bitc.intro.domain.Hotspot;
=======
import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
<<<<<<< HEAD
import com.bitc.intro.domain.HotspotDetailVO;
import com.bitc.intro.domain.Restaurant;
>>>>>>> 900263c36c5a9b8a29aecf99bc3df8bd36fff5ce
=======
>>>>>>> main

public interface HotspotMapper {
	
	// 관광지 1건 찾기
	Hotspot findById(int id);
	Hotspot getHotspot(@Param("id") int id);
	
	//총 갯수가져오기
	int getTotalCount();
	
<<<<<<< HEAD
	// 관광지 전체 찾기
	List<Hotspot> getHotspots();
	// 페이징 적용된 글 내용 가져오기
	List<Hotspot> getHotspotsWithPaging(Criteria cri);
=======
	// 전체가져오기
	List<Hotspot> getHotspots();
	
>>>>>>> 900263c36c5a9b8a29aecf99bc3df8bd36fff5ce
	// 페이징 적용된 글 내용 가져오기
	List<Hotspot> getHotspotsWithPaging(Criteria cri);
	
	// 관광지 전체 개수 가져오기
	int getTotalCount();
	
	// 관광지 1건 등록하기
	void insert(Hotspot hotspot);
	
	// 관광지 1건 삭제하기
	void deleteHotspotById(int id);
	
	// 관광지 1건 수정하기
	void updateHotspotById(Hotspot hotspot);
	
	// 관광지 주변 식당 전체 가져오기
	Hotspot getRestsWithPaging(int param1, CriteriaDetail param2);
	
	int getTotalCountBySpotId(int id);
	
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 900263c36c5a9b8a29aecf99bc3df8bd36fff5ce
=======
>>>>>>> main
	int nextHotspotId();
	
	
}
