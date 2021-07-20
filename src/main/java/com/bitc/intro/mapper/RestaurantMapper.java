package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.Restaurant;

public interface RestaurantMapper {
	
	void insert(Restaurant restaurant);
	
	Restaurant getRestaurantById(int id);
	
	List<Restaurant> getRestaurants();
	
	void deleteById(int id);
	
	void updateRestaurantById(Restaurant resutaurant);
	
	// 관광지 detail의 페이징 용 맵퍼 
	int getTotalCountBySpotId(Hotspot hotspot);
	
	List<Restaurant> getRestaurantsBySpotIdWithPage(Hotspot param1, CriteriaDetail param2);
	
	int getLoveCount(int rid);
	
	Integer getRecommendationsByage(int rid);
	
	String getRecommendationsByGender(int rid);
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
	
>>>>>>> 900263c36c5a9b8a29aecf99bc3df8bd36fff5ce
>>>>>>> 5b5d0cea5b062ee947d290728f4ec910671664e7
	void increaseLove(int rid);
	
	void decreaseLove(int rid);

}	
