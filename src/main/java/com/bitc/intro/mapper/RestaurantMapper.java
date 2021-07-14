package com.bitc.intro.mapper;

import java.util.List;

import com.bitc.intro.domain.Restaurant;

public interface RestaurantMapper {
	
	void insert(Restaurant restaurant);
	
	int getTotalCount();
	
	int getRestaurantById(int id);
	
	List<Restaurant> getRestaurants();
	
	void deleteById(int id);
	
	void updateRestaurantById(Restaurant resutaurant);
	
	List<Restaurant> getRestaurantsBySpotId(int id);
}	
