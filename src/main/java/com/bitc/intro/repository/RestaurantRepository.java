package com.bitc.intro.repository;

import java.util.List;

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
	
	public int getTotalCountSpotId(int id) {
		return restaurantMapper.getTotalCountBySpotId(id);
	};
	
	public int getRestaurantById(int id) {
		return restaurantMapper.getRestaurantById(id);
	};
	
	public List<Restaurant> getRestaurants() {
		return restaurantMapper.getRestaurants();
	};
	
	public void deleteById(int id) {
		restaurantMapper.deleteById(id);
	};
	
	public void updateRestaurantById(Restaurant resutaurant) {
		restaurantMapper.updateRestaurantById(resutaurant);
	};
	
	public List<Restaurant> getRestaurantsBySpotIdWithPage(Hotspot hotspot, CriteriaDetail cri) {
		return restaurantMapper.getRestaurantsBySpotIdWithPage(hotspot, cri);
	};
}
