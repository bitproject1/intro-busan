package com.bitc.intro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.mapper.RestaurantMapper;

@Repository
public class RestaurantRepository {
	
	@Autowired
	private RestaurantMapper restaurantMapper;
	
	public void insert(Restaurant restaurant) {
		restaurantMapper.insert(restaurant);
	};
	
	public Restaurant getRestaurantById(int rid) {
		return restaurantMapper.getRestaurantById(rid);
	};
	
	public List<Restaurant> getRestaurants() {
		return restaurantMapper.getRestaurants();
	};
	
	public void deleteById(int rid) {
		restaurantMapper.deleteById(rid);
	};
	
	public void updateRestaurantById(Restaurant resutaurant) {
		restaurantMapper.updateRestaurantById(resutaurant);
	};
	
	public int getTotalCountSpotId(Hotspot hotspot) {
		return restaurantMapper.getTotalCountBySpotId(hotspot);
	};
	
	public List<Restaurant> getRestaurantsBySpotIdWithPage(Hotspot hotspot, CriteriaDetail cri) {
		return restaurantMapper.getRestaurantsBySpotIdWithPage(hotspot, cri);
	};
	
	public int getLoveCount(int rid) {
		return restaurantMapper.getLoveCount(rid);
	}
	
	public Integer getRecommendationsByage(int rid) {
		return restaurantMapper.getRecommendationsByage(rid);
	}
	
	public String getRecommendationsByGender(int rid) {
		return restaurantMapper.getRecommendationsByGender(rid);
	}
	
	public void increaseLove(int rid) {
		restaurantMapper.increaseLove(rid);
	}
	
	public void decreaseLove(int rid) {
		restaurantMapper.decreaseLove(rid);
	}

}
