package com.bitc.intro.mapper;

import java.util.List;

import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.Restaurant;

public interface RestaurantMapper {
	
	void insert(Restaurant restaurant);
	
	int getRestaurantById(int id);
	
	List<Restaurant> getRestaurants();
	
	void deleteById(int id);
	
	void updateRestaurantById(Restaurant resutaurant);
	
	// 관광지 detail의 페이징 용 맵퍼 
	int getTotalCountBySpotId(int id);
	
	List<Restaurant> getRestaurantsBySpotIdWithPage(Hotspot hotspot, CriteriaDetail cri);
}	
