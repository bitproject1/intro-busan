package com.bitc.intro.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.mapper.RestaurantMapper;

@Repository
public class RestaurantRepository {
	
	@Autowired
	private RestaurantMapper restaurantMapper;
	
	public void insert(Restaurant restaurant) {
		restaurantMapper.insert(restaurant);
	};
	
	public int getTotalCount() {
		return restaurantMapper.getTotalCount();
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
	
	public List<Restaurant> getRestaurantsBySpotId(int id) {
		return restaurantMapper.getRestaurantsBySpotId(id);
	};
}
